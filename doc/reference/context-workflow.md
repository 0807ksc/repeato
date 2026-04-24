# 컨텍스트 워크플로우(재사용 가능)

## 목적
- 어떤 프로젝트에서도 작업 컨텍스트를 일관되게 기록/이월/정리하기 위한 공통 운영 규약.
- 제품 문서(`project-context` 같은 도메인 문서)와 분리해 재사용 가능하게 유지한다.

## 파일 구성
- `doc/context/context-inbox.md`: 임시 메모(가설, 검증 전 판단, 확인 필요 항목)
- `doc/context/context-log.md`: 확정 결정(결정/근거/영향 범위/후속 작업)
- `doc/context/next-actions.md`: 우선순위 기반 다음 작업 큐
- `doc/context/context-prune-rules.md`: inbox 정리 기준
- `doc/agents/app-agent-organization.md`: 공통 앱 개발 에이전트 조직/협업 규칙
- `doc/reference/`: 프로젝트 기준 workflow, context, checklist, project context
- `doc/work/`: 산출물 가치 문서 보존 폴더(기획안/정책안/회의결과/결정 상세)

## 폴더 역할
- `doc/agents/`: agent 역할과 협업 규칙
- `doc/reference/`: 오래 유지되는 기준 문서
- `doc/context/`: 세션 단위 기록과 정리 대상 문서
- `doc/work/`: GitHub issue 하나를 넘어 참조되는 로컬 산출물
- `doc/work/archive/`: 활성 사용이 끝난 로컬 문서

## 표준 작업 흐름
1. 요청 수신
- 먼저 사용자와 대화해 목표, 범위, 비범위, 제약사항, 성공 조건을 정리한다.
- 요구사항이 정리된 뒤에만 요청/이슈를 `doc/context/context-inbox.md` 상단에 3~5줄로 요약한다.

1.1 요청 분류
- 요청이 공통 workflow 개선인지, 프로젝트 결과물 생성인지 분류한다.
- 공통 workflow 관련이면 이 문서와 공통 자산(스킬/템플릿)에 반영한다.
- 프로젝트 결과물 관련이면 해당 프로젝트 workflow 문서로 이관해 처리한다(예: `doc/reference/repeato-workflow.md`).

2. 실행 단위 정의
- 지금 바로 처리할 항목을 `doc/context/next-actions.md`에 1~3개로 등록한다.

2.1 에이전트 세트 선택
- `doc/agents/app-agent-organization.md`를 기준으로 이번 작업에 필요한 에이전트를 선택한다.
- 선택된 에이전트와 역할 분담(예: PM, Architect, Backend, QA)을 `doc/context/context-log.md`에 기록한다.

2.2 자동 조직/태그 배정
- 요구사항이 정리되면 단계 태그, 작업 태그, 담당 조직을 문서 규칙에 따라 자동 배정한다.
- 사용자가 태그나 조직을 직접 지정할 필요는 없고, 에이전트가 `doc/work/<project>-delivery-organization*.md` 규칙으로 선택한다.

2.3 사전 검토 게이트
- `PM + Architect`가 기존 스펙 충돌 여부와 서비스 취지 적합성을 검토한다.
- 사전 검토를 통과하기 전에는 구현 단계로 넘어가지 않는다.

2.4 설계 계획 게이트
- `Architect`가 상세 작업 계획(단계/리스크/검증 기준)을 확정한다.
- 계획 확정 후에만 Engineer/Designer 실행을 시작한다.
- 개발 작업이면 이 단계에서 테스트 전략과 목표 커버리지(기본 70% 이상)를 함께 적는다.

3. 실행 중 임시 기록
- 미확정 내용은 `doc/context/context-inbox.md`에만 적고, 확정 전에는 로그로 승격하지 않는다.

4. 결정 확정
- 유의미한 결정은 `doc/context/context-log.md`로 승격한다.
- 최소 항목: 날짜, 결정, 근거, 영향 범위, 후속 작업.

5. 이월 정리
- 미완료 항목은 `doc/context/next-actions.md`로 이동하고 우선순위(P1/P2/P3)를 지정한다.

5.1 사후 검토/QA 게이트
- 구현 완료 후 `PM + Architect`가 기획/설계 지침 충족 여부를 검토한다.
- 이후 `QA` 테스트를 수행하고 승인될 때만 작업 완료로 처리한다.
- 개발 변경은 가능하면 커버리지를 측정하고, 라인 커버리지 70% 미만이면 사유와 후속 보완 계획을 남긴다.

6. 종료 전 프루닝
- `doc/context/context-prune-rules.md` 기준으로 inbox를 정리해 미해결 항목만 남긴다.

6.1 산출물 보존
- 재사용 가치가 있는 상세 결과물은 `doc/work` 하위 문서로 저장한다.
- 기능 단위 상세 spec/진행 메모는 GitHub issue/PR을 1차 저장소로 두고, 장기 참조 문서만 `doc/work`에 남긴다.
- 활성 사용이 끝난 로컬 문서는 `doc/work/archive/`로 이동하거나 삭제한다.
- `doc/reference/project-context.md`에는 상세 본문 대신 `doc/work` 문서 인덱스만 갱신한다.

## 재사용 방법
1. 새 프로젝트에 `doc/context/` 문서 세트, `doc/reference/context-workflow.md`, `doc/agents/app-agent-organization.md`를 복사한다.
2. 프로젝트 고유 규칙은 `doc/reference/<project>-workflow.md` 같은 별도 문서로 분리한다.
3. 에이전트 규칙 문서(`AGENTS.md`)에는 공통 workflow 파일과 프로젝트 전용 workflow 파일을 함께 참조시킨다.
4. 공통 workflow는 제품 정책을 넣지 않고, 기록/결정/이월/정리 절차만 유지한다.

## 스킬/에이전트 재사용
- 스킬 패키지 경로: `skills/context-workflow/SKILL.md`
- 빠른 초기화: `skills/context-workflow/scripts/init_context_workflow.sh <target_dir> <project_name>`
- AGENTS 통합 가이드: `skills/context-workflow/references/agent-integration.md`
- 공통 에이전트 조직 템플릿: `skills/context-workflow/assets/templates/app-agent-organization.md`

## 적용 예시
- 제품 고유 판단: `doc/reference/repeato-workflow.md`
- 컨텍스트 운영 표준: `doc/reference/context-workflow.md`

## 완료 체크리스트
- `doc/context/context-log.md`에 이번 턴의 확정 결정이 기록됨
- `doc/context/next-actions.md`에 미완료 항목이 우선순위와 함께 유지됨
- `doc/context/context-inbox.md`에 미해결 임시 항목만 남음
