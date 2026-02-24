# Context Log (결정/근거)

## Log Template
- 날짜:
- 결정:
- 근거:
- 영향 범위:
- 후속 작업:

---

## Entries
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
- 결정: 산출물 가치 문서는 `doc/work` 하위에 보존하고 `doc/project-context.md`는 인덱스 허브로 운영한다.
- 근거: project-context 비대화를 막고, 필요 시점에 상세 산출물을 선택적으로 로드하기 위함.
- 영향 범위: 문서 저장 구조, Repeato 헌법 본문 위치, AGENTS/Workflow 문서 운영 규칙.
- 후속 작업: 신규 산출물 작성 시 `doc/work/index.md`를 함께 갱신하는 체크리스트 추가 검토.

- 날짜: 2026-02-22
- 결정: Repeato 기획 1~6 항목은 전 Agent(공통 9 + 전문가 2) 회의체 3차 검토 후 `doc/work/repeato-constitution-v1.md`로 확정한다.
- 근거: 제품 취지, 학습과학 근거, 구현 가능성, 품질/보안/운영성까지 동시에 충족하는 합의가 필요했기 때문.
- 영향 범위: `doc/work/repeato-constitution-v1.md`, `doc/project-context.md` 인덱스, `AGENTS.md` 헌법 운영 규칙.
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
- 결정: 앱 개발 공통 Agent 조직은 `doc/app-agent-organization.md`로 고정하고, Repeato 전용 전문가는 `doc/repeato-agent-extension.md`로 분리한다.
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
- 결정: `context-workflow`를 공통 재사용 표준으로 분리하고 Repeato 전용 흐름은 `doc/repeato-workflow.md`로 분리한다.
- 근거: 제품별 의사결정 규칙과 컨텍스트 운영 절차를 분리해야 다른 프로젝트에도 동일한 workflow를 재사용할 수 있기 때문.
- 영향 범위: AGENTS 참조 구조, 작업 시작/종료 절차, 문서 확장 방식.
- 후속 작업: 다른 프로젝트 적용 시 `<project>-workflow.md` 템플릿으로 변환 검증.

- 날짜: 2026-02-22
- 결정: `doc/plan-checklist.md`를 `doc/project-context.md` 기준으로 재정렬한다.
- 근거: 초기 제품 방향과 상세 요구사항 문서의 불일치를 줄여 우선순위 판단을 빠르게 하기 위함.
- 영향 범위: 요구사항 정의, MVP 범위 수립, 후속 기술 설계.
- 후속 작업: 카드 템플릿/스케줄 간격표/KPI 정의를 우선 확정.

- 날짜: 2026-02-22
- 결정: 컨텍스트 운영은 저장소 로컬 프로토콜(AGENTS + doc 세트)로 고정한다.
- 근거: 즉시 적용 가능하고 세션 간 일관성을 유지하기 쉽기 때문.
- 영향 범위: 모든 작업의 기록/이월/정리 방식.
- 후속 작업: 다음 작업부터 inbox/log/next-actions를 실제 운영하며 필요 시 경량화.
