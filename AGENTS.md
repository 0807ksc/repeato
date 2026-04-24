# AGENTS.md

## 목적
- 이 문서는 이 저장소에서 작업하는 에이전트의 실행 규칙을 정의한다.
- 제품/도메인 상세 컨텍스트는 `doc/reference/project-context.md`를 단일 기준으로 참조한다.

## 프로젝트 컨텍스트 규칙
- 루트 `README.md`는 workflow 빠른 진입 문서로 사용하고, 확정 정책/상세 절차는 `doc/*`, `doc/work/*`를 기준으로 유지한다.
- 기능/정책/우선순위 판단 시 먼저 `doc/reference/project-context.md`를 확인한다.
- 요구사항 상세 정의가 필요하면 `doc/reference/plan-checklist.md`를 따른다.
- 컨텍스트와 구현이 충돌하면, 에이전트는 임의 판단하지 않고 변경 제안을 남긴다.
- 공통 앱 에이전트 조직/협업은 `doc/agents/app-agent-organization.md`를 기준으로 적용한다.
- Repeato 전용 전문가 에이전트 확장은 `doc/agents/repeato-agent-extension.md`를 기준으로 적용한다.

## Repeato 헌법 운영 규칙
- Repeato 기획/정책/핵심 기능 변경 요청은 반드시 `3차 회의체 검토`를 수행한다.
- 회의체 필수 구성: PM, Product Designer, Technical Architect, Frontend Engineer, Backend Engineer, QA Engineer, DevOps/SRE, Data Analyst, Security/Privacy, Education Specialist, Cognitive Science Specialist.
- 각 라운드에서 아래 6개 항목을 모두 검토하고, 합의/수정/보류를 기록한다.
- 항목:
- 앱 목적
- 사용자 이익
- 지속 가능 포인트
- 타깃 사용자
- 필수 철학/핵심 기능
- 금지 사항(하면 안 되는 것)
- 3차 검토 결과 본문은 `doc/work` 하위 문서에 반영하고, `doc/reference/project-context.md`에는 해당 문서 인덱스/참조를 남긴다.
- 구현/운영 방법은 `AGENTS.md`에 반영한다.
- 3차 합의가 완료되지 않은 항목은 확정 정책으로 간주하지 않는다.

## 작업 원칙
- 작은 단위로 변경하고, 각 변경은 검증 가능해야 한다.
- 기존 파일/구조를 우선 존중하고 불필요한 리팩터링을 피한다.
- 사용자 요청 범위를 벗어나는 확장은 하지 않는다.
- 개발 조직은 테스트 라인 커버리지 70% 이상을 유지하도록 작업한다.
- 커버리지가 70% 아래로 내려갈 가능성이 있으면 구현 전에 원인/보완계획/예외 승인 필요 여부를 workflow에 기록한다.

## 요청 분류/반영 규칙
- 공통 workflow 설계/절차/템플릿/재사용성에 대한 요청은 `doc/reference/context-workflow.md`와 관련 공통 자산(`skills/context-workflow`)에 반영한다.
- Repeato 제품 기능/정책/요구사항/산출물에 대한 요청은 `doc/reference/repeato-workflow.md` 기준으로 Repeato 문서/구현에 반영한다.
- 하나의 요청에 두 성격이 함께 있으면 둘 다 반영한다.
- 분류가 모호하면 `doc/context/context-log.md`에 분류 판단 근거를 남기고, 이후 동일 유형에 재사용한다.

## 작업별 에이전트 호출 규칙
- 모든 작업 시작은 문서 기록보다 먼저 사용자와의 대화로 요구사항을 정리하는 단계에서 시작한다.
- 요구사항이 정리되면 `doc/agents/app-agent-organization.md`와 `doc/work/repeato-delivery-organization-v1.md` 기준으로 이번 작업 에이전트 세트, 담당 조직, 단계 태그, 작업 태그를 자동 선택한다.
- 개발 작업은 `doc/work/repeato-github-tracking-workflow-v1.md` 기준의 `이슈 -> 브랜치 -> 구현 -> PR -> QA -> 머지` 절차를 필수로 따른다.
- 개발 작업의 테스트 검증에는 커버리지 확인을 포함하고, PR에는 현재 커버리지 결과를 남긴다.
- 구현 시작 전에는 Development Lead 포함 3명의 개발자가 역할을 나눠 구현 방안을 검토하고, 그 결과를 GitHub 이슈에 남긴다.
- GitHub 인증이 막혀 이슈 생성이 불가하면 `GitHub issue pending` 상태로 기록하고, 실제 PR 전에는 반드시 복구한다.
- 선택된 에이전트 세트는 `doc/context/context-log.md`에 작업 결정으로 기록한다.
- Repeato 작업이면 `doc/agents/repeato-agent-extension.md`를 추가 적용하고, 기획 단계에서 교육 전문가/인지과학 전문가 동시 검토를 수행한다.
- 구현 작업은 최소 `Architect + Engineer + QA` 조합을 유지한다.
- 정책/요구사항 작업은 최소 `PM + (Designer 또는 Architect)` 조합을 유지한다.
- 여러 탭 작업을 병렬로 진행할 때는 `PM`을 상위 오케스트레이터로 두고, 탭별 에이전트는 PM을 통해 선행작업/질문/대기 상태를 공유한다.
- 탭 간 연동 이슈가 생기면 관련 탭 에이전트를 추가 호출해 질의/응답과 합의 결과를 각 탭 문서에 남긴다.
- 동기화/결제/집계/가져오기 등 서버 의존성이 확인되면 `Backend Engineer`를 해당 탭 라운드에 즉시 추가한다.
- 5개 탭 병렬 검토와 `ready / blocked / in_review / done` 상태 운영은 `doc/work/repeato-tab-orchestration-v1.md`를 따른다.
- 각 단계/작업 항목 문서에는 가능한 한 `#STAGE-*`, `#TASK-*`, `#ORG-*` 태그를 명시한다.
- 작업/조직 관리에서 재사용 가능한 규칙은 Workflow Enablement Group이 분리해 `doc/work/repeato-workflow-extraction-v1.md` 계열 문서로 축적한다.
- 모든 프롬프트 작업은 아래 강제 순서를 따른다:
- `PM + Architect` 사전 검토(기존 스펙 충돌/서비스 취지 적합성)
- `Architect` 상세 작업 계획 수립
- `Engineer + Designer` 구현
- `PM + Architect` 사후 적합성 검토(기획/설계 지침 충족 확인)
- `QA` 테스트 및 승인

## 문서 업데이트 원칙
- 역할별 폴더 기준:
- `doc/agents`: agent/role/협업 규칙
- `doc/reference`: 기준 workflow/context/checklist/project 문서
- `doc/context`: inbox/log/next-actions/prune 같은 세션 기록
- `doc/work`: 장기 참조가 필요한 산출물
- `doc/work/archive`: 활성 사용이 끝난 로컬 문서
- 제품 방향 변경: `doc/reference/project-context.md` 갱신
- 요구사항 정의 확장: `doc/reference/plan-checklist.md` 갱신
- 에이전트 동작 규칙 변경: `AGENTS.md` 갱신
- 산출물 가치 문서(기획안/정책안/회의결과/결정 상세)는 `doc/work` 하위에 생성/보존한다.
- 기능 단위 상세 spec/진행 메모는 GitHub 이슈/PR을 우선 저장소로 사용한다.
- GitHub 이슈가 canonical source가 된 뒤 로컬 문서가 더 이상 필요 없으면 `doc/work/archive`로 이동하거나 제거한다.
- `doc/reference/project-context.md`에는 상세 본문을 누적하지 않고 `doc/work` 문서 인덱스/참조만 유지한다.

## 컨텍스트 관리 프로토콜 (항상 적용)
- Repeato 전용 작업 흐름: `doc/reference/repeato-workflow.md`
- 표준 흐름 문서: `doc/reference/context-workflow.md`
- 임시 컨텍스트: `doc/context/context-inbox.md`
- 결정 로그: `doc/context/context-log.md`
- 다음 작업 큐: `doc/context/next-actions.md`
- 정리 규칙: `doc/context/context-prune-rules.md`

작업 규칙:
- 작업 시작 시 먼저 사용자와 대화로 요청을 정리하고, 정리된 요구사항만 `doc/context/context-inbox.md`에 기록한다.
- 유의미한 결정은 `doc/context/context-log.md`에 남긴다.
- 미완료 작업은 `doc/context/next-actions.md`에 우선순위와 함께 남긴다.
- 작업 종료 전 inbox를 프루닝해 미해결 항목만 유지한다.
