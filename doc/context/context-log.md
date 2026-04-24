# Context Log (결정/근거)

## Log Template
- 날짜:
- 결정:
- 근거:
- 영향 범위:
- 후속 작업:

---

## Entries
- 날짜: 2026-04-19
- 결정: `doc` 폴더는 `doc/agents`, `doc/reference`, `doc/context`, `doc/work` 4축으로 분리하고, `agent/reference/context` 문서는 각 전용 폴더로 이동한다.
- 근거: 개발 workflow, agent/skill 참고 문서, 세션 로그 문서가 루트에 섞여 있어 탐색 비용이 높았고, 기능 단위 spec은 GitHub issue/PR을 우선 저장소로 두려는 운영 방향과도 맞지 않았기 때문이다.
- 영향 범위: `AGENTS.md`, `README.md`, `doc/*`, `skills/context-workflow/*`, `skills/repeato-workflow/SKILL.md`.
- 후속 작업: `doc/work` 문서를 active/archive/issue-managed 기준으로 재분류하고, GitHub issue가 canonical source인 로컬 spec 후보를 정리한다.

- 날짜: 2026-04-04
- 결정: 현재 제품을 기동/사용해 추가 요구사항을 도출하는 프로젝트 전용 skill은 repo-local `skills/` 아래에 만든다.
- 근거: 이 skill은 Repeato 제품 구조, 실행 가이드, 테스트 포인트, workflow와 강하게 결합돼 있어 글로벌 공용 skill보다 저장소 전용 skill이 적합하기 때문이다.
- 영향 범위: `skills/*`, `doc/work/*`, `doc/work/index.md`, `doc/reference/project-context.md`.
- 후속 작업: skill 골격 생성, 제품 기동/사용 가이드 경로 고정, 실제 테스트 결과를 skill reference에 반영.

- 날짜: 2026-04-04
- 결정: 현재 제품 테스트는 `flutter` 실행 타깃이 실제로 존재하는지 확인한 뒤, 가능하면 제품 기동을 수행하고, 항상 정적/위젯 테스트 결과도 함께 참고하는 구조로 설계한다.
- 근거: 사용자 요청은 실제 제품 사용을 요구하지만, 실행 환경에 따라 GUI 기동이 어려울 수 있으므로 기동 가능 타깃 확인과 자동 테스트를 함께 두는 것이 가장 현실적이다. 현재 환경에서는 `macOS`와 `Chrome` 타깃이 확인됐다.
- 영향 범위: 제품 기동/사용 가이드 포맷, skill 절차, 테스트 증거 수집 방식.
- 후속 작업: 제품 기동/사용 가이드 문서에 필수 실행 절차와 대체 검증 절차를 함께 명시한다.

- 날짜: 2026-04-04
- 결정: Repeato workflow의 시작점은 문서 작성이 아니라 사용자와의 대화형 요구사항 수집으로 바꾼다.
- 근거: 사용자는 `새 요청 한 줄 요약 추가`를 문서에 먼저 쓰는 방식이 아니라 대화로 요구사항을 받고 이후 프로세스가 진행되길 원했다. 따라서 목표, 범위, 비범위, 제약사항, 성공 조건을 먼저 대화로 정리한 뒤 내부 기록을 남기는 구조가 더 자연스럽다.
- 영향 범위: `README.md`, `AGENTS.md`, `doc/reference/context-workflow.md`, `doc/reference/repeato-workflow.md`, `skills/context-workflow/SKILL.md`, `skills/repeato-workflow/SKILL.md`.
- 후속 작업: 실제 요청 수집 시 어떤 질문 세트가 가장 빠르게 요구사항을 정리하는지 사례를 모아 보강 검토.

- 날짜: 2026-04-04
- 결정: 단계 태그, 작업 태그, 담당 조직은 요구사항 정리 후 에이전트가 자동 배정하는 구조로 바꾼다.
- 근거: 사용자는 `기준으로 단계 태그, 작업 태그, 담당 조직을 정한다`는 수동 절차 대신, 요구사항이 정리되면 다음 단계에서 자동으로 담당 조직이 정해지고 프로세스가 진행되길 원했다. 이를 위해 `doc/work/repeato-delivery-organization-v1.md`에 자동 매핑 규칙을 추가했다.
- 영향 범위: `README.md`, `AGENTS.md`, `doc/reference/context-workflow.md`, `doc/reference/repeato-workflow.md`, `doc/work/repeato-delivery-organization-v1.md`.
- 후속 작업: 실제 기능 요청 사례를 기반으로 자동 배정 규칙의 예외 케이스를 누적한다.

- 날짜: 2026-04-04
- 결정: Repeato workflow 설명용 문서는 루트 `README.md`를 진입점으로 추가하되, 권위 있는 상세 절차와 버전 문서는 계속 `doc/reference/repeato-workflow.md`, `doc/work/*`에 유지한다.
- 근거: 사용자는 흐름을 한눈에 이해할 수 있는 입구 문서를 원했고, 동시에 기존 `doc/work` 문서를 skill로 옮길지 판단해 달라고 요청했다. 루트 README는 탐색성과 이해도를 높이고, `doc/work`는 버전이 있는 정책/결정 기록을 유지하는 데 적합하다.
- 영향 범위: `README.md`, `doc/reference/repeato-workflow.md`, `doc/work/repeato-workflow-extraction-v1.md`, `AGENTS.md`.
- 후속 작업: README를 기준으로 새 사용자/에이전트가 진입하는지 실제 사용 중 피드백 확인.

- 날짜: 2026-04-04
- 결정: 이번 workflow 정리 작업은 `PM + Technical Architect + Workflow Enablement Group + QA` 관점으로 운영한다.
- 근거: 요청이 Repeato 전용 절차 설명, 문서 구조 재배치 판단, skill 추출 여부, 대화형 시작 구조, 자동 조직 배정을 함께 요구하기 때문이다.
- 영향 범위: `README.md`, `doc/reference/repeato-workflow.md`, `doc/work/*`, `skills/*`, `doc/reference/context-workflow.md`, `AGENTS.md`.
- 후속 작업: README 작성, doc/work vs skill 경계 문서화, 대화형 intake 및 자동 배정 규칙 반영, 변경 후 검증.

- 날짜: 2026-04-04
- 결정: `skills/context-workflow/scripts/init_context_workflow.sh`는 한국어화 이후에도 `/tmp/repeato-context-workflow-check`에서 정상 실행되며 동일한 파일 세트를 생성한다.
- 근거: 실제 실행 결과 `context-workflow.md`, `context-inbox.md`, `context-log.md`, `context-prune-rules.md`, `next-actions.md`, `app-agent-organization.md`, `repeato-check-workflow.md`가 모두 생성됐고, 콘솔 안내 문구만 한국어로 바뀌었기 때문이다.
- 영향 범위: 스킬 초기화 품질 보증, 템플릿 복사 동작, 사용자 안내 출력.
- 후속 작업: 추가 언어 정책이 생기면 식별자 비번역 원칙을 `skills` 패키지 작성 규칙으로 확장 검토한다.

- 날짜: 2026-04-04
- 결정: `AGENTS.md`, `SKILL.md`, skills 자산은 파일명/식별자는 유지하고, 사용자 노출 설명문과 역할명은 한국어 중심으로 전환한다.
- 근거: `AGENTS.md`, `SKILL.md`, 스킬 디렉터리 경로, frontmatter `name`은 도구가 탐지하거나 참조할 가능성이 있어 번역 시 호환성 리스크가 있고, 반대로 본문 설명문은 한국어화해도 동작 로직에 영향을 주지 않기 때문이다.
- 영향 범위: `AGENTS.md`, `doc/reference/context-workflow.md`, `doc/reference/repeato-workflow.md`, `doc/agents/app-agent-organization.md`, `doc/agents/repeato-agent-extension.md`, `skills/context-workflow/*`.
- 후속 작업: 스킬 템플릿/초기화 스크립트 한국어화 후 임시 디렉터리에서 초기화 스크립트 실행으로 동작 동일성을 검증한다.

- 날짜: 2026-04-04
- 결정: 이번 작업 Agent 세트는 `PM + Technical Architect + Documentation Engineer + QA` 관점으로 운영한다.
- 근거: 요청이 제품/워크플로우 문서 정합성, 스킬 패키지 구조 보존, 사용자 노출 문구 번역 품질, 실행 검증을 함께 요구하기 때문이다.
- 영향 범위: 번역 범위 결정, 스크립트 검증 방식, 최종 품질 판단 기준.
- 후속 작업: 대상 파일 일괄 수정 후 `init_context_workflow.sh` 실행 결과와 잔여 영어 표현을 점검한다.

- 날짜: 2026-03-31
- 결정: `Add` 2차 반복은 세션 메모리 기반 최근 입력 이력과 최근 사용 덱 제안을 도입하고, 저장 후 마지막 선택 덱을 유지하는 흐름으로 마무리한다.
- 근거: SQLite 도입 전에도 반복 입력 마찰을 줄일 수 있고, 테스트에서 마지막 선택 덱이 오늘 학습 덱으로 강제 복귀하는 현재 동작이 사용자 기대와 충돌했기 때문이다.
- 영향 범위: `app/lib/app_root.dart`, `app/lib/models/add_history_entry.dart`, `app/lib/screens/add_screen.dart`, `app/test/widget_test.dart`, GitHub 이슈 `#23`.
- 후속 작업: PR 생성, QA 인수인계 정리, 이후 `Profile` 다중 덱 정합성 강화 또는 `Insights` 이벤트 스키마 정의로 다음 반복 착수.

- 날짜: 2026-03-31
- 결정: 이전 작업 루프 재개 시점의 1순위 구현 항목은 `Add` 2차 반복(입력 히스토리/최근 덱 제안/저장 후 재입력 흐름 고도화)으로 잡고, workflow는 다시 `이슈 -> 브랜치 -> 구현 -> PR -> QA -> 머지` 절차를 따른다.
- 근거: 열린 개발 이슈 `#19`, `#21`은 마지막 반복 결과를 보존하고 있으나 PR 없이 멈춰 있고, `doc/context/next-actions.md` 기준 다음 사용자 가치가 가장 크면서 현재 메모리 상태 구조로 바로 구현 가능한 항목이 `Add` 2차 반복이기 때문이다.
- 영향 범위: `doc/context/context-inbox.md`, `doc/context/next-actions.md`, 새 GitHub 이슈/브랜치, `app/lib/screens/add_screen.dart`, `app/lib/app_root.dart`, `app/test/widget_test.dart`.
- 후속 작업: `Add` 2차 반복 이슈 생성, 3인 개발 검토 메모 기록, `feat/<issue>-add-second-iteration` 브랜치 생성, 구현 및 coverage 검증.

- 날짜: 2026-03-15
- 결정: 하루 학습은 단일 덱이 아니라 여러 덱을 함께 담는 `todayStudyDeckIds` 구조로 운영하고, 이를 `Today -> Insights -> Add`에 일관되게 반영한다.
- 근거: 사용자가 하루 학습을 여러 덱으로 구성하는 실제 사용 맥락을 명시했고, Today만 다중 덱을 지원하면 다른 탭에서 현재 학습 맥락이 끊기기 때문이다.
- 영향 범위: `app/lib/app_root.dart`, `app/lib/screens/decks_screen.dart`, `app/lib/screens/today_screen.dart`, `app/lib/screens/insights_screen.dart`, `app/lib/screens/add_screen.dart`, `app/test/widget_test.dart`, GitHub 이슈 `#19`, `#21`, 관련 협의 문서 2종.
- 후속 작업: `Profile`의 다중 덱 표시 강화, `Add` 입력 히스토리/최근 덱 제안, 이벤트 스키마 정의.

- 날짜: 2026-03-15
- 결정: 다중 덱 교차 탭 정합성 3차 구현의 검증 기준은 `flutter analyze` 통과, `flutter test --coverage` 통과, line coverage `92.14%`로 기록한다.
- 근거: 개발 조직 품질 기준으로 70% 이상 커버리지를 유지해야 하며, 이번 반복은 다중 덱 회귀 테스트가 추가된 교차 탭 변경이기 때문이다.
- 영향 범위: GitHub 이슈 `#21`, PR 본문 검증 섹션, QA 게이트 보고 포맷.
- 후속 작업: 다음 개발 이슈에서도 동일 포맷으로 커버리지 수치를 누적한다.

- 날짜: 2026-02-22
- 결정: 중2 초급 영어 초기버전(v1)은 PDF 기반 120단어 데이터셋으로 Today 학습 루프가 동작하는 5탭 앱으로 구현한다.
- 근거: 사용자 요청의 1차 타깃(중2 초급)과 즉시 학습 시작 요구를 가장 빠르게 검증할 수 있는 범위이기 때문.
- 영향 범위: `app/lib/main.dart`, `app/assets/data/m2_beginner_words.json`, Flutter 테스트/분석 기준.
- 후속 작업: 여행/일상/업무 예문 품질 고도화 및 카드 난이도/복습 간격 튜닝.

- 날짜: 2026-02-22
- 결정: PDF 데이터 파이프라인은 `scripts/extract_pdf_text.swift` + `scripts/build_m2_beginner_dataset.py`로 고정한다.
- 근거: 네트워크 없는 환경에서도 macOS 기본 프레임워크(PDFKit)로 추출/재생성이 가능하기 때문.
- 영향 범위: 콘텐츠 업데이트 방식, 데이터셋 재생성 절차, 운영 자동화.
- 후속 작업: 파싱 정확도 향상을 위한 품사/뜻 정제 규칙 추가.

- 날짜: 2026-02-22
- 결정: 플랫폼 전략은 Case 1(단일 앱 + 인앱 콘텐츠)을 기본 채택하고, 아키텍처는 Case 2 파생 가능성을 열어둔다.
- 근거: 제품 본질(범용 암기 플랫폼) 유지, 운영 복잡도 최소화, 데이터/학습 히스토리 통합 이점이 크기 때문.
- 영향 범위: 콘텐츠 모델, 과금 구조, 앱 정보구조, 빌드 전략.
- 후속 작업: 콘텐츠 패키지 스키마와 권한/결제 모델 상세 설계.

- 날짜: 2026-02-22
- 결정: 이번 전략 비교 작업 Agent 세트는 `PM + Technical Architect + Product Designer + Backend + Data + QA + Education Specialist + Cognitive Science Specialist`로 운영한다.
- 근거: 제품/기술/운영/학습효과 관점을 동시에 검토해야 하는 의사결정이기 때문.
- 영향 범위: 전략 문서(`doc/work/repeato-platform-strategy-v1.md`)와 실행 단계 우선순위.
- 후속 작업: Phase 1/2 분할 로드맵을 plan-checklist에 반영 검토.

- 날짜: 2026-02-22
- 결정: 핵심 사용자 인터뷰(Interview 001) 결과를 `doc/work/repeato-user-interview-001.md`로 고정하고 메뉴/화면 스펙에 반영한다.
- 근거: 회화 목표, 짬시간 제약, 콘텐츠 선호(7:3), 리마인드 성향 등 핵심 결정 입력이 확보됐기 때문.
- 영향 범위: 학습 루프, 콘텐츠 큐 비율, 리마인드 정책, KPI 정의.
- 후속 작업: Interview 002에서 여행/일상/업무 세부 시나리오 Top 10 수집.

- 날짜: 2026-02-22
- 결정: 이번 인터뷰 반영 작업 Agent 세트는 `PM + Product Designer + Education Specialist + Cognitive Science Specialist + QA`로 운영한다.
- 근거: 사용자 입력을 학습 설계 원칙으로 변환하고 과도한 범위 확장을 막기 위한 조합이 필요했기 때문.
- 영향 범위: 사용자 기준 고정, v1 범위 명확화, 후속 질문 큐.
- 후속 작업: 목표 카드 수(30/40/50) 실사용 검증 계획 수립.

- 날짜: 2026-02-22
- 결정: iOS 실행 스크립트는 `CoreSimulatorService` 미가동/시뮬레이터 미생성 상태를 감지하고 복구 가이드를 즉시 출력하도록 보강한다.
- 근거: 초기 로컬 세팅 단계에서 `simctl` 관련 오류가 자주 발생하며 원인 가시성이 낮기 때문.
- 영향 범위: `scripts/run_ios_simulator.sh`, Flutter 로컬 세팅 가이드.
- 후속 작업: 실제 실행 로그 기반으로 추가 분기(license 미동의/런타임 미설치) 세분화.

- 날짜: 2026-02-22
- 결정: Repeato 탭바 아이콘은 v1 자체 SVG 세트(5종)로 즉시 구성하고, SF Symbol/Emoji fallback 및 Noun Project 대체 링크를 함께 제공한다.
- 근거: 앱 코드가 아직 없는 상태에서도 즉시 적용 가능한 자산이 필요하며, 향후 브랜드 아이콘 교체 유연성을 확보하기 위함.
- 영향 범위: 탭바 시각 자산, Flutter 구현 가이드, 아이콘 교체 프로세스.
- 후속 작업: 실제 앱 생성 후 `scripts/install_repeato_tab_icons.sh`로 자산 설치 및 탭바 렌더 검증.

- 날짜: 2026-02-22
- 결정: 이번 아이콘 기획 작업 Agent 세트는 `PM + Product Designer + Technical Architect + QA`로 운영한다.
- 근거: 메뉴 시각 체계 결정은 UX 일관성, 구현성, 품질 검토가 핵심이기 때문.
- 영향 범위: 아이콘 스타일 규칙, fallback 정책, 문서 인덱스 구성.
- 후속 작업: 다크모드/명도 대비 접근성 검토(v2) 추가.

- 날짜: 2026-02-22
- 결정: Repeato 앱 IA는 iOS 기본 패턴의 5-탭 구조(`Today/Decks/Add/Insights/Profile`)를 필수 메뉴로 채택한다.
- 근거: 사용자 익숙성, 학습 동선 단순화, MVP 범위에서 핵심 기능 집중을 동시에 만족하기 때문.
- 영향 범위: 정보구조, 화면 설계, Flutter 라우팅 구조, 우선 구현 기능.
- 후속 작업: 탭별 와이어프레임(v1)과 API/상태모델 매핑 문서 작성.

- 날짜: 2026-02-22
- 결정: 이번 기획 작업 Agent 세트는 `PM + Product Designer + Technical Architect + Education Specialist + Cognitive Science Specialist + QA`로 운영한다.
- 근거: 메뉴/화면 설계는 사용자 경험, 구현 현실성, 학습 효과, 품질 검토가 동시에 필요한 범위이기 때문.
- 영향 범위: 메뉴 우선순위, 세션 UX 규칙, 범위 제외 항목 확정.
- 후속 작업: QA 시나리오(탭별 핵심 플로우) 초안 작성.

- 날짜: 2026-02-22
- 결정: Flutter 로컬 개발환경은 스크립트 기반(`scripts/*.sh`)으로 구성하고, 실행 가이드는 `doc/work/flutter-local-dev-setup-v1.md`에 보존한다.
- 근거: 현재 로컬에 flutter/dart/adb가 없어서 설치/진단/실행을 분리 자동화해야 재현 가능한 온보딩이 가능하기 때문.
- 영향 범위: 로컬 개발환경 구축 방식, iOS/Android 에뮬레이터 실행 절차, work 문서 인덱스.
- 후속 작업: 실제 로컬에서 bootstrap 실행 후 `flutter doctor -v` 결과를 기반으로 v2 트러블슈팅 문서 보강.

- 날짜: 2026-02-22
- 결정: 산출물 가치 문서는 `doc/work` 하위에 보존하고 `doc/reference/project-context.md`는 인덱스 허브로 운영한다.
- 근거: project-context 비대화를 막고, 필요 시점에 상세 산출물을 선택적으로 로드하기 위함.
- 영향 범위: 문서 저장 구조, Repeato 헌법 본문 위치, AGENTS/Workflow 문서 운영 규칙.
- 후속 작업: 신규 산출물 작성 시 `doc/work/index.md`를 함께 갱신하는 체크리스트 추가 검토.

- 날짜: 2026-02-22
- 결정: Repeato 기획 1~6 항목은 전 Agent(공통 9 + 전문가 2) 회의체 3차 검토 후 `doc/work/repeato-constitution-v1.md`로 확정한다.
- 근거: 제품 취지, 학습과학 근거, 구현 가능성, 품질/보안/운영성까지 동시에 충족하는 합의가 필요했기 때문.
- 영향 범위: `doc/work/repeato-constitution-v1.md`, `doc/reference/project-context.md` 인덱스, `AGENTS.md` 헌법 운영 규칙.
- 후속 작업: 다음 Repeato 정책 변경 요청부터 3차 회의체 템플릿(라운드별 합의/반려 사유) 적용.

- 날짜: 2026-02-22
- 결정: 이번 작업 Agent 세트는 `PM + Product Designer + Technical Architect + Frontend Engineer + Backend Engineer + QA Engineer + DevOps/SRE + Data Analyst + Security/Privacy + Education Specialist + Cognitive Science Specialist`로 간주해 합의안을 도출한다.
- 근거: 사용자 요청이 전 Agent 참여 회의체를 명시했고, 항목 1~6은 도메인/기술/품질/윤리 관점의 동시 검토가 필요했기 때문.
- 영향 범위: 최종 목적/가치/지속성/타깃/핵심 철학/금지사항 정의.
- 후속 작업: 각 라운드의 반대 의견 발생 시 조정 규칙(우선순위: 안전/신뢰 > 학습효과 > 성장) 명문화 검토.

- 날짜: 2026-02-22
- 결정: 이번 작업 Agent 세트는 `PM + Architect + Documentation Engineer + QA`로 운영하고, 강제 협업 파이프라인 문서를 공통 규칙으로 반영한다.
- 근거: 프로세스 설계 작업에서 기획 검토, 설계 게이트 정의, 문서 반영, 규칙 검증이 필요했기 때문.
- 영향 범위: AGENTS 규칙, 공통 조직 협업 프로토콜, context-workflow 및 스킬 템플릿.
- 후속 작업: 단계별 체크리스트 템플릿(사전검토/사후검토/QA) 분리 여부 판단.

- 날짜: 2026-02-22
- 결정: 모든 프롬프트 작업은 `사전 검토(PM+Architect) -> 설계 계획(Architect) -> 구현(Engineer+Designer) -> 사후 검토(PM+Architect) -> QA` 순서를 강제한다.
- 근거: 스펙 충돌/취지 이탈을 구현 전에 차단하고, 구현 후에도 기획/설계 기준 일치와 품질 검증을 보장하기 위함.
- 영향 범위: AGENTS 작업 규칙, 공통 Agent 협업 프로토콜, context-workflow 실행 단계.
- 후속 작업: 각 단계별 체크리스트 템플릿(검토 항목/승인 기준) 추가 여부 검토.

- 날짜: 2026-02-22
- 결정: 이번 작업 Agent 세트는 `PM + Architect + Documentation Engineer + QA`로 운영한다.
- 근거: 공통 조직/전문가 체계 문서화 작업으로 기획, 구조 설계, 문서 구현, 규칙 검증이 모두 필요했기 때문.
- 영향 범위: AGENTS/Workflow 문서 수정, 스킬 템플릿 갱신, 초기화 스크립트 검증.
- 후속 작업: 다음 작업부터 요청 유형별 기본 Agent 세트 템플릿을 context-log에 재사용.

- 날짜: 2026-02-22
- 결정: 앱 개발 공통 Agent 조직은 `doc/agents/app-agent-organization.md`로 고정하고, Repeato 전용 전문가는 `doc/agents/repeato-agent-extension.md`로 분리한다.
- 근거: 공통 협업 체계 재사용성과 Repeato 도메인 전문성(교육/인지과학)을 동시에 유지하기 위함.
- 영향 범위: 작업별 Agent 호출 방식, 기획 검토 게이트, workflow 문서 연결 구조.
- 후속 작업: 다음 기능 요청부터 선택 Agent 세트를 작업 로그에 명시 적용.

- 날짜: 2026-02-22
- 결정: 앱 제작을 위한 에이전트 페르소나는 필수 코어(기획/설계/개발/디자인/QA)와 지원 역할(데이터/보안/운영/성장)로 분리해 정의한다.
- 근거: MVP 단계에서도 역할 누락 없이 실행 가능하면서, 팀 규모에 따라 통합/분리를 유연하게 하기 위함.
- 영향 범위: 역할 분담, 산출물 책임, 협업 핸드오프 기준.
- 후속 작업: Repeato MVP 범위에 맞춰 각 역할의 주간 산출물 템플릿 확정.

- 날짜: 2026-02-22
- 결정: 앞으로 요청을 `workflow 반영`과 `Repeato 반영`으로 자동 분류해 각각의 문서/산출물에 동시에 반영한다.
- 근거: 공통 운영 규칙과 제품 결과물을 분리해야 재사용성과 제품 정합성을 동시에 유지할 수 있기 때문.
- 영향 범위: AGENTS 실행 규칙, context-workflow 적용 절차, Repeato 작업 반영 방식.
- 후속 작업: 분류가 모호한 요청 사례를 수집해 분류 예시 규칙 추가.

- 날짜: 2026-02-22
- 결정: `context-workflow`를 스킬(`skills/context-workflow`)과 에이전트 통합 템플릿 형태로 패키징한다.
- 근거: 동일 워크플로우를 저장소 간 복제할 때 문서/규칙/초기화 절차를 일관되게 재사용하기 위함.
- 영향 범위: 신규 저장소 온보딩 속도, AGENTS 규칙 표준화, 컨텍스트 기록 일관성.
- 후속 작업: 실제 다른 저장소 1곳에 적용해 템플릿 최소 항목 검증.

- 날짜: 2026-02-22
- 결정: `context-workflow`를 공통 재사용 표준으로 분리하고 Repeato 전용 흐름은 `doc/reference/repeato-workflow.md`로 분리한다.
- 근거: 제품별 의사결정 규칙과 컨텍스트 운영 절차를 분리해야 다른 프로젝트에도 동일한 workflow를 재사용할 수 있기 때문.
- 영향 범위: AGENTS 참조 구조, 작업 시작/종료 절차, 문서 확장 방식.
- 후속 작업: 다른 프로젝트 적용 시 `<project>-workflow.md` 템플릿으로 변환 검증.

- 날짜: 2026-02-22
- 결정: `doc/reference/plan-checklist.md`를 `doc/reference/project-context.md` 기준으로 재정렬한다.
- 근거: 초기 제품 방향과 상세 요구사항 문서의 불일치를 줄여 우선순위 판단을 빠르게 하기 위함.
- 영향 범위: 요구사항 정의, MVP 범위 수립, 후속 기술 설계.
- 후속 작업: 카드 템플릿/스케줄 간격표/KPI 정의를 우선 확정.

- 날짜: 2026-02-22
- 결정: 컨텍스트 운영은 저장소 로컬 프로토콜(AGENTS + doc 세트)로 고정한다.
- 근거: 즉시 적용 가능하고 세션 간 일관성을 유지하기 쉽기 때문.
- 영향 범위: 모든 작업의 기록/이월/정리 방식.
- 후속 작업: 다음 작업부터 inbox/log/next-actions를 실제 운영하며 필요 시 경량화.

- 날짜: 2026-02-24
- 결정: 이번 저장소 상태 점검 작업 Agent 세트는 `PM + Technical Architect + Frontend Engineer + QA Engineer`로 운영한다.
- 근거: 요청이 제품 방향/구현 상태/미완료 리스크를 동시에 판단하는 성격이어서 범위 판단, 기술 검토, 코드 확인, 품질 관점이 모두 필요했기 때문.
- 영향 범위: 상태 진단 결과, 우선순위 큐 정렬, 다음 3개 실행 작업 정의.
- 후속 작업: 합의된 다음 작업 3개를 기준으로 설계-구현-검증 루프를 시작.

- 날짜: 2026-02-24
- 결정: 현재 상태는 `M2 초기 학습 루프 MVP 완료 + 정책/스펙 다수 미확정 + Add/Profile 기능 플레이스홀더`로 판단한다.
- 근거: `app/lib/main.dart`에서 Today 루프만 실동작하고 Add/Profile가 다음 단계 안내 문구로 남아 있으며, `doc/reference/plan-checklist.md` 핵심 체크 항목이 대부분 미완료 상태이기 때문.
- 영향 범위: 다음 스프린트는 신규 기능 확장보다 정책 확정(카드/스케줄/KPI)과 스케줄러 구현을 우선해야 함.
- 후속 작업: `doc/context/next-actions.md` 상위 3개 항목을 산출물 단위로 구체화.

- 날짜: 2026-03-08
- 결정: `Today` 탭 상세 기획은 `doc/work/repeato-today-tab-spec-v1.md`로 통합하고, 기존 메뉴 스펙 문서는 요약/참조 역할로 유지한다.
- 근거: 기존 `Today` 정의가 메뉴 스펙과 인터뷰 결과에 분산돼 있었고, 3차 검토 및 2회 리드백 이력을 한 문서에서 추적할 필요가 있기 때문이다.
- 영향 범위: `doc/work/repeato-menu-and-screen-spec-v1.md`, `doc/work/index.md`, `doc/reference/project-context.md`.
- 후속 작업: 구현 착수 시 새 문서를 기준으로 `Today` 상태 UI와 이벤트 스키마를 구체화한다.

- 날짜: 2026-03-08
- 결정: 전체 탭 상세화는 `PM Agent` 오케스트레이션 하에 병렬 시작하고, 선행작업이 필요한 탭은 `blocked` 상태로 대기시키는 방식으로 운영한다.
- 근거: 사용자 요청이 각 탭에 동일한 상세화 프로세스를 반복하되, 서버/다른 탭 Agent와의 연동 질문과 작업 순서 조율까지 포함하고 있기 때문이다.
- 영향 범위: `AGENTS.md`, `doc/agents/app-agent-organization.md`, `doc/work/repeato-tab-orchestration-v1.md`, 각 탭 상세 문서.
- 후속 작업: KPI/이벤트 스키마와 동기화/결제 범위가 정리되면 `Insights`, `Profile`의 blocked 상태를 해제한다.

- 날짜: 2026-03-08
- 결정: `Decks`, `Add`, `Insights`, `Profile` 탭도 각각 독립 상세 문서로 관리하고, 필요 시 `Backend Engineer`를 조건부로 참여시킨다.
- 근거: 각 탭이 서로 다른 연동 포인트(덱 상태, 카드 저장, 이벤트 집계, 동기화/결제)를 갖고 있어 단일 문서로는 추적이 어렵기 때문이다.
- 영향 범위: `doc/work/repeato-decks-tab-spec-v1.md`, `doc/work/repeato-add-tab-spec-v1.md`, `doc/work/repeato-insights-tab-spec-v1.md`, `doc/work/repeato-profile-tab-spec-v1.md`.
- 후속 작업: 각 탭의 사용자 확인 질문을 실제 인터뷰/검증 시나리오로 전환한다.

- 날짜: 2026-03-08
- 결정: 최초 버전에서는 동기화/결제 서버 구현을 하지 않고, `Google Drive appDataFolder` 기반 서버리스 동기화안과 결제 상태 모델만 설계한다.
- 근거: 사용자 요청이 동기화/결제 서버 범위는 기획안만 원하며, 현재 MVP 우선순위는 로컬 학습 경험과 SQLite 기반 상태 저장이기 때문이다.
- 영향 범위: `doc/work/repeato-local-first-architecture-v1.md`, `doc/work/repeato-profile-tab-spec-v1.md`, `doc/work/repeato-service-open-plan-v1.md`.
- 후속 작업: MVP-3에서 결제 구현이 실제 범위에 들어오면 PM이 서버리스 백엔드 필요성을 재판단한다.

- 날짜: 2026-03-08
- 결정: 탭 간 충돌 검토 결과는 공통 상태 키와 집계 규칙으로 조정하고, 치명적 기획 충돌은 없는 것으로 판단한다.
- 근거: `Today` 완료 정의, `Decks` 상태, `Add` 저장 반영 시점, `Insights` 분모, `Profile` 목표/동기화 노출을 일관 규칙으로 맞출 수 있기 때문이다.
- 영향 범위: `doc/work/repeato-cross-tab-conflict-review-v1.md`, 탭별 상세 문서, SQLite 상태 모델.
- 후속 작업: 공통 상태 키를 코드 구조 분리 시점에 모델 클래스로 고정한다.

- 날짜: 2026-03-08
- 결정: QA는 현재 버전에 대해 `Today` MVP 자동 검증과 전체 시나리오 문서 시뮬레이션을 수행하고, 전체 탭 통합 승인은 로컬 저장 도입 이후로 미룬다.
- 근거: 현재 자동 테스트는 `Today` 루프 일부만 커버하고 있으며, Decks/Add/Profile은 아직 문서/플레이스홀더 단계이기 때문이다.
- 영향 범위: `doc/work/repeato-qa-master-scenario-v1.md`, `app/test/widget_test.dart`, 릴리즈 게이트.
- 후속 작업: SQLite 도입 후 재실행/복원/탭 간 정합성 테스트를 추가한다.

- 날짜: 2026-03-08
- 결정: 모든 후속 작업은 착수 전에 `doc/work/repeato-delivery-organization-v1.md` 기준으로 담당 조직과 `#STAGE-*`, `#TASK-*`, `#ORG-*` 태그를 먼저 지정한다.
- 근거: 현재까지 역할 문서는 있었지만 실제 작업 단위별 책임 배치와 태깅 기준이 분리돼 있지 않아 조율 비용이 증가했기 때문이다.
- 영향 범위: `AGENTS.md`, 향후 `doc/work` 산출물, `doc/context/next-actions.md` 작업 태깅 방식.
- 후속 작업: 다음 구현 작업부터 task 라인마다 조직 태그를 병기한다.

- 날짜: 2026-03-08
- 결정: 반복 작업은 `개발 -> QA -> 사용자 그룹 피드백 -> PM 결정 -> 기획 변경 -> 사용자 의사결정 요청` 루프로 운영하고, 첫 반복 결과는 `doc/work/repeato-iteration-001-loop-v1.md`에 기록한다.
- 근거: 사용자 요청이 한 번에 완성본을 내는 방식보다 반복 루프와 의사결정 게이트를 명시적으로 원했기 때문이다.
- 영향 범위: 향후 작업 진행 방식, 사용자 피드백 문서화, PM 의사결정 기록 방식.
- 후속 작업: 다음 반복부터는 각 기능 구현 전에 GitHub tracking 상태와 사용자 피드백 대상을 함께 점검한다.

- 날짜: 2026-03-08
- 결정: `resume workflow` 재개 결과, 다음 구현 대상은 유지하되 현재 세션 상태를 `GitHub issue pending`으로 복원하고 구현 착수는 보류한다.
- 근거: `doc/work/repeato-resume-snapshot-2026-03-08-v1.md` 기준 1순위 작업은 `Add 직접 입력 MVP 구현`이지만, 2026-03-08 현재 `gh auth status`에서 기본 계정 토큰이 invalid이고 작업 브랜치도 `main`이어서 `이슈 -> 브랜치 -> 구현` 강제 절차를 충족하지 못하기 때문이다.
- 영향 범위: `doc/context/context-inbox.md`, `doc/context/next-actions.md`, 다음 개발 착수 순서, GitHub tracking workflow 적용 방식.
- 후속 작업: GitHub 인증 복구 후 `Add 직접 입력 MVP` 이슈 생성, 3인 개발 검토 기록, `feat/<issue-number>-add-direct-input-mvp` 브랜치에서 구현을 시작한다.
- 후속 작업: 다음 반복 착수 전에 사용자에게 1순위 구현 항목을 확인받는다.

- 날짜: 2026-03-08
- 결정: 개발 조직 workflow의 기본 품질 기준으로 테스트 라인 커버리지 70% 이상 유지를 추가하고, 이슈/PR/QA 게이트에 모두 연결한다.
- 근거: 사용자가 개발 조직 차원에서 커버리지 70% 유지를 명시적으로 요구했고, 문서 규칙만 두면 누락되기 쉬우므로 GitHub tracking 템플릿과 QA 게이트까지 함께 강제해야 실제 운영이 가능하기 때문이다.
- 영향 범위: `AGENTS.md`, `doc/reference/context-workflow.md`, `doc/agents/app-agent-organization.md`, `doc/work/repeato-github-tracking-workflow-v1.md`, `doc/work/repeato-delivery-organization-v1.md`, `.github/ISSUE_TEMPLATE/feature-task.yml`, `.github/PULL_REQUEST_TEMPLATE.md`.
- 후속 작업: 다음 개발 이슈부터 coverage plan을 이슈에 기록하고, PR에는 실제 line coverage 측정값을 남긴다.

- 날짜: 2026-03-08
- 결정: 현재 컨텍스트를 공유하는 `workflow 조직 세션`은 `doc/work` 문서로 열고, Workflow Enablement Group의 활성 세션 기준점으로 운영한다.
- 근거: 별도 런타임 세션을 시스템적으로 유지하는 기능은 없지만, 현재 컨텍스트/참조 문서/역할/열린 안건을 한 문서에 고정하면 다음 턴과 다음 세션에서 동일한 조직 맥락으로 재개할 수 있기 때문이다.
- 영향 범위: `doc/work` 산출물 체계, workflow 재개 방식, 조직 간 컨텍스트 공유 방식.
- 후속 작업: 세션 문서에 현재 활성 작업, 참조 문서, 오픈 안건, 다음 실행 순서를 유지한다.

- 날짜: 2026-03-08
- 결정: `Add 직접 입력 MVP`는 GitHub 이슈 `#1`과 브랜치 `feat/1-add-direct-input-mvp`에서 진행하고, 구현 범위는 로컬 메모리 기반 직접 입력/저장/Today 이동/Decks 반영으로 고정한다.
- 근거: `Add` 탭 1순위 구현을 workflow 규칙에 맞춰 실제 이슈-브랜치 체인으로 시작해야 했고, 현재 앱 구조에서는 SQLite 전에 AppRoot가 카드 목록을 상태로 소유하는 방식이 가장 작은 단위의 검증 가능 구현이기 때문이다.
- 영향 범위: `app/lib/app_root.dart`, `app/lib/screens/add_screen.dart`, `app/test/widget_test.dart`, GitHub issue `#1`.
- 후속 작업: PR 단계에서 coverage 결과와 회귀 범위를 본문에 기록하고, 다음 구현은 `Deck 상세 화면과 Today 연결`로 이어간다.

- 날짜: 2026-03-08
- 결정: 이번 `Add 직접 입력 MVP` 검증 결과는 `flutter analyze` 통과, `flutter test --coverage` 통과, line coverage `84.31%`로 기록한다.
- 근거: 개발 조직 workflow에 새로 추가한 품질 기준(테스트 라인 커버리지 70% 이상 유지)을 실제 첫 구현 작업에 즉시 적용해야 하기 때문이다.
- 영향 범위: QA 게이트, PR 본문 커버리지 기록, 다음 개발 이슈의 coverage plan 작성 방식.
- 후속 작업: 다음 개발 이슈부터 coverage plan과 실제 line coverage 수치를 동일한 포맷으로 누적한다.

- 날짜: 2026-03-08
- 결정: `Add 직접 입력 MVP` 변경은 선택 커밋 `8780e79`로 정리하고 PR `#2 Add direct input MVP and workflow coverage gate`를 생성한다.
- 근거: 사용자가 미커밋 변경 정리와 깨끗한 PR 생성을 우선 요청했고, 현재 작업 트리에는 이번 PR과 무관한 문서 변경이 함께 남아 있어 선택 스테이징과 별도 커밋/PR 분리가 필요했기 때문이다.
- 영향 범위: GitHub issue `#1`, branch `feat/1-add-direct-input-mvp`, PR `#2`, 로컬 미커밋 변경 관리 방식.
- 후속 작업: PR `#2` 기준 수동 QA를 수행하고, 다음 작업은 별도 이슈/브랜치로 `Deck 상세 화면과 Today 연결`을 시작한다.

- 날짜: 2026-03-08
- 결정: `Deck 상세 화면과 Today 연결` 작업은 GitHub 이슈 `#3`과 브랜치 `feat/3-decks-today-link`에서 진행하고, 범위는 덱 상세 진입/요약 정보/`학습 시작` CTA 연결로 제한한다.
- 근거: 다음 우선순위 작업을 기존 workflow에 맞춰 즉시 시작해야 했고, 현재 다중 덱/SQLite 상태 모델이 아직 없으므로 단일 대표 덱 기준의 상세 화면 연결이 가장 작은 검증 가능 단위이기 때문이다.
- 영향 범위: `app/lib/app_root.dart`, `app/lib/screens/decks_screen.dart`, `app/test/widget_test.dart`, GitHub issue `#3`.
- 후속 작업: PR 단계에서 Deck 상세 노출 정보와 Today 이동 회귀 범위를 본문에 기록한다.

- 날짜: 2026-03-08
- 결정: 이번 `Deck 상세 화면과 Today 연결` 검증 결과는 `flutter analyze` 통과, `flutter test --coverage` 통과, line coverage `85.59%`로 기록한다.
- 근거: 새 workflow 규칙에 따라 모든 개발 반복에서 테스트 라인 커버리지 70% 이상 유지 여부를 실제 수치로 남겨야 하기 때문이다.
- 영향 범위: QA 게이트, PR 본문 커버리지 기록, 다음 개발 이슈의 coverage plan 누적 방식.
- 후속 작업: 다음 작업에서도 동일한 coverage 계산 방식(`coverage/lcov.info`)을 사용한다.

- 날짜: 2026-03-08
- 결정: 개발 작업은 GitHub 이슈, 이슈 번호 포함 브랜치, PR, QA, 머지 순서를 강제하고, 구현 전에는 Development Lead 포함 3인 검토를 필수로 둔다.
- 근거: 사용자 요청이 개발 절차의 추적성과 역할 분담을 강하게 요구했고, 작업 누락과 범위 드리프트를 줄이려면 GitHub tracking을 강제해야 하기 때문이다.
- 영향 범위: `AGENTS.md`, `.github/ISSUE_TEMPLATE/feature-task.yml`, `.github/PULL_REQUEST_TEMPLATE.md`, 향후 개발 작업 시작 방식.
- 후속 작업: GitHub 인증 복구 후 실제 이슈/브랜치/PR 생성 흐름을 즉시 적용한다.

- 날짜: 2026-03-08
- 결정: 작업/조직 관리 절차를 제품 기능과 분리하기 위해 Workflow Enablement Group을 신설하고, 모든 조직 작업에 workflow 분리 관점을 병행 적용한다.
- 근거: PM과 각 조직 리더의 운영 절차를 나중에 skill/plugin으로 분리하려면, 기능 개발과 동시에 workflow 산출물을 별도로 추출해야 하기 때문이다.
- 영향 범위: `doc/work/repeato-workflow-agent-group-v1.md`, `doc/work/repeato-workflow-extraction-v1.md`, `doc/work/repeato-org-leader-workflow-v1.md`, `doc/work/repeato-delivery-organization-v1.md`.
- 후속 작업: 다음 작업부터 workflow 관련 산출물은 `#TASK-WORKFLOW` 태그로 별도 누적한다.

- 날짜: 2026-03-08
- 결정: 현재 작업 컨텍스트 백업과 다음 세션 resume 기준은 `doc/work/repeato-resume-snapshot-2026-03-08-v1.md`를 단일 시작점으로 사용한다.
- 근거: 내부 대화 상태는 직접 저장할 수 없으므로, 문서/작업 큐/코드 상태를 한 문서에 묶어 재개 기준을 명확히 해야 하기 때문이다.
- 영향 범위: 이후 세션 재개 방식, context 복원 절차, 사용자 resume 프롬프트.
- 후속 작업: 다음 세션 시작 시 snapshot 문서와 `doc/context/next-actions.md`를 먼저 읽고 작업을 재개한다.

- 날짜: 2026-03-08
- 결정: backup/resume 절차는 특정 snapshot 문서에 종속하지 않고 Workflow Enablement Group이 관리하는 공통 workflow(`repeato-backup-resume-workflow-v1.md`)와 template(`repeato-resume-snapshot-template-v1.md`)로 재사용한다.
- 근거: 이후 모든 반복 작업과 다른 workflow 분리 작업에서도 동일한 backup/resume 구조를 재사용해야 하기 때문이다.
- 영향 범위: `doc/work/repeato-backup-resume-workflow-v1.md`, `doc/work/repeato-resume-snapshot-template-v1.md`, `doc/work/repeato-workflow-agent-group-v1.md`, `doc/work/repeato-workflow-extraction-v1.md`.
- 후속 작업: 새 snapshot 생성 시 template를 기준으로 작성하고, latest snapshot만 resume 기준으로 지정한다.

- 날짜: 2026-03-08
- 결정: 현재 세션 상태에 대해 backup workflow를 실행하고, 최신 resume 기준은 `doc/work/repeato-resume-snapshot-2026-03-08-v1.md`로 재확정한다.
- 근거: 다음 세션에서 동일한 문서 기준으로 바로 resume 할 수 있게 최신 산출물과 blocked 상태를 snapshot에 반영해야 하기 때문이다.
- 영향 범위: `doc/work/repeato-resume-snapshot-2026-03-08-v1.md`, 이후 세션 재개 절차.
- 후속 작업: resume 시 snapshot + `doc/context/next-actions.md` + `doc/context/context-log.md`를 함께 읽고 시작한다.

- 날짜: 2026-03-13
- 결정: `Insights` 1차 반복은 GitHub 이슈 `#5`와 브랜치 `feat/5-insights-dashboard-cta`에서 진행하고, 범위는 핵심 KPI 3개와 Today 재진입 CTA, 탭 상태 보존으로 제한한다.
- 근거: 사용자가 각 메뉴별로 동일한 개발 루프를 반복 수행하길 요청했고, 현재 Insights는 이벤트 스키마 확정 전에도 작은 단위의 사용자 가치(KPI 요약과 즉시 재학습 연결)를 검증할 수 있기 때문이다.
- 영향 범위: `app/lib/app_root.dart`, `app/lib/screens/insights_screen.dart`, `app/test/widget_test.dart`, GitHub issue `#5`.
- 후속 작업: PR 본문에 KPI 범위 제한과 탭 상태 보존 이유를 명시하고, 다음 메뉴 반복은 `Profile` 또는 `Today` 2차 작업으로 넘긴다.

- 날짜: 2026-03-13
- 결정: 이번 `Insights` 1차 반복 검증 결과는 `flutter analyze` 통과, `flutter test --coverage` 통과, line coverage `87.43%`로 기록한다.
- 근거: 개발 조직 workflow의 품질 기준인 line coverage 70% 이상 유지를 메뉴 반복 작업에도 동일하게 적용해야 하기 때문이다.
- 영향 범위: QA 게이트, PR 본문 커버리지 기록, 다음 메뉴 반복의 검증 포맷.
- 후속 작업: 다음 메뉴 반복에서도 동일한 coverage 계산 명령(`coverage/lcov.info` 기반)을 유지한다.

- 날짜: 2026-03-13
- 결정: `Profile` 1차 반복은 GitHub 이슈 `#7`과 브랜치 `feat/7-profile-trust-summary`에서 진행하고, 범위는 오늘 학습 요약, 로컬 저장 상태, 약한 리마인드, Today 복귀 CTA로 제한한다.
- 근거: `Profile` 탭은 설정 허브보다 신뢰 확인 화면이 우선이며, 서버 범위를 열지 않고도 현재 세션 요약과 로컬 상태를 보여주는 작은 단위 개선이 가능하기 때문이다.
- 영향 범위: `app/lib/app_root.dart`, `app/lib/screens/profile_screen.dart`, `app/test/widget_test.dart`, GitHub issue `#7`.
- 후속 작업: 다음 반복은 `Today` 2차 세션 제어 개선으로 넘기고, `Profile` 2차에서는 목표 카드 수 설정 연결 여부를 검토한다.

- 날짜: 2026-03-13
- 결정: 이번 `Profile` 1차 반복 검증 결과는 `flutter analyze` 통과, `flutter test --coverage` 통과, line coverage `88.25%`로 기록한다.
- 근거: 메뉴 반복 작업에서도 테스트 line coverage 70% 이상 유지 규칙을 동일하게 적용해야 하기 때문이다.
- 영향 범위: QA 게이트, PR 본문 커버리지 기록, 다음 반복의 검증 포맷.
- 후속 작업: 다음 반복에서도 `coverage/lcov.info` 기반 line coverage 계산식을 유지한다.

- 날짜: 2026-03-13
- 결정: `Today` 2차 반복은 GitHub 이슈 `#9`와 브랜치 `feat/9-today-session-controls`에서 진행하고, 범위는 세션 제어 카드, 명시적 리셋 CTA, 목표 변경 흐름 명확화로 제한한다.
- 근거: 각 메뉴별 반복 작업을 계속 진행하는 현재 루프에서 `Today`는 핵심 사용 흐름이므로, 데이터 모델 확장 전에 세션 제어를 더 명확히 보여주는 작은 반복이 우선 가치가 높기 때문이다.
- 영향 범위: `app/lib/screens/today_screen.dart`, `app/test/widget_test.dart`, GitHub issue `#9`.
- 후속 작업: 다음 반복은 `Add` 2차 또는 `Decks` 2차 중 하나로 넘기고, `Today` 3차에서는 약점 카드 재도전 큐 도입 여부를 검토한다.

- 날짜: 2026-03-13
- 결정: 이번 `Today` 2차 반복 검증 결과는 `flutter analyze` 통과, `flutter test --coverage` 통과, line coverage `90.65%`로 기록한다.
- 근거: 반복 구현에서도 line coverage 70% 이상 유지 규칙을 지속적으로 증명해야 하기 때문이다.
- 영향 범위: QA 게이트, PR 본문 커버리지 기록, 다음 반복의 검증 포맷.
- 후속 작업: 다음 반복에서도 `coverage/lcov.info` 기반 line coverage 계산식을 유지한다.

- 날짜: 2026-03-15
- 결정: `Insights`에서 사용자가 실제로 보고 싶어하는 항목에 대해 3차 회의체 재검토를 수행하고, `현재 학습 중인 덱 전체 진행률`을 핵심 항목으로 확정한다.
- 근거: 사용자가 `중2 초급 영어를 하고 있는데 해당 아이템의 전체 진행률을 보고 싶다`는 예시를 직접 제시했고, 기존 `Insights` 문서가 오늘 KPI 3개 중심이라 덱 단위 맥락을 충분히 설명하지 못했기 때문이다.
- 영향 범위: `doc/work/repeato-insights-user-needs-review-2026-03-15-v1.md`, `doc/work/repeato-insights-tab-spec-v1.md` 후속 개정 범위, 향후 `Insights` 구현 우선순위.
- 후속 작업: `Insights` 2차 구현 범위는 `덱 전체 진행률 + 오늘 남은 카드 + 약점 요약 + CTA`를 최소 세트로 잡는다.

- 날짜: 2026-03-15
- 결정: `Insights` 1차 후속 반복은 GitHub 이슈 `#11`과 브랜치 `feat/11-insights-deck-progress`에서 진행하고, 범위는 `현재 학습 중인 덱` 카드, 덱 전체 진행률, 오늘 남은 카드, 관련 스펙 문서 연결로 제한한다.
- 근거: 방금 수행한 사용자 요구 3차 검토의 첫 구현 단위로 가장 직접적인 사용자 질문인 `현재 덱 전체 진행률`과 `오늘 남은 양`을 먼저 화면에 반영하는 것이 적절했기 때문이다.
- 영향 범위: `app/lib/app_root.dart`, `app/lib/screens/insights_screen.dart`, `app/test/widget_test.dart`, `doc/work/repeato-insights-tab-spec-v1.md`, GitHub issue `#11`.
- 후속 작업: 다음 반복에서는 약점 영역 요약과 CTA를 덱 맥락 기준으로 더 구체화한다.

- 날짜: 2026-03-15
- 결정: 이번 `Insights 덱 전체 진행률과 오늘 남은 카드` 반복 검증 결과는 `flutter analyze` 통과, `flutter test --coverage` 통과, line coverage `91.53%`로 기록한다.
- 근거: 개발 workflow 품질 기준인 line coverage 70% 이상 유지 규칙을 이번 `Insights` 반복에도 동일하게 적용해야 하기 때문이다.
- 영향 범위: QA 게이트, PR 본문 커버리지 기록, 다음 `Insights` 반복의 검증 포맷.
- 후속 작업: 다음 반복에서도 `coverage/lcov.info` 기반 line coverage 계산식을 유지한다.

- 날짜: 2026-03-15
- 결정: `Insights` 2차 반복은 GitHub 이슈 `#13`과 브랜치 `feat/13-insights-weak-summary`에서 진행하고, 범위는 약점 영역 요약 카드, 약점 해석 문구, `덱 확인하기` CTA 추가로 제한한다.
- 근거: 덱 전체 진행률과 오늘 남은 양을 본 뒤 사용자가 다음으로 궁금해하는 것은 `무엇이 약점인지`와 `덱 쪽으로 어떻게 넘어가는지`였기 때문이다.
- 영향 범위: `app/lib/app_root.dart`, `app/lib/screens/insights_screen.dart`, `app/test/widget_test.dart`, GitHub issue `#13`.
- 후속 작업: 다음 반복에서는 최근 변화와 다음 복습 시점 카드를 추가한다.

- 날짜: 2026-03-15
- 결정: 이번 `Insights 약점 영역 요약과 덱 확인 CTA` 반복 검증 결과는 `flutter analyze` 통과, `flutter test --coverage` 통과, line coverage `91.65%`로 기록한다.
- 근거: 반복 구현에서도 line coverage 70% 이상 유지 규칙을 지속 적용해야 하기 때문이다.
- 영향 범위: QA 게이트, PR 본문 커버리지 기록, 다음 `Insights` 반복의 검증 포맷.
- 후속 작업: 다음 반복에서도 `coverage/lcov.info` 기반 line coverage 계산식을 유지한다.

- 날짜: 2026-03-15
- 결정: `Insights` 3차 반복은 GitHub 이슈 `#15`와 브랜치 `feat/15-insights-trend-next-review`에서 진행하고, 범위는 `최근 변화` 카드와 `다음 복습 시점` 카드 추가로 제한한다.
- 근거: 사용자가 `전체에서 얼마나 했는지`와 `무엇이 약한지`를 본 다음, 자연스럽게 궁금해하는 것은 `내가 나아지고 있는지`와 `다음에 무엇이 오는지`이기 때문이다.
- 영향 범위: `app/lib/screens/insights_screen.dart`, `app/test/widget_test.dart`, GitHub issue `#15`.
- 후속 작업: 장기 이벤트 스키마 확정 전까지는 현재 세션 기준 해석 문구를 유지하고, 차트형 확장은 별도 이슈로 분리한다.

- 날짜: 2026-03-15
- 결정: 이번 `Insights 최근 변화와 다음 복습 시점 카드` 반복 검증 결과는 `flutter analyze` 통과, `flutter test --coverage` 통과, line coverage `92.03%`로 기록한다.
- 근거: `Insights` 3차 반복에도 line coverage 70% 이상 유지 규칙을 동일하게 적용해야 하기 때문이다.
- 영향 범위: QA 게이트, PR 본문 커버리지 기록, 이후 `Insights` 차트형 확장의 검증 포맷.
- 후속 작업: 이후 차트형 확장 작업에서도 `coverage/lcov.info` 기반 line coverage 계산식을 유지한다.
