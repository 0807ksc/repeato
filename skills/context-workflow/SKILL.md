---
name: context-workflow
description: 어떤 저장소에서도 재사용 가능한 컨텍스트 관리 워크플로우다. 사용자와의 대화로 요구사항을 정리한 뒤 요청 접수, 결정 로그, 다음 작업 큐, 프루닝 절차를 스킬 또는 에이전트 규칙으로 표준화할 때 사용한다.
---

# 컨텍스트 워크플로우 스킬

## 사용 시점
- 사용자가 작업 컨텍스트 관리 방식을 표준화해 달라고 요청할 때
- 여러 저장소에서 같은 워크플로우를 재사용하고 싶을 때
- 워크플로우를 스킬 또는 에이전트 정책으로 패키징하고 싶을 때

## 이 스킬이 설치하는 것
- `doc/reference/context-workflow.md` 재사용 가능한 프로세스 가이드
- `doc/context/context-inbox.md` 임시 컨텍스트 버퍼
- `doc/context/context-log.md` 결정 로그
- `doc/context/next-actions.md` 우선순위 큐
- `doc/context/context-prune-rules.md` 프루닝 규칙
- `doc/agents/app-agent-organization.md` 공통 앱 에이전트 조직 및 협업 프로토콜
- 선택 프로젝트 전용 워크플로우 파일: `doc/reference/<project>-workflow.md`

## 실행 단계
1. 먼저 사용자와의 대화로 목표, 범위, 비범위, 제약사항, 성공 조건을 정리한다.
2. `assets/templates/`의 템플릿으로 필요한 문서 세트를 만든다.
3. `references/agent-integration.md`의 에이전트 통합 블록을 저장소 `AGENTS.md`에 추가한다.
4. 저장소에 도메인 문서가 있으면 프로젝트 전용 흐름을 `doc/reference/<project>-workflow.md`로 분리한다.
5. 워크플로우를 즉시 사용한다.
- 요청 요약을 inbox에 기록한다.
- 확정된 결정을 log로 승격한다.
- 미완료 항목을 P1/P2/P3와 함께 next-actions로 이월한다.
- 턴 종료 전에 inbox를 정리한다.

## 빠른 시작
- `scripts/init_context_workflow.sh <target_dir> <project_name>`를 실행해 문서를 초기화하고 AGENTS용 스니펫을 출력한다.

## 검증 체크리스트
- `AGENTS.md`가 `doc/reference/context-workflow.md`와 `doc/reference/<project>-workflow.md`(또는 동등한 프로젝트 워크플로우)를 함께 참조한다.
- 프루닝 후 inbox에는 미해결 임시 메모만 남아 있다.
- decision log에는 이번 반복의 확정 결정이 최소 1개 이상 있다.
- next-actions에는 미완료 작업이 우선순위와 함께 유지된다.

## 참고 자료
- 에이전트 통합 스니펫: `references/agent-integration.md`
- 파일 템플릿: `assets/templates/`
