# __PROJECT_NAME__ 워크플로우

## 목적
- __PROJECT_NAME__ 전용 도메인 의사결정을 재사용 가능한 컨텍스트 워크플로우와 분리해 유지한다.

## 기준 문서
- 제품/도메인 컨텍스트: `doc/reference/project-context.md`
- 상세 요구사항: `doc/reference/plan-checklist.md`
- 재사용 가능한 컨텍스트 운영: `doc/reference/context-workflow.md`

## 프로젝트 전용 흐름
1. 작업이 프로젝트 도메인 범위와 맞는지 확인한다.
2. 프로젝트 요구사항 문서에서 상세 조건을 해석한다.
3. 코드/문서 변경은 요청된 범위 안에서만 반영한다.
4. 구현이 프로젝트 컨텍스트와 충돌하면 강제 확정 대신 변경 제안을 기록한다.
5. 결과물이 프로젝트 경계를 벗어나지 않았는지 검증한다.

## 사용 방법
- 도메인 의사결정에는 이 파일을 사용한다.
- 수집/로그/이월/정리 절차에는 `doc/reference/context-workflow.md`를 사용한다.
- 이 파일은 `doc/reference/` 아래에 두고, `doc/context/`와 `doc/agents/` 문서와 분리해 유지한다.
