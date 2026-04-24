# Documentation Map

## 폴더 역할
- `doc/agents/`: 공통/제품 전용 agent 역할, 협업 규칙, 확장 문서
- `doc/reference/`: 오래 유지되는 기준 문서, workflow, project context, checklist
- `doc/context/`: 세션 단위 inbox/log/next-actions/prune 문서
- `doc/work/`: GitHub issue 하나를 넘어 재사용되는 로컬 산출물
- `doc/work/archive/`: 현재는 활성 참조가 끝난 로컬 문서 보관소

## spec 문서 운영 원칙
- 기능 단위 상세 spec, 진행 메모, 이슈별 판단은 GitHub issue/PR을 1차 저장소로 사용한다.
- 여러 이슈에서 계속 참조해야 하는 문서만 `doc/work/`에 남긴다.
- GitHub issue가 canonical source가 된 뒤 로컬 문서가 더 이상 필요 없으면 `doc/work/archive/`로 이동하거나 삭제한다.
- 삭제 전에는 최소한 GitHub issue 번호 또는 대체 문서 경로를 `doc/work/index.md`나 관련 기준 문서에 남긴다.

## 현재 단계
- 1차 정리: `agent/reference/context` 문서를 역할별 폴더로 분리
- 다음 정리 후보: `doc/work/` 내 active/archive 분리와 issue 링크 기준 정리
