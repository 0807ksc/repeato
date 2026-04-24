# Work Document Index

## 목적
- 산출물 가치가 있는 문서를 `doc/work` 하위에 보존/관리한다.
- `doc/reference/project-context.md`는 상세 본문이 아닌 인덱스/참조 허브 역할을 한다.
- 기능 단위 상세 spec/진행 메모는 GitHub issue/PR을 우선 저장소로 사용한다.
- 여러 이슈에서 재사용되는 로컬 문서만 `doc/work`에 유지하고, 활성 사용이 끝나면 `doc/work/archive/`로 이동하거나 제거한다.

## 상태 기준
- `Active`: 현재도 로컬에서 직접 참조하는 문서
- `Archived`: 이력 보존만 필요해 `doc/work/archive/`에 둔 문서
- `Issue-managed`: canonical source가 GitHub issue/PR인 문서

## Documents
1. `doc/work/repeato-constitution-v1.md`
- 설명: Repeato 헌법 v1 (전 Agent 3차 검토 결과)
- 상태: Active
- 사용 시점: Repeato 기획/정책/핵심 기능 의사결정 시

2. `doc/work/flutter-local-dev-setup-v1.md`
- 설명: Flutter 로컬 개발환경 및 에뮬레이터 실행 가이드
- 상태: Active
- 사용 시점: iOS/Android 로컬 실행 환경 구성 시

3. `doc/work/repeato-menu-and-screen-spec-v1.md`
- 설명: Repeato 필수 메뉴/메뉴별 주요 기능 화면 상세 설계
- 상태: Active
- 사용 시점: IA/와이어프레임/구현 우선순위 정의 시

4. `doc/work/repeato-today-tab-spec-v1.md`
- 설명: `Today` 탭 통합 상세 기획 및 3차 검토/2회 리드백 반영 문서
- 상태: Active
- 사용 시점: Today 탭 UX/상태모델/세션 플로우 구현 및 검증 시

5. `doc/work/repeato-decks-tab-spec-v1.md`
- 설명: `Decks` 탭 상세 기획 및 탭 간 연동 질문 정리 문서
- 상태: Active
- 사용 시점: 덱 구조/상태/Today 연동 정책 검토 시

6. `doc/work/repeato-add-tab-spec-v1.md`
- 설명: `Add` 탭 상세 기획 및 입력/가져오기 정책 문서
- 상태: Active
- 사용 시점: 카드 입력 UX 및 데이터 저장 정책 검토 시

7. `doc/work/repeato-insights-tab-spec-v1.md`
- 설명: `Insights` 탭 상세 기획 및 KPI/이벤트 검토 문서
- 상태: Active
- 사용 시점: 통계 UX와 이벤트 스키마 설계 시

8. `doc/work/repeato-profile-tab-spec-v1.md`
- 설명: `Profile` 탭 상세 기획 및 동기화/결제/보안 검토 문서
- 상태: Active
- 사용 시점: 계정/동기화/결제 UX와 서버 범위 검토 시

9. `doc/work/repeato-tab-orchestration-v1.md`
- 설명: 5개 탭 병렬 검토, 대기, 재개, PM 조율 규칙 문서
- 상태: Active
- 사용 시점: 탭별 작업 순서/의존성/Agent 호출 조율 시

10. `doc/work/repeato-delivery-organization-v1.md`
- 설명: 작업 시작 전 조직도, 단계별 책임, 태깅 규칙 문서
- 상태: Active
- 사용 시점: 작업 착수 전 담당 조직 세팅과 task 태깅 시

11. `doc/work/repeato-github-tracking-workflow-v1.md`
- 설명: GitHub 이슈/브랜치/PR/머지 강제 추적 절차 문서
- 상태: Active
- 사용 시점: 개발 작업 착수 전 GitHub tracking 절차 확인 시

12. `doc/work/repeato-workflow-extraction-v1.md`
- 설명: 작업/조직 관리 절차를 skill/plugin으로 분리하기 위한 산출물 문서
- 상태: Active
- 사용 시점: workflow 분리 후보와 부가 산출물 관리 시

13. `doc/work/repeato-org-leader-workflow-v1.md`
- 설명: 조직 리더별 task 관리 분리 규칙 문서
- 상태: Active
- 사용 시점: PM/각 조직 리더의 task 운영 절차 분리 시

14. `doc/work/repeato-workflow-agent-group-v1.md`
- 설명: workflow 분리/추출 전담 Agent 그룹 정의 문서
- 상태: Active
- 사용 시점: 조직별 workflow 분리 협업 시

15. `doc/work/repeato-backup-resume-workflow-v1.md`
- 설명: Workflow Enablement Group이 관리하는 재사용 가능한 backup/resume 표준 workflow
- 상태: Active
- 사용 시점: 세션 종료 전 context 백업과 다음 세션 resume 준비 시

16. `doc/work/repeato-resume-snapshot-template-v1.md`
- 설명: resume snapshot 문서 템플릿
- 상태: Active
- 사용 시점: 새 snapshot 문서 작성 시

17. `doc/work/repeato-cross-tab-conflict-review-v1.md`
- 설명: 탭 간 충돌 범위와 PM 조정안 정리 문서
- 상태: Active
- 사용 시점: 구현 전 공통 상태/정렬/완료 기준 충돌 해소 시

18. `doc/work/repeato-qa-master-scenario-v1.md`
- 설명: 전체 시나리오 기반 QA 테스트 계획 및 시뮬레이션 결과
- 상태: Active
- 사용 시점: QA 시나리오 확정, 회귀 기준 수립 시

19. `doc/work/repeato-local-first-architecture-v1.md`
- 설명: 앱 도메인, 데이터 모델, SQLite, 다중 디바이스 동기화, 서버리스 판단 문서
- 상태: Active
- 사용 시점: 로컬 저장/동기화/도메인 설계 확정 시

20. `doc/work/repeato-service-open-plan-v1.md`
- 설명: PM 조율 기준 서비스 오픈까지의 실행 계획 문서
- 상태: Active
- 사용 시점: 단계별 실행 계획과 blocked 해제 조건 관리 시

21. `doc/work/repeato-user-feedback-groups-v1.md`
- 설명: 사용자 그룹 구성과 피드백 설명 스크립트 문서
- 상태: Active
- 사용 시점: 반복 작업의 사용자 피드백 수집 준비 시

22. `doc/work/repeato-iteration-001-loop-v1.md`
- 설명: 첫 반복의 개발-QA-사용자 피드백-PM 결정 결과 문서
- 상태: Active
- 사용 시점: 반복 작업 히스토리와 다음 우선순위 결정 시

23. `doc/work/repeato-resume-snapshot-2026-03-08-v1.md`
- 설명: 현재 작업 컨텍스트 백업 및 resume 시작 기준 문서
- 상태: Active
- 사용 시점: 다음 세션에서 context 복원 후 작업 재개 시

24. `doc/work/repeato-tab-icon-system-v1.md`
- 설명: Repeato 탭 메뉴 아이콘 세트(SVG/SF Symbol/Emoji fallback)
- 상태: Active
- 사용 시점: 탭바 UI 구현 및 아이콘 자산 적용 시

25. `doc/work/repeato-user-interview-001.md`
- 설명: 핵심 타깃 사용자 인터뷰 결과(회화 목표/시간 제약/콘텐츠 선호)
- 상태: Active
- 사용 시점: 학습 루프/콘텐츠 우선순위/리마인드 정책 결정 시

26. `doc/work/repeato-platform-strategy-v1.md`
- 설명: 단일 앱 인앱콘텐츠형(case1) vs 콘텐츠별 별도 앱형(case2) 전략 비교/권고
- 상태: Active
- 사용 시점: 비즈니스 모델/아키텍처 방향 결정 시

27. `doc/work/repeato-m2-initial-build-v1.md`
- 설명: 중2 초급 영어 데이터 기반 초기 앱 구현 결과 및 실행 가이드
- 상태: Active
- 사용 시점: 초기버전 실행/검증 및 다음 스프린트 착수 시

28. `doc/work/repeato-workflow-org-session-2026-03-08-v1.md`
- 설명: 현재 컨텍스트 공유용 workflow 조직 활성 세션 문서
- 상태: Active
- 사용 시점: workflow 조직 기준으로 다음 작업 재개, 규칙 반영 상태 확인 시

29. `doc/work/repeato-insights-user-needs-review-2026-03-15-v1.md`
- 설명: `Insights`에서 사용자가 실제로 보고 싶어하는 항목에 대한 3차 회의체 재검토 문서
- 상태: Active
- 사용 시점: `Insights` KPI 우선순위 재정의, 덱 전체 진행률/오늘 잔량/약점 요약 구현 범위 확정 시

30. `doc/work/repeato-multi-deck-daily-study-review-2026-03-15-v1.md`
- 설명: 하루 학습을 여러 덱으로 운영하는 방향에 대한 재협의 및 2차 구현 기준 문서
- 상태: Active
- 사용 시점: 단일 덱 Today 구조를 다중 덱 Today 큐 구조로 전환할 때

31. `doc/work/repeato-multi-deck-cross-tab-alignment-2026-03-15-v1.md`
- 설명: 다중 덱 Today 상태를 `Insights`와 `Add`까지 일관되게 확장하기 위한 3차 협의 문서
- 상태: Active
- 사용 시점: 다중 덱 상태를 교차 탭으로 반영할 때

32. `doc/work/repeato-product-run-guide-v1.md`
- 설명: Repeato 제품 기동/사용 테스트의 canonical guide
- 상태: Active
- 사용 시점: 현재 제품을 실제로 부팅하고 핵심 사용자 흐름을 테스트할 때

33. `doc/work/repeato-product-review-2026-04-04-v1.md`
- 설명: 2026-04-04 기준 실제 제품 테스트 결과와 추가 요구사항 후보 정리 문서
- 상태: Active
- 사용 시점: 현재 제품의 부족한 점과 다음 요구사항 후보를 빠르게 파악할 때
