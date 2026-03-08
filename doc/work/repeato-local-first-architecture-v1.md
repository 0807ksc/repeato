# Repeato Local-First Architecture v1

## 메타
- 버전: v1
- 작성일: 2026-03-08
- 상태: Active
- 목적: 앱 도메인, 데이터 모델, SQLite 스키마, 다중 디바이스 동기화, 서버리스 판단을 정리한다.
- 구현 범위: 설계만 포함, 실제 서버/동기화/결제 구현은 포함하지 않음

## 1. PM 1차 판단
- 최초 버전에서는 동기화/결제 서버를 구현하지 않는다.
- 동기화/결제는 기획안과 데이터 경계만 정의한다.
- 서버리스 우선 원칙을 유지하고, 꼭 필요한 시점까지 별도 백엔드 구축을 미룬다.

## 2. 아키텍처 원칙
- 로컬 SQLite를 단일 진실원으로 둔다.
- 앱은 오프라인 우선으로 동작한다.
- 동기화는 서버 대신 사용자의 Google Drive 앱 전용 저장소를 우선 검토한다.
- 결제는 설계만 정의하고 v1에서는 entitlement 검증 구현을 하지 않는다.

## 3. 공식 문서 기반 판단
- Flutter 공식 문서는 SQLite 사용 시 `sqflite`를 권장하는 예시를 제공한다.
- Google Drive API 공식 문서는 `appDataFolder`를 앱 전용 숨김 저장소로 정의한다.
- Flutter `in_app_purchase` 공식 문서는 소모성 상품 복원 책임이 앱 개발자에게 있고, 자체 서버가 필요할 수 있음을 시사한다.
- Google Play 결제 공식 문서는 서버 측 API가 추가 보호를 제공한다고 설명한다.

## 4. 앱 도메인 정의

### 4.1 학습 도메인
- ContentPack
- Deck
- Card
- CardVariant
- ReviewQueue
- Session
- ReviewEvent
- DailyGoal
- DailyProgress

### 4.2 운영 도메인
- AppSetting
- DeviceIdentity
- SyncState
- SyncOperation
- PurchasePlan
- Entitlement

### 4.3 분석 도메인
- MetricSnapshot
- WeakCardSnapshot
- StreakSnapshot

## 5. 핵심 엔티티 설계

### 5.1 Deck
- `deck_id`
- `content_pack_id`
- `name`
- `status` (`active / paused / completed`)
- `daily_new_limit`
- `daily_review_limit`
- `sort_order`
- `created_at`
- `updated_at`

### 5.2 Card
- `card_id`
- `deck_id`
- `card_type` (`word / sentence / formula / custom`)
- `front_text`
- `back_text`
- `hint_text`
- `example_text`
- `difficulty`
- `source_type` (`builtin / user_created / imported / purchased`)
- `created_at`
- `updated_at`
- `deleted_at`

### 5.3 Card Progress
- `card_id`
- `stability`
- `difficulty_score`
- `last_reviewed_at`
- `next_review_at`
- `lapse_count`
- `success_count`
- `current_state` (`new / learning / review / relearning`)
- `today_completion_status`

### 5.4 Review Event
- `review_event_id`
- `device_id`
- `card_id`
- `session_id`
- `score` (`know / unsure / dont_know`)
- `reviewed_at`
- `scheduled_before`
- `scheduled_after`
- `created_at`

### 5.5 Session
- `session_id`
- `device_id`
- `started_at`
- `ended_at`
- `target_cards`
- `completed_cards`
- `known_count`
- `unsure_count`
- `again_count`
- `status` (`started / paused / completed / abandoned`)

### 5.6 Sync State
- `device_id`
- `last_local_op_seq`
- `last_uploaded_op_seq`
- `last_downloaded_cursor`
- `last_sync_at`
- `sync_status`
- `sync_error_code`

## 6. SQLite 설계안

### 6.1 테이블 목록
1. `content_packs`
2. `decks`
3. `cards`
4. `card_progress`
5. `sessions`
6. `review_events`
7. `daily_progress`
8. `metric_snapshots`
9. `settings`
10. `entitlements`
11. `sync_state`
12. `sync_operations`

### 6.2 스키마 초안
```sql
CREATE TABLE decks (
  deck_id TEXT PRIMARY KEY,
  content_pack_id TEXT,
  name TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'active',
  daily_new_limit INTEGER NOT NULL DEFAULT 20,
  daily_review_limit INTEGER NOT NULL DEFAULT 30,
  sort_order INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL
);

CREATE TABLE cards (
  card_id TEXT PRIMARY KEY,
  deck_id TEXT NOT NULL REFERENCES decks(deck_id),
  card_type TEXT NOT NULL,
  front_text TEXT NOT NULL,
  back_text TEXT NOT NULL,
  hint_text TEXT,
  example_text TEXT,
  difficulty REAL NOT NULL DEFAULT 0.3,
  source_type TEXT NOT NULL,
  created_at TEXT NOT NULL,
  updated_at TEXT NOT NULL,
  deleted_at TEXT
);

CREATE TABLE card_progress (
  card_id TEXT PRIMARY KEY REFERENCES cards(card_id),
  stability REAL NOT NULL DEFAULT 0.0,
  difficulty_score REAL NOT NULL DEFAULT 0.3,
  last_reviewed_at TEXT,
  next_review_at TEXT,
  lapse_count INTEGER NOT NULL DEFAULT 0,
  success_count INTEGER NOT NULL DEFAULT 0,
  current_state TEXT NOT NULL DEFAULT 'new',
  today_completion_status TEXT NOT NULL DEFAULT 'not_started'
);

CREATE TABLE review_events (
  review_event_id TEXT PRIMARY KEY,
  device_id TEXT NOT NULL,
  card_id TEXT NOT NULL REFERENCES cards(card_id),
  session_id TEXT NOT NULL,
  score TEXT NOT NULL,
  reviewed_at TEXT NOT NULL,
  scheduled_before TEXT,
  scheduled_after TEXT,
  created_at TEXT NOT NULL
);

CREATE TABLE sync_operations (
  op_id TEXT PRIMARY KEY,
  device_id TEXT NOT NULL,
  entity_type TEXT NOT NULL,
  entity_id TEXT NOT NULL,
  op_type TEXT NOT NULL,
  payload_json TEXT NOT NULL,
  op_seq INTEGER NOT NULL,
  created_at TEXT NOT NULL
);
```

### 6.3 인덱스
- `idx_cards_deck_id`
- `idx_card_progress_next_review_at`
- `idx_review_events_card_id_reviewed_at`
- `idx_sync_operations_device_seq`

## 7. 탭별 공통 상태 키
- `daily_goal_cards`
- `today_completion_status`
- `sync_status`
- `deck.status`
- `card_progress.next_review_at`
- `session.status`

## 8. 다중 디바이스 동기화 설계

### 8.1 기본 전략
- 로컬 SQLite 유지
- 동기화 단위는 전체 DB 파일보다 `operation log + 주기적 snapshot` 혼합
- 기기별 `device_id`를 발급한다.
- 각 변경은 `sync_operations`에 append-only로 기록한다.

### 8.2 Google Drive 기반 서버리스안
- 저장 위치:
  - Drive API `appDataFolder`
- 업로드 파일:
  - `manifest.json`
  - `snapshot.sqlite3.enc`
  - `ops/<device_id>/<op_seq>.json`
- 병합 방식:
  - 카드/덱/설정은 `updated_at` 기반 LWW
  - ReviewEvent/Session은 append-only merge
  - Entitlement는 계획만 정의, v1 미구현

### 8.3 충돌 해결
- 사용자 입력 카드 편집:
  - 가장 최근 `updated_at` 우선
- ReviewEvent:
  - 중복 `review_event_id` 제거 후 모두 보존
- Deck 상태:
  - `paused`와 `completed` 충돌 시 최신 `updated_at` 우선

### 8.4 동기화 주기
- MVP-1: 동기화 미구현
- MVP-2 계획:
  - 수동 동기화
  - 앱 시작 시 pull 시도
  - 앱 백그라운드 전 snapshot/ops flush

## 9. 서버리스 옵션 검토

### 옵션 A. 순수 클라이언트 + Google Drive 앱 데이터 폴더
- 장점:
  - 별도 서버 없음
  - 기존 요구사항과 일치
  - 사용자 데이터가 사용자의 Drive에 저장됨
- 단점:
  - 실시간 동기화와 충돌 조정이 제한적
  - 권한/토큰/충돌 복구 UX를 앱에서 처리해야 함
- PM 1차 판단:
  - MVP-2 기본안으로 채택 가능

### 옵션 B. Cloudflare Workers/D1 같은 서버리스 백엔드
- 장점:
  - 동기화 충돌/권한/집계 제어가 쉬움
  - 향후 결제 entitlement 공유에 유리
- 단점:
  - "서버 없음" 원칙에서 한 단계 멀어짐
  - 운영 포인트와 개인정보 고려가 늘어남
- PM 1차 판단:
  - MVP-1, 기획 단계에는 불필요
  - 결제 구현과 다중 디바이스 entitlement가 필요해질 때 재검토

### 옵션 C. 구매/동기화 모두 기기 단독 처리
- 장점:
  - 구현 단순
- 단점:
  - 다중 디바이스 복원과 신뢰성이 약함
- PM 1차 판단:
  - 초기 로컬 MVP까지만 허용

## 10. 결제에 대한 PM 1차 판단
- 현재 요청 범위에서는 결제는 기획안만 유지한다.
- 실제 결제 구현 시점 전까지는 `entitlements` 테이블과 상태 모델만 준비한다.
- 다중 디바이스에서 구매 복원과 검증 신뢰도가 필요해지면, PM이 먼저 서버리스 백엔드 필요 여부를 재판단한다.
- 그때도 해결이 불명확하면 사용자에게 의사결정을 요청한다.

## 11. 추천 기술 조합
- Flutter 로컬 DB: `sqflite`
- 구조화 쿼리/마이그레이션: `drift` 도입 검토
- 암호화:
  - DB 전체 암호화는 후순위
  - MVP-2에서는 sync snapshot 파일만 우선 암호화 검토
- 동기화 저장소:
  - Google Drive `appDataFolder`

## 12. 단계별 구현 경계
1. MVP-1
- SQLite 도입
- Today/Decks/Add/Insights 로컬 상태 저장
- Profile은 로컬 설정만 제공

2. MVP-2
- Google Drive 수동 동기화
- operation log + snapshot 업로드/다운로드
- 오프라인 후 재동기화

3. MVP-3
- 결제/체험
- entitlement 검증 방식 재판단
- 필요 시 서버리스 백엔드 검토

## 13. 외부 참고
- Google Drive API `appDataFolder`: https://developers.google.com/workspace/drive/api/guides/appdata
- Flutter SQLite cookbook: https://docs.flutter.dev/cookbook/persistence/sqlite
- Flutter in-app purchase overview: https://docs.flutter.dev/resources/in-app-purchases-overview
- Google Play purchase verification: https://developer.android.com/google/play/billing/security
