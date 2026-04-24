# Repeato 워크플로우

## 목적
- Repeato 도메인 의사결정과 구현 우선순위를 공통 컨텍스트 워크플로우와 분리해 관리한다.

## 빠른 진입
- 전체 흐름 요약과 그림은 루트 `README.md`를 먼저 본다.
- 이 문서는 Repeato 전용의 기준 규칙만 간결하게 유지한다.

## 기준 문서
- 제품 방향/정책: `doc/reference/project-context.md`
- 요구사항 상세: `doc/reference/plan-checklist.md`
- 컨텍스트 운영(공통): `doc/reference/context-workflow.md`
- 공통 에이전트 조직: `doc/agents/app-agent-organization.md`
- Repeato 전문가 확장: `doc/agents/repeato-agent-extension.md`

## Repeato 전용 작업 흐름
1. 시작 전 확인
- `doc/reference/project-context.md`에서 이번 작업이 제품 목표/범위와 일치하는지 확인한다.
- 관련 상세 산출물이 있으면 `doc/work/index.md`에서 필요한 문서를 먼저 찾는다.

2. 대화형 요구사항 정리
- 먼저 사용자와 대화하면서 목표, 범위, 비범위, 제약사항, 성공 조건을 정리한다.
- 요구사항이 충분히 정리되기 전에는 구현 계획이나 GitHub 절차로 넘어가지 않는다.

3. 요청 분류와 조직 세팅
- 요청이 공통 workflow 개선인지, Repeato 결과물 변경인지 먼저 나눈다.
- 요구사항이 정리되면 `doc/work/repeato-delivery-organization-v1.md` 기준으로 단계 태그, 작업 태그, 담당 조직을 자동 배정한다.

4. 요구사항 해석
- 상세 정의가 필요하면 `doc/reference/plan-checklist.md` 항목으로 구체화한다.
- 기획 단계에서는 교육 전문가 에이전트와 인지과학 전문가 에이전트를 동시 호출해 검토 의견을 반영한다.

5. 개발 추적 분기
- 개발 작업이면 `doc/work/repeato-github-tracking-workflow-v1.md` 기준의 `이슈 -> 브랜치 -> 구현 -> PR -> QA -> 머지` 절차를 연다.
- 문서/정책 작업이면 관련 `doc/work/*` 산출물을 갱신한다.
- 기능 단위 spec/진행 메모는 GitHub issue/PR을 우선 사용하고, 여러 이슈에서 계속 쓰는 문서만 `doc/work/*`에 남긴다.

6. 구현/문서 반영
- Repeato 기능 변경은 관련 구현 파일과 요구사항 문서에 동시에 반영한다.
- 여러 탭 병렬 작업이면 `doc/work/repeato-tab-orchestration-v1.md` 조율 규칙을 적용한다.

7. 충돌 처리
- 컨텍스트와 구현이 충돌하면 임의 확정하지 않고 변경 제안을 남긴다.

8. 종료 검증
- 변경 내용이 Repeato 범위를 벗어나지 않았는지 점검한다.
- 학습 정책 관련 변경이면 전문가 2종(Education/Cognitive Science) 검토 반영 여부를 확인한다.
- 작업 종료 시 `doc/context/context-log.md`, `doc/context/next-actions.md`, prune 절차를 마무리한다.

## 사용 방법
- Repeato 작업을 시작할 때:
  - 큰 그림은 `README.md`로 확인하고, 도메인 판단은 이 문서(`doc/reference/repeato-workflow.md`)를 적용한다.
  - 먼저 사용자와 요구사항을 대화로 정리한다.
  - 기록/로그/이월/프루닝은 `doc/reference/context-workflow.md` 절차를 그대로 적용한다.
  - workflow 개선 요청이 포함되면 해당 부분은 `doc/reference/context-workflow.md`(또는 `skills/context-workflow`)에 반영하고, Repeato 결과물은 이 문서 기준으로 반영한다.
- 다른 프로젝트에 이 저장소의 컨텍스트 체계를 재사용할 때:
  - `doc/reference/context-workflow.md`와 관련 context 파일 세트를 복사한다.
  - 이 문서 대신 `doc/reference/<project>-workflow.md`를 새로 만든다.
