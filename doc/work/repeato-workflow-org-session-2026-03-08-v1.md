# Repeato Workflow Organization Session 2026-03-08 v1

## 메타
- 버전: v1
- 작성일: 2026-03-08
- 상태: Active
- 태그: `#STAGE-C #TASK-WORKFLOW #ORG-WF-ARCH #ORG-WF-LIB #ORG-WF-AUTO #ORG-PM`
- 목적: 현재 컨텍스트를 기준으로 workflow 조직이 같은 상태를 공유하고 다음 작업을 동일한 기준으로 재개하게 한다.

## 1. 세션 참가 조직
- Program Steering Group
  - `#ORG-PM`
  - `#ORG-ARCH`
- Workflow Enablement Group
  - `#ORG-WF-ARCH`
  - `#ORG-WF-LIB`
  - `#ORG-WF-AUTO`
- Engineering / QA 대표 관점
  - `#ORG-FE`
  - `#ORG-QA`

## 2. 현재 컨텍스트 요약
- GitHub CLI 인증은 정상 복구되었다.
- GitHub 이슈 `#1`과 브랜치 `feat/1-add-direct-input-mvp`로 `Add 직접 입력 MVP`를 시작했다.
- 구현 착수 전 workflow 측면의 추가 결정으로 `테스트 라인 커버리지 70% 이상 유지` 규칙을 도입했다.
- 이 규칙은 AGENTS, 공통 workflow, 개발 추적 문서, 이슈/PR 템플릿, QA 게이트에 연결됐다.
- `Add 직접 입력 MVP`는 로컬 구현 및 테스트를 마쳤고 line coverage `84.31%`를 기록했다.

## 3. 이번 세션의 확정 사항
1. 개발 조직은 테스트 라인 커버리지 70% 이상 유지를 기본 품질 기준으로 삼는다.
2. 커버리지가 70% 미만이면 PR에 측정값, 원인, 보완 일정, 승인자를 남겨야 한다.
3. 다음 개발 이슈부터 `coverage plan`을 이슈에 먼저 적고 구현을 시작한다.

## 4. 활성 참조 문서
- `AGENTS.md`
- `doc/reference/context-workflow.md`
- `doc/agents/app-agent-organization.md`
- `doc/work/repeato-delivery-organization-v1.md`
- `doc/work/repeato-github-tracking-workflow-v1.md`
- `doc/work/repeato-resume-snapshot-2026-03-08-v1.md`
- `doc/context/next-actions.md`

## 5. 오픈 안건
1. Flutter에서 사용할 표준 coverage 측정 명령과 보고 형식을 고정할 것인가
2. 70% 기준을 전체 앱 line coverage로 볼지, 변경 영역 중심 보조 규칙을 추가할지
3. coverage validator helper를 workflow 자동화 우선순위에 올릴지
4. 다음 구현인 `Deck 상세 화면과 Today 연결`도 같은 coverage 보고 포맷으로 진행할지

## 6. 다음 실행 순서
1. `Add 직접 입력 MVP` 변경을 PR 단계로 넘길 커밋/본문 정리
2. PR에 coverage `84.31%` 결과 기록
3. 다음 이슈로 `Deck 상세 화면과 Today 연결` 생성
4. 이슈에 `coverage plan` 기록
5. QA가 70% 유지 여부와 예외 문서화를 계속 확인

## 7. 세션 종료/재개 규칙
- 이 문서는 workflow 조직의 현재 활성 세션 기준점으로 유지한다.
- 다음 세션에서 workflow 재개 시 이 문서와 `doc/context/context-log.md`, `doc/context/next-actions.md`를 함께 읽는다.
- 더 최신 workflow 조직 세션 문서가 생성되면 이 문서는 히스토리로 남기고 최신 문서를 `resume 기준`으로 사용한다.
