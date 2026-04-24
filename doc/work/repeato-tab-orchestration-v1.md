# Repeato Tab Orchestration v1

## 메타
- 버전: v1
- 작성일: 2026-03-08
- 상태: Active
- 목적: 5개 탭 상세화 작업을 동시에 시작하되, 선행작업 의존성을 PM Agent가 조율하는 운영 기준

## 1. PM 오케스트레이션 원칙
- 모든 탭 검토는 동시에 시작한다.
- 각 탭 Agent는 자기 탭 문서를 먼저 작성하되, 연동 질문이 있으면 PM Agent를 통해 상대 탭 Agent에 질의한다.
- 선행작업이 필요한 탭은 `대기` 상태로 전환하고, PM Agent가 unblock 시점에 다시 실행 순서를 잡는다.
- 서버 의존성이 드러나면 PM Agent가 `Backend Engineer`를 해당 탭 라운드에 즉시 추가한다.
- 교차 탭 이슈는 PM Agent가 단일 backlog로 관리한다.

## 2. 탭별 기본 Agent 세트
1. Today
- `PM + Product Designer + Technical Architect + Frontend Engineer + QA Engineer + Education Specialist + Cognitive Science Specialist`

2. Decks
- `PM + Product Designer + Technical Architect + Frontend Engineer + QA Engineer`
- 조건부 추가: `Backend Engineer`

3. Add
- `PM + Product Designer + Technical Architect + Frontend Engineer + QA Engineer + Education Specialist`
- 조건부 추가: `Backend Engineer`

4. Insights
- `PM + Product Designer + Technical Architect + Frontend Engineer + QA Engineer + Data Analyst`
- 조건부 추가: `Backend Engineer`

5. Profile
- `PM + Product Designer + Technical Architect + Frontend Engineer + QA Engineer + Security/Privacy`
- 조건부 추가: `Backend Engineer + DevOps/SRE`

## 3. 병렬 시작 후 대기 규칙
### 3.1 바로 진행 가능
- Today 상세 UX
- Decks 목록/상세 UX
- Add 직접 입력 UX

### 3.2 선행작업 필요
- Today 스케줄러 구현: 스케줄 정책 확정 후 진행
- Insights 구현: KPI/이벤트 스키마 확정 후 진행
- Profile 동기화/결제 구현: 서버 범위 확정 후 진행
- Add 대량 가져오기: 카드 템플릿/중복 정책 확정 후 진행

## 4. PM Agent 작업 순서 조율표
1. 모든 탭 문서 초안 작성 시작
2. 교차 질문 수집
3. 선행작업 유무 판단
4. `ready / blocked / in_review / done` 상태 부여
5. 선행작업 완료 시 blocked 탭 재개
6. 각 탭의 3차 검토와 2회 리드백 완료 여부 확인

## 5. 현재 권장 순서
1. Today, Decks, Add 문서 상세화
2. 카드 템플릿/세션 규칙 확정
3. Insights KPI/이벤트 스키마 확정
4. Profile 로컬 설정 화면 구현
5. 동기화/결제는 기획안만 유지
6. 각 탭 구현 착수

## 6. 교차 탭 질문 라우팅 규칙
- `Today -> Decks`: 대기 카드 수와 덱 우선순위 노출 기준
- `Today -> Insights`: 완료/권장 완료 정의 일치 여부
- `Add -> Decks`: 새 카드 저장 후 덱 반영 시점
- `Add -> Today`: 새 카드 당일 큐 반영 여부
- `Insights -> Today`: 완료 상태와 지표 정의 연결
- `Profile -> Today`: 알림/리마인드와 세션 시작 추천 연결
- `Profile -> Add`: 구매 콘텐츠 진입 경로 연결

## 7. PM 공용 상태판
- `Today`: in_review
- `Decks`: in_review
- `Add`: in_review
- `Insights`: blocked by KPI/event schema
- `Profile`: in_review (sync/purchase implementation deferred)

## 8. 후속 작업
1. 각 탭 문서의 사용자 확인 질문을 실제 인터뷰 스크립트로 전환한다.
2. `doc/context/next-actions.md`를 PM 상태판 기준으로 재정렬한다.
3. 구현 착수 시 탭별 QA 시나리오를 테스트 케이스로 분리한다.
