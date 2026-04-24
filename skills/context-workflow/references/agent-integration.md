# 에이전트 통합

아래 블록을 `AGENTS.md`에 넣으면 워크플로우를 에이전트 레벨에서 재사용할 수 있다.

```md
## 컨텍스트 관리 프로토콜(항상 적용)
- 프로젝트 워크플로우: `doc/reference/<project>-workflow.md`
- 표준 워크플로우: `doc/reference/context-workflow.md`
- 임시 컨텍스트: `doc/context/context-inbox.md`
- 결정 로그: `doc/context/context-log.md`
- 다음 작업 큐: `doc/context/next-actions.md`
- 정리 규칙: `doc/context/context-prune-rules.md`

작업 규칙:
- 작업 시작 시 요청을 `doc/context/context-inbox.md`에 요약한다.
- 유의미한 결정을 `doc/context/context-log.md`에 기록한다.
- 미완료 작업을 우선순위와 함께 `doc/context/next-actions.md`로 옮긴다.
- 작업 종료 전 inbox를 정리하고 미해결 항목만 남긴다.
```

프로젝트 전용 메모:
- 제품/도메인 규칙은 `doc/reference/<project>-workflow.md`에 둔다.
- `doc/reference/context-workflow.md`는 제품 비종속적으로 유지해 다른 저장소로 복사 가능하게 한다.
