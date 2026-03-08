# Repeato Backup Resume Workflow v1

## 메타
- 버전: v1
- 작성일: 2026-03-08
- 상태: Active
- 목적: Workflow Enablement Group이 재사용 가능한 backup/resume 절차를 표준 workflow로 관리한다.

## 1. 적용 대상
- 반복 작업 중간 종료
- 세션 전환
- 다른 에이전트/조직으로 핸드오프
- GitHub issue/branch/PR 작업 재개
- 사용자 피드백 이후 다음 반복 재개

## 2. 담당 조직
- 주관:
  - `#ORG-WF-ARCH`
  - `#ORG-WF-LIB`
- 지원:
  - `#ORG-WF-AUTO`
  - `#ORG-PM`

## 3. backup 표준 절차
1. 현재 반복 상태 요약 작성
2. blocked / 리스크 / 미결정 항목 정리
3. 다음 우선순위 후보 정리
4. resume 시작 절차 정리
5. 필수 참조 문서 링크 정리
6. Git 상태와 GitHub tracking 상태 정리
7. snapshot 문서를 `doc/work`에 저장
8. `doc/context-log.md`와 `doc/next-actions.md`에 반영

## 4. resume 표준 절차
1. 최신 resume snapshot 문서 확인
2. `doc/next-actions.md` 확인
3. `doc/context-log.md` 확인
4. GitHub 인증 상태 확인
5. 현재 브랜치/issue/PR 상태 확인
6. 다음 작업 1개 선택
7. 조직 태그/작업 태그 복원
8. 구현 또는 다음 단계 진행

## 5. 필수 snapshot 항목
- 현재 상태 요약
- 이번 반복에서 완료한 일
- 현재 blocked 항목
- 다음 우선순위 후보
- resume 시작 절차
- 필수 참조 문서
- Git/GitHub 상태
- 사용자 의사결정 필요 항목

## 6. 파일 네이밍 규칙
- 형식:
  - `doc/work/repeato-resume-snapshot-YYYY-MM-DD-vN.md`
- 예시:
  - `doc/work/repeato-resume-snapshot-2026-03-08-v1.md`

## 7. Workflow Enablement Group 역할 분담

### Workflow Architect Agent
- backup/resume 절차 구조 유지
- 어떤 항목을 snapshot에 반드시 남길지 정의

### Process Librarian Agent
- snapshot 문서 품질 검수
- 최신 snapshot index 유지

### Automation Enabler Agent
- 추후 snapshot 생성 helper script 또는 template 자동화 준비
- Git/GitHub 상태 체크리스트 자동화 포인트 정의

## 8. 재사용 규칙
- 특정 작업용 snapshot은 이 workflow를 따른다.
- 새로운 snapshot이 생기면 이전 snapshot을 삭제하지 않고 히스토리로 유지한다.
- 가장 최신 snapshot만 `resume 기준`으로 명시한다.
- resume 시에는 snapshot만 보지 말고 `next-actions`와 `context-log`를 함께 읽는다.

## 9. 다음 추출 후보
1. resume snapshot template
2. backup checklist helper script
3. Git/GitHub readiness validator
