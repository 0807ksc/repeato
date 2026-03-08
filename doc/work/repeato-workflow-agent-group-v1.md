# Repeato Workflow Agent Group v1

## 메타
- 버전: v1
- 작성일: 2026-03-08
- 상태: Active
- 목적: 제품 기능과 별도로 workflow 분리/추출을 담당하는 Agent 그룹을 정의한다.

## 1. 그룹명
- Workflow Enablement Group

## 2. 구성 Agent
1. Workflow Architect Agent
- 태그: `#ORG-WF-ARCH`
- 역할:
  - 반복 가능한 workflow 구조 설계
  - skill/plugin 추출 포인트 정의

2. Process Librarian Agent
- 태그: `#ORG-WF-LIB`
- 역할:
  - 규칙/템플릿/체크리스트 문서화
  - 공통 workflow 문서 정리

3. Automation Enabler Agent
- 태그: `#ORG-WF-AUTO`
- 역할:
  - GitHub/스크립트/자동화 템플릿 정의
  - plugin/skill 전환을 위한 인터페이스 정리
  - backup/resume helper 자동화 포인트 정리

## 3. 모든 조직에 대한 배정 방식
- PM 조직: workflow 추출 산출물의 총괄 오너
- Design 조직: 사용자 피드백/설명 템플릿 분리 지원
- Engineering 조직: 이슈/브랜치/PR helper 절차 분리 지원
- Data/Domain 조직: 상태판/지표/동기화 운영 규칙 분리 지원
- Trust/Ops 조직: 배포/운영/보안 workflow 분리 지원
- QA 조직: 테스트/승인/회귀 workflow 분리 지원
- 전 조직 공통: backup/resume snapshot 표준화 지원

## 4. 사용 규칙
- 각 조직 작업 중 제품 기능이 아닌 운영 절차가 발견되면 Workflow Enablement Group이 분리 후보로 올린다.
- 분리된 내용은 기능 문서가 아니라 workflow 문서에 기록한다.
- skill/plugin 후보는 `repeato-workflow-extraction-v1.md`에 누적한다.
- backup/resume 절차는 `repeato-backup-resume-workflow-v1.md`와 snapshot template로 재사용 관리한다.
