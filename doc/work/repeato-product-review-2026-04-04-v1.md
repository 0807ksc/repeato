# Repeato Product Review 2026-04-04 v1

## 메타
- 버전: v1
- 작성일: 2026-04-04
- 상태: Active
- 목적: 현재 Repeato 제품을 실제로 기동/테스트한 뒤 추가 요구사항과 결함 후보를 정리한다.

## 1. 실행 증거
- 실행 환경:
  - Flutter `3.41.2`
  - 사용 가능 타깃: `macOS`, `Chrome`
- 실행 명령:
  - `flutter pub get`
  - `flutter analyze`
  - `flutter test`
  - `flutter run -d web-server --web-port 43123 --web-hostname 127.0.0.1`
- 결과:
  - `flutter analyze`: 통과
  - `flutter test`: 15개 시나리오 모두 통과
  - web-server 부팅: 성공

## 2. 실제로 확인된 현재 제품 범위
- 5탭 앱 셸(`Today`, `Decks`, `Add`, `Insights`, `Profile`)이 동작한다
- Today에서 3단계 응답과 세션 목표 변경이 가능하다
- Decks에서 다중 덱 구성과 특정 덱 즉시 학습이 가능하다
- Add에서 카드 입력, 저장, 최근 덱/최근 입력 재사용이 가능하다
- Insights에서 KPI/약점 요약/덱 확인 CTA가 동작한다
- Profile에서 오늘 학습 요약과 로컬 저장 상태 설명을 확인할 수 있다

## 3. 발견한 부족한 점
1. 학습 데이터를 외부에서 탐색/가져오는 사용자 흐름이 없다.
2. 로컬 영속 저장이 없어 앱 재실행 후 덱/세션/최근 입력이 유지되지 않을 가능성이 높다.
3. Profile이 현재 `로컬 전용` 설명에 머물러 있어 동기화/결제/권한 모델은 아직 제품 경험으로 이어지지 않는다.
4. 사용자 노출 UI에 리뷰성 문구가 남아 있다.
   - 예: `Iteration 1 리뷰 빌드`, `리뷰 설명`, `Deck Detail`

## 4. 추가 요구사항 후보

### 후보 A. Marketplace 학습 데이터 가져오기
- 배경:
  - 현재 Add는 직접 입력 중심이고, 학습 데이터 공급원이 앱 안에 없다.
- 필요 사용자 가치:
  - 사용자가 학습용 덱을 직접 만들지 않아도 바로 시작할 수 있어야 한다.
- 최소 요구사항:
  - 덱 탐색 목록
  - 무료/샘플/유료 구분
  - 가져오기 CTA
  - 가져온 덱이 Decks/Today/Add와 일관되게 연결
- 예상 태그/조직:
  - `#STAGE-B #TASK-TAB #TASK-COMMERCE #TASK-SYNC #ORG-PM #ORG-DESIGN #ORG-DATA`
  - 서버/결제 연동이 확정되면 `#ORG-BE` 추가

### 후보 B. 로컬 영속 저장
- 배경:
  - 현재 AppRoot 메모리 상태 중심 구조로 보이며 재실행 내구성이 부족하다.
- 최소 요구사항:
  - 카드/덱 저장
  - 오늘 학습 덱 유지
  - 최근 입력 유지
  - 세션 복원 범위 정의
- 예상 태그/조직:
  - `#STAGE-C #TASK-APP #TASK-DATA #ORG-ARCH #ORG-FE #ORG-DATA #ORG-QA`

### 후보 C. 리뷰용 임시 문구 제거
- 배경:
  - 현재 UI에 내부 리뷰용 설명이 노출된다.
- 최소 요구사항:
  - 리뷰용 문구 숨김 또는 개발 빌드 전용 처리
  - 영문 혼합 copy 정리
- 예상 태그/조직:
  - `#STAGE-D #TASK-TAB #ORG-FE #ORG-DESIGN #ORG-QA`

## 5. 자동 진행 판단
- 자동 진행 가능:
  - 제품 테스트 가이드 문서화
  - skill 생성
  - 리뷰 결과 기록
  - next-actions 후보 추가
- 사용자 확인 필요:
  - Marketplace 기능 자체 구현 착수
  - 결제/가져오기/서버 연동 범위 확정

## 6. 현재 추천 다음 액션
1. Marketplace 학습 데이터 탐색/가져오기 UX와 범위 문서화
2. SQLite 기반 로컬 영속 저장 우선순위 상향 검토
3. 리뷰용 UI 문구 제거 작업을 작은 문서/프런트엔드 정리 이슈로 분리
