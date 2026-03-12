# Repeato Resume Snapshot 2026-03-08 v1

## 메타
- 작성일: 2026-03-08
- 목적: 현재 작업 컨텍스트를 백업하고, 다음 세션에서 동일한 흐름으로 resume 하기 위한 기준점

## 1. 현재 상태 요약
- 5개 탭 상세 문서 작성 완료
- 탭 간 충돌 검토 완료
- QA 마스터 시나리오/시뮬레이션 문서 완료
- 로컬 퍼스트 아키텍처/SQLite/동기화/서버리스 설계 문서 완료
- 조직도/태깅 규칙/Workflow Enablement Group 정의 완료
- GitHub tracking workflow 문서/템플릿 추가 완료
- backup/resume 공통 workflow 및 snapshot template 추가 완료
- Iteration 1 개발:
  - `Today` 3단계 평가 UI 반영
  - 앱 구조를 `main.dart` 단일 파일에서 화면/모델 단위로 분리
  - 각 탭에 리뷰 설명 문구 추가
- Iteration 1 QA:
  - `flutter test` 통과
  - `flutter analyze` 통과
  - `flutter build web --release --base-href "/repeato/"` 통과

## 2. 현재 blocked / 주의사항
- 제 실행 세션에서는 `gh` 인증이 아직 확인되지 않음
- 사용자 터미널에서는 인증된 것으로 보임
- 실제 GitHub issue/branch/PR 생성 전에는 다시 `gh auth status`, `gh auth token` 확인 필요
- GitHub tracking 절차는 문서/템플릿까지 준비됐고, 실제 실행은 `gh` 세션 확인 후 시작

## 3. 다음 우선순위 후보
1. Add 직접 입력 MVP 구현
2. Deck 상세 화면과 Today 연결 구현
3. SQLite 로컬 저장 뼈대 구현

## 4. resume 시작 절차
1. 저장소 루트에서 현재 문서 기준 확인
   - `doc/next-actions.md`
   - `doc/context-log.md`
   - `doc/work/repeato-iteration-001-loop-v1.md`
   - `doc/work/repeato-delivery-organization-v1.md`
   - `doc/work/repeato-github-tracking-workflow-v1.md`
2. GitHub 인증 재확인
   - `gh auth status`
   - `gh auth token`
3. 다음 작업 1개 선택
4. 선택된 작업에 대해:
   - 조직 태그 부여
   - GitHub issue 생성
   - issue 번호 포함 브랜치 생성
   - 개발 3인 검토 기록
   - 구현 -> QA -> 사용자 피드백 -> PM 결정 루프 진행

## 5. resume 시 필수 참조 문서
- 조직/태깅 규칙:
  - `doc/work/repeato-delivery-organization-v1.md`
- GitHub 추적 규칙:
  - `doc/work/repeato-github-tracking-workflow-v1.md`
- workflow 분리:
  - `doc/work/repeato-workflow-extraction-v1.md`
  - `doc/work/repeato-workflow-agent-group-v1.md`
  - `doc/work/repeato-backup-resume-workflow-v1.md`
  - `doc/work/repeato-resume-snapshot-template-v1.md`
- 현재 반복 결과:
  - `doc/work/repeato-iteration-001-loop-v1.md`
- 사용자 그룹:
  - `doc/work/repeato-user-feedback-groups-v1.md`

## 6. resume용 한 줄 프롬프트 예시
- `resume snapshot 2026-03-08 기준으로 다음 작업 1순위부터 issue/branch/PR workflow로 시작해줘`
- `repeato-resume-snapshot-2026-03-08-v1 문서 기준으로 context 복원하고 Add MVP부터 진행해줘`

## 7. 백업 범위
- 문서 컨텍스트: `doc/`
- 코드 상태: `app/`
- GitHub workflow/템플릿: `.github/`

## 8. 권장 백업 방식
- 문서 백업:
  - 이 문서 + `doc/context-log.md` + `doc/next-actions.md`
- 코드 백업:
  - Git branch 또는 commit
- 재개 기준:
  - 이 문서와 `doc/next-actions.md`를 단일 시작점으로 사용

## 9. 마지막 backup 실행 기록
- 실행일: 2026-03-08
- 방식: `repeato-backup-resume-workflow-v1.md` 기준 수동 snapshot 갱신
- 포함 범위:
  - `doc/`
  - `app/`
  - `.github/`
- resume 기준 문서:
  - `doc/work/repeato-resume-snapshot-2026-03-08-v1.md`
