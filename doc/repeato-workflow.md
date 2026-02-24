# Repeato Workflow

## 목적
- Repeato 도메인 의사결정과 구현 우선순위를 공통 컨텍스트 워크플로우와 분리해 관리한다.

## 기준 문서
- 제품 방향/정책: `doc/project-context.md`
- 요구사항 상세: `doc/plan-checklist.md`
- 컨텍스트 운영(공통): `doc/context-workflow.md`
- 공통 Agent 조직: `doc/app-agent-organization.md`
- Repeato 전문가 확장: `doc/repeato-agent-extension.md`

## Repeato 전용 작업 흐름
1. 시작 전 확인
- `doc/project-context.md`에서 이번 작업이 제품 목표/범위와 일치하는지 확인한다.

2. 요구사항 해석
- 상세 정의가 필요하면 `doc/plan-checklist.md` 항목으로 구체화한다.
- 기획 단계에서는 Education Specialist Agent와 Cognitive Science Specialist Agent를 동시 호출해 검토 의견을 반영한다.

3. 구현/문서 반영
- Repeato 기능 변경은 관련 구현 파일과 요구사항 문서에 동시에 반영한다.

4. 충돌 처리
- 컨텍스트와 구현이 충돌하면 임의 확정하지 않고 변경 제안을 남긴다.

5. 종료 검증
- 변경 내용이 Repeato 범위를 벗어나지 않았는지 점검한다.
- 학습 정책 관련 변경이면 전문가 2종(Education/Cognitive Science) 검토 반영 여부를 확인한다.

## 사용 방법
- Repeato 작업을 시작할 때:
  - 도메인 판단은 이 문서(`doc/repeato-workflow.md`)를 먼저 적용한다.
  - 기록/로그/이월/프루닝은 `doc/context-workflow.md` 절차를 그대로 적용한다.
  - workflow 개선 요청이 포함되면 해당 부분은 `doc/context-workflow.md`(또는 `skills/context-workflow`)에 반영하고, Repeato 결과물은 이 문서 기준으로 반영한다.
- 다른 프로젝트에 이 저장소의 컨텍스트 체계를 재사용할 때:
  - `doc/context-workflow.md`와 관련 context 파일 세트를 복사한다.
  - 이 문서 대신 해당 프로젝트의 `<project>-workflow.md`를 새로 만든다.
