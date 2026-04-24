# Repeato Workflow Extraction v1

## 메타
- 버전: v1
- 작성일: 2026-03-08
- 상태: Active
- 목적: 작업 관리/조직 관리 절차를 제품 구현과 분리해 추후 skill 또는 plugin으로 독립시킬 수 있게 한다.

## 1. 분리 대상
- 작업 시작 조직 세팅
- task 태깅
- 이슈/브랜치/PR/머지 추적
- blocked/unblock 관리
- 사용자 피드백 루프 관리
- PM/조직 리더 task 관리 절차

## 2. 분리 후보 모듈

### Module A. Work Intake
- 범위:
  - 요청 수신
  - 조직/태그 배정
  - inbox/log/next-actions 반영
- 추후 형태:
  - skill 또는 lightweight plugin

### Module B. Delivery Tracking
- 범위:
  - GitHub issue/branch/PR/merge 표준 절차
  - 개발 3인 역할 배정
  - QA/PM 게이트
  - 테스트 커버리지 70% 유지 체크
- 추후 형태:
  - skill + GitHub helper script

### Module C. Org Coordination
- 범위:
  - PM 상태판
  - 조직 리더 task 현황
  - blocked 관리
- 추후 형태:
  - plugin 또는 dashboard generator

### Module D. User Feedback Loop
- 범위:
  - 사용자 그룹 구성
  - 설명 스크립트
  - 피드백 기록 템플릿
- 추후 형태:
  - skill/template pack

### Module E. Backup / Resume
- 범위:
  - snapshot 작성
  - resume 시작 절차
  - Git/GitHub 상태 복원 기준
- 추후 형태:
  - skill/template pack + helper script

## 3. 추출 산출물 목록
- 조직도/태깅 규칙
- GitHub tracking workflow
- iteration loop template
- user feedback group template
- org leader task board template
- backup/resume snapshot template

## 4. PM 부가 산출물
- PM은 제품 task와 별도로 workflow 분리 산출물을 유지한다.
- 제품 개발 도중 생긴 운영 규칙/조직 관리 규칙은 이 문서 계열로 계속 분리 기록한다.

## 5. 조직 리더 분리 관리 원칙
- 각 조직 리더는 자기 task 진행 규칙도 제품 기능 문서와 분리한다.
- 공통 운영 규칙은 workflow 문서로 올리고, 기능 문서에는 결과만 남긴다.

## 6. 다음 추출 후보
1. issue/branch/pr helper script
2. org leader checklists
3. iteration review template
4. GitHub auth readiness checklist
5. coverage 70% validator / report helper
6. backup/resume helper script

## 7. 현재 경계 판단(`doc/work` vs `skills`)
- `doc/work`:
  - Repeato 전용 정책, 버전이 있는 운영 규칙, 회의 결과, 조직 결정, GitHub tracking 절차를 계속 보존한다.
- 루트 `README.md`:
  - 사람이 가장 먼저 읽는 진입 문서로 유지한다.
- `skills/context-workflow`:
  - 다른 저장소에도 재사용 가능한 공통 workflow만 둔다.
- `skills/repeato-workflow`:
  - Repeato 저장소에서 반복 실행하는 얇은 Codex 지침만 둔다.

결론:
- 기존 `doc/work` 문서를 통째로 skill로 옮기지 않는다.
- 권위 문서는 `doc/work` 에 남기고, 반복 실행 규칙만 skill로 추출한다.
- 사용자의 자연어 요청을 받아 요구사항을 정리하는 시작 단계는 문서보다 우선하며, 문서는 그 결과를 기록하는 역할로 유지한다.
