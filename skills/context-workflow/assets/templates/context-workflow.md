# 컨텍스트 워크플로우(재사용 가능)

## 목적
- 작업마다 컨텍스트 수집, 결정 기록, 이월, 정리를 일관되게 유지한다.
- 이 파일을 제품 비종속적으로 유지해 어떤 저장소에서도 재사용할 수 있게 한다.

## 파일
- `doc/context/context-inbox.md`: 임시 메모와 미해결 질문
- `doc/context/context-log.md`: 근거가 포함된 확정 결정
- `doc/context/next-actions.md`: 우선순위가 매겨진 미완료 작업
- `doc/context/context-prune-rules.md`: 정리 규칙
- `doc/agents/app-agent-organization.md`: 공통 에이전트 역할과 협업 규칙
- `doc/reference/<project>-workflow.md`: 프로젝트 전용 기준 문서

## 표준 흐름
1. 들어온 요청 요약을 inbox에 기록한다.
2. 필요한 에이전트 세트를 선택하고 context-log에 기록한다.
3. 사전 검토 게이트: PM + Architect가 스펙 충돌과 서비스 취지 적합성을 점검한다.
4. 계획 게이트: Architect가 상세 실행 계획을 작성한다.
5. Engineer + Designer가 구현을 수행한다.
6. 사후 검토 게이트: PM + Architect가 구현 결과를 계획과 대조해 검증한다.
7. QA 게이트: 테스트를 수행하고 승인한다.
8. 확정된 결정을 context-log로 승격한다.
9. 미완료 작업을 P1/P2/P3와 함께 next-actions로 이동한다.
10. 작업 종료 전에 inbox를 정리한다.

## 종료 기준
- context-log에 유의미한 결정이 최소 1개 이상 있다.
- next-actions에 미완료 작업이 우선순위와 함께 있다.
- inbox에는 미해결 임시 메모만 남아 있다.
