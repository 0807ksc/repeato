# Repeato 프로젝트 기본 컨텍스트

## 1. 배경
- 목표: `Ebbinghaus forgetting curve`(망각곡선) 기반 암기 앱을 만든다.
- 핵심 사용 예시:
  - 영어 단어 학습
  - 한자 암기
  - 구구단 암기

## 2. 제품 방향
- 카드형 UX를 중심으로 짧고 반복적인 학습 경험을 제공한다.
- 학습 스케줄은 망각곡선 기반으로 자동 최적화한다.
- 여러 학습 과제를 동시에 운영할 수 있게 설계한다.
- 학습 데이터와 진행 상황은 동기화/모니터링 가능해야 한다.
- 콘텐츠 비즈니스 모델(샘플 체험 후 결제)을 지원한다.

## 3. 초기 요구사항(원문 기반)
1. 카드형 암기 UX
2. `Ebbinghaus forgetting curve` 기반 학습 스케줄
3. 동시 N가지 학습 과제(예: 일상 영어단어, 구구단 100단, 천자문)
4. Google Drive 동기화
5. 학습 진행 상황 모니터링
6. 인앱 결제를 통한 학습 데이터 구매(학습 샘플 3일 사용 후 결제)

## 4. 브랜드/네이밍 컨텍스트
- 요청 기준:
  - 학습 앱 느낌이 과하게 강하지 않을 것
  - 가볍고 친숙한 인상
  - 암기와 이중 의미(동음이의/연상) 가능성
  - 영화/만화 캐릭터 같은 애칭 감성

### 이름 후보 5개
1. 까먹지마
2. 리핏토
3. 깜빡이
4. 한입복습
5. 메모몽

### 리핏토 영문 표기 옵션
1. `Repeato` (글로벌/브랜드 확장성 측면에서 가장 자연스러운 선택)
2. `Repitto` (한국어 발음 유사성 강조)
3. `Repeetto` (캐릭터 톤 강화, 장난스러운 인상)

### 현재 권장안
- 앱명 1순위: `Repeato`
- 대안: `Repitto`

## 5. 문서 운영 기준
- 상세 요구사항 정의는 `doc/plan-checklist.md`를 기준으로 확장한다.
- 본 문서는 프로젝트의 시작점(문제 정의/방향/이름 컨텍스트)을 고정하는 목적이다.

## 6. Work 문서 인덱스
- 산출물 가치가 있는 상세 기획/정책/결정 문서는 `doc/work`에 보존한다.
- 본 문서는 요약 컨텍스트와 참조 인덱스 역할을 유지한다.

### Active Work Documents
1. `doc/work/repeato-constitution-v1.md`
- 설명: Repeato 헌법 v1(전 Agent 3차 검토 결과)
- 사용 시점: 기획/정책/핵심 기능 변경 검토 시

2. `doc/work/index.md`
- 설명: `doc/work` 문서 목록 및 상태
- 사용 시점: 필요한 상세 문서 탐색 시

3. `doc/work/flutter-local-dev-setup-v1.md`
- 설명: Flutter 로컬 개발환경 구성/실행 가이드
- 사용 시점: iOS/Android 에뮬레이터 로컬 검증 환경 준비 시

4. `doc/work/repeato-menu-and-screen-spec-v1.md`
- 설명: Repeato 필수 메뉴/화면 구조 상세 설계
- 사용 시점: 기능 상세 기획, 와이어프레임, UI 구현 착수 시

5. `doc/work/repeato-today-tab-spec-v1.md`
- 설명: `Today` 탭 통합 상세 기획 및 리드백 반영 문서
- 사용 시점: Today 탭 구현/테스트/사용성 검증 시

6. `doc/work/repeato-decks-tab-spec-v1.md`
- 설명: `Decks` 탭 상세 기획 및 연동 질문 문서
- 사용 시점: 덱 구조/상태/Today 연동 검토 시

7. `doc/work/repeato-add-tab-spec-v1.md`
- 설명: `Add` 탭 상세 기획 및 입력/가져오기 정책 문서
- 사용 시점: 카드 입력 UX 및 저장 정책 검토 시

8. `doc/work/repeato-insights-tab-spec-v1.md`
- 설명: `Insights` 탭 상세 기획 및 KPI/이벤트 검토 문서
- 사용 시점: 통계 UX/지표 정의/이벤트 스키마 설계 시

9. `doc/work/repeato-profile-tab-spec-v1.md`
- 설명: `Profile` 탭 상세 기획 및 동기화/결제/보안 검토 문서
- 사용 시점: 계정/동기화/결제 UX와 서버 범위 검토 시

10. `doc/work/repeato-tab-orchestration-v1.md`
- 설명: 5개 탭 병렬 검토와 PM 조율 기준 문서
- 사용 시점: 탭별 선행작업/대기/재개 순서 조율 시

11. `doc/work/repeato-delivery-organization-v1.md`
- 설명: 작업 시작 전 조직도, 단계별 책임, 태깅 규칙 문서
- 사용 시점: 작업 착수 전 담당 조직 세팅과 task 태깅 시

12. `doc/work/repeato-github-tracking-workflow-v1.md`
- 설명: GitHub 이슈/브랜치/PR/머지 강제 추적 절차 문서
- 사용 시점: 개발 작업 착수 전 GitHub tracking 절차 확인 시

13. `doc/work/repeato-workflow-extraction-v1.md`
- 설명: 작업/조직 관리 절차를 skill/plugin으로 분리하기 위한 산출물 문서
- 사용 시점: workflow 분리 후보와 부가 산출물 관리 시

14. `doc/work/repeato-org-leader-workflow-v1.md`
- 설명: 조직 리더별 task 관리 분리 규칙 문서
- 사용 시점: PM/각 조직 리더의 task 운영 절차 분리 시

15. `doc/work/repeato-workflow-agent-group-v1.md`
- 설명: workflow 분리/추출 전담 Agent 그룹 정의 문서
- 사용 시점: 조직별 workflow 분리 협업 시

16. `doc/work/repeato-backup-resume-workflow-v1.md`
- 설명: Workflow Enablement Group이 관리하는 재사용 가능한 backup/resume 표준 workflow
- 사용 시점: 세션 종료 전 context 백업과 다음 세션 resume 준비 시

17. `doc/work/repeato-resume-snapshot-template-v1.md`
- 설명: resume snapshot 문서 템플릿
- 사용 시점: 새 snapshot 문서 작성 시

18. `doc/work/repeato-cross-tab-conflict-review-v1.md`
- 설명: 탭 간 충돌 범위와 PM 조정안 정리 문서
- 사용 시점: 구현 전 공통 상태/정렬/완료 기준 충돌 해소 시

19. `doc/work/repeato-qa-master-scenario-v1.md`
- 설명: 전체 시나리오 기반 QA 테스트 계획 및 시뮬레이션 결과
- 사용 시점: QA 시나리오 확정, 회귀 기준 수립 시

20. `doc/work/repeato-local-first-architecture-v1.md`
- 설명: 앱 도메인, 데이터 모델, SQLite, 다중 디바이스 동기화, 서버리스 판단 문서
- 사용 시점: 로컬 저장/동기화/도메인 설계 확정 시

21. `doc/work/repeato-service-open-plan-v1.md`
- 설명: PM 조율 기준 서비스 오픈까지의 실행 계획 문서
- 사용 시점: 단계별 실행 계획과 blocked 해제 조건 관리 시

22. `doc/work/repeato-user-feedback-groups-v1.md`
- 설명: 사용자 그룹 구성과 피드백 설명 스크립트 문서
- 사용 시점: 반복 작업의 사용자 피드백 수집 준비 시

23. `doc/work/repeato-iteration-001-loop-v1.md`
- 설명: 첫 반복의 개발-QA-사용자 피드백-PM 결정 결과 문서
- 사용 시점: 반복 작업 히스토리와 다음 우선순위 결정 시

24. `doc/work/repeato-resume-snapshot-2026-03-08-v1.md`
- 설명: 현재 작업 컨텍스트 백업 및 resume 시작 기준 문서
- 사용 시점: 다음 세션에서 context 복원 후 작업 재개 시

25. `doc/work/repeato-tab-icon-system-v1.md`
- 설명: Repeato 탭바 아이콘 시스템 및 적용 가이드
- 사용 시점: 탭바 시각 자산 적용/교체 시

26. `doc/work/repeato-user-interview-001.md`
- 설명: 핵심 사용자 인터뷰 결과(v1)
- 사용 시점: 상세 기획 의사결정(목표/콘텐츠/리마인드/학습 루프) 시

27. `doc/work/repeato-platform-strategy-v1.md`
- 설명: 플랫폼 전략(case1/case2) 비교 및 최종 권고안
- 사용 시점: 앱 구조/과금 구조/배포 전략 결정 시

28. `doc/work/repeato-m2-initial-build-v1.md`
- 설명: 중2 초급 영어 초기버전 구현 산출물(v1)
- 사용 시점: 개발 결과 리뷰/다음 구현 단계 정의 시

29. `doc/work/repeato-workflow-org-session-2026-03-08-v1.md`
- 설명: 현재 컨텍스트 공유용 workflow 조직 활성 세션 문서
- 사용 시점: workflow 규칙 반영 상태 확인, 다음 세션 재개 시

30. `doc/work/repeato-insights-user-needs-review-2026-03-15-v1.md`
- 설명: `Insights`에서 사용자가 실제로 보고 싶어하는 항목에 대한 3차 회의체 재검토 문서
- 사용 시점: `Insights` KPI 우선순위 재정의, 덱 전체 진행률/오늘 잔량/약점 요약 구현 범위 확정 시

31. `doc/work/repeato-multi-deck-daily-study-review-2026-03-15-v1.md`
- 설명: 하루 학습을 여러 덱으로 운영하는 방향에 대한 재협의 및 2차 구현 기준 문서
- 사용 시점: 단일 덱 Today 구조를 다중 덱 Today 큐 구조로 전환할 때

32. `doc/work/repeato-multi-deck-cross-tab-alignment-2026-03-15-v1.md`
- 설명: 다중 덱 Today 상태를 `Insights`와 `Add`까지 일관되게 확장하기 위한 3차 협의 문서
- 사용 시점: 다중 덱 상태를 교차 탭으로 반영할 때
