# Repeato Cross-Tab Conflict Review v1

## 메타
- 버전: v1
- 작성일: 2026-03-08
- 상태: Active
- 목적: 5개 탭 상세 문서 간 충돌 범위를 검토하고 PM 조정안을 확정한다.

## 1. 참여 조직
- PM
- Product Designer
- Technical Architect
- Frontend Engineer
- Backend Engineer
- QA Engineer
- Data Analyst
- Security/Privacy

## 2. 검토 결과 요약
- 치명적 충돌: 없음
- 조정이 필요한 교차 탭 이슈: 7건
- 구현 전 선확정 필요: 4건
- 기획안만 유지하고 구현 보류 가능: 3건

## 3. 충돌 및 조정안

### 3.1 Today 완료 기준 vs Insights KPI 정의
- 충돌:
  - `Today`는 `완료`와 `권장 완료`를 구분한다.
  - `Insights`는 `오늘 완료율`을 단일 수치로 보여주려 한다.
- 리스크:
  - 사용자는 Today에서 완료로 봤는데 Insights에서는 미완료처럼 보일 수 있다.
- 조정안:
  - 시스템 기준은 `today_completion_status`로 단일 저장한다.
  - 값은 `not_started / in_progress / recommended_done / done`.
  - Today는 `recommended_done`와 `done`를 분리 표기한다.
  - Insights는 v1에서 `done`만 완료율에 포함하고, `recommended_done`은 보조 설명으로만 노출한다.
- PM 판단:
  - 지표는 보수적으로 집계한다. UX 문구는 유연하게 간다.

### 3.2 Today 덱 요약 vs Decks 우선순위 정렬
- 충돌:
  - Today는 과제별 대기 카드 요약을 최대 3개만 보여준다.
  - Decks는 모든 덱을 관리 대상으로 본다.
- 리스크:
  - Today 상단에 노출되는 덱과 Decks 상단 정렬 기준이 다르면 사용자가 혼란스러워한다.
- 조정안:
  - 공통 정렬 키를 `due_today desc -> overdue desc -> next_review_at asc -> deck_name asc`로 고정한다.
  - Today는 이 정렬 기준의 상위 3개만 노출한다.
  - Decks는 전체 목록을 동일 정렬로 보여준다.

### 3.3 Add 저장 직후 반영 시점 vs Today 스케줄러
- 충돌:
  - Add는 저장 직후 `Today로 이동` CTA를 제공한다.
  - Today는 추천 큐를 사전에 계산하는 구조를 가정한다.
- 리스크:
  - 새 카드가 즉시 반영되지 않으면 사용자가 저장 실패로 오해할 수 있다.
- 조정안:
  - 신규 카드는 기본값으로 `is_new = 1`, `available_at = created_at`로 저장한다.
  - Today 큐는 화면 재진입 시 재계산한다.
  - 단, 진행 중 세션에는 자동 삽입하지 않는다.
- PM 판단:
  - 저장 직후 새 세션부터 반영한다. 현재 세션은 안정성을 우선한다.

### 3.4 Deck 일시중지 상태 vs Insights 집계 분모
- 충돌:
  - Decks에서 덱을 일시중지할 수 있다.
  - Insights는 전체 지표를 계산할 때 어떤 덱을 분모에 넣을지 정의가 약하다.
- 리스크:
  - 중지한 덱까지 포함되면 완료율이 왜곡된다.
- 조정안:
  - `paused` 덱은 Today 큐와 일일 완료율 분모에서 제외한다.
  - 다만 주간/월간 히스토리에는 과거 기록을 유지한다.

### 3.5 Profile 목표 카드 수 설정 vs Today 기본 목표
- 충돌:
  - Today 문서는 추천 배치 `10장`, 기본 목표 `30장` 문맥을 갖는다.
  - Profile은 일일 목표 카드 수를 조정할 수 있게 한다.
- 리스크:
  - 탭마다 목표 숫자가 다르게 보일 수 있다.
- 조정안:
  - 전역 설정 키 `daily_goal_cards`를 둔다.
  - 초기 기본값은 `30`.
  - Today 추천 배치 `10장`은 목표와 별개인 UI 배치 값으로 유지한다.

### 3.6 Profile 동기화 상태 노출 vs Today 오프라인 학습 허용
- 충돌:
  - Today는 오프라인에서도 학습 가능하다고 정의한다.
  - Profile은 동기화 상태를 신뢰 지표로 강조한다.
- 리스크:
  - 동기화 실패가 학습 불가로 오해될 수 있다.
- 조정안:
  - 동기화 실패는 `sync_status`로 별도 저장하되 학습 세션 차단 조건으로 쓰지 않는다.
  - Today에는 간단 상태만 노출하고, 상세 오류는 Profile에서만 푼다.

### 3.7 Add 유료 콘텐츠 진입 vs Profile 결제/체험
- 충돌:
  - Add는 콘텐츠 확장 입구가 될 수 있다.
  - Profile은 체험/결제 허브로 정의돼 있다.
- 리스크:
  - 유료 진입점이 분산되면 가격/권한 인지가 약해진다.
- 조정안:
  - v1은 Add를 `사용자 입력/가져오기` 전용으로 제한한다.
  - 콘텐츠 구매/체험 관리는 Profile에서만 안내한다.
- PM 판단:
  - 결제 구현 전까지 Add에 상점 역할을 넣지 않는다.

## 4. 구현 전 선확정 항목
1. `today_completion_status` 상태 enum
2. 덱 공통 정렬 기준
3. 신규 카드의 Today 반영 시점
4. `paused` 덱의 KPI 제외 규칙

## 5. 보류 가능 항목
1. 결제/콘텐츠 스토어 진입점
2. 서버 영수증 검증 방식
3. 다중 기기 실시간 푸시 동기화

## 6. QA 확인 포인트
- Today와 Insights의 완료 정의가 같은 데이터를 바라보는가
- Add 저장 후 Today/Decks가 재진입 시점에 갱신되는가
- Deck 중지 후 Today/Insights 분모에서 제외되는가
- 오프라인 상태에서도 학습이 차단되지 않는가

## 7. 최종 결론
- 현 단계에서 탭 문서 간 방향 충돌은 없고, 대부분은 공통 상태 키와 집계 규칙을 정의하면 해소된다.
- 구현 선행 기준은 `공통 상태 모델`과 `로컬 데이터 기준`을 먼저 고정하는 것이다.
