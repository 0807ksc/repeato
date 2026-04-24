# Repeato Delivery Organization v1

## 메타
- 버전: v1
- 작성일: 2026-03-08
- 상태: Active
- 목적: 작업 시작 전에 사용할 전문 조직, 단계별 책임, 태깅 규칙을 고정한다.

## 1. 조직도

### 1.1 Program Steering Group
- 태그: `#ORG-PM`, `#ORG-ARCH`
- 구성:
  - PM Agent
  - Technical Architect Agent
- 역할:
  - 작업 시작 승인
  - 범위/우선순위/blocked 판단
  - 조직 간 충돌 조정
  - 사용자 의사결정 요청 필요 여부 판단

### 1.2 Product Design Group
- 태그: `#ORG-DESIGN`, `#ORG-EDU`, `#ORG-COG`
- 구성:
  - Product Designer Agent
  - Education Specialist Agent
  - Cognitive Science Specialist Agent
- 역할:
  - 사용자 흐름/화면 구조/문구 설계
  - 학습 목표/난이도/반복 학습 정책 검토
  - 사용자 질문 설계 및 사용성 가설 정리

### 1.3 App Engineering Group
- 태그: `#ORG-FE`, `#ORG-ARCH`
- 구성:
  - Frontend Engineer Agent
  - Technical Architect Agent
- 역할:
  - Flutter 앱 구조 설계
  - 화면 구현
  - 로컬 상태/세션/탭 간 연동 구현
  - 테스트 추가와 라인 커버리지 70% 이상 유지

### 1.4 Data and Domain Group
- 태그: `#ORG-DATA`, `#ORG-ARCH`, `#ORG-BE`
- 구성:
  - Technical Architect Agent
  - Data Analyst Agent
  - Backend Engineer Agent
- 역할:
  - 도메인 모델 정의
  - 이벤트 스키마/KPI 정의
  - SQLite/동기화 데이터 구조 설계
  - 서버리스/서버 필요성 검토

### 1.5 Trust and Operations Group
- 태그: `#ORG-SEC`, `#ORG-SRE`, `#ORG-BE`
- 구성:
  - Security/Privacy Agent
  - DevOps/SRE Agent
  - Backend Engineer Agent
- 역할:
  - 개인정보/보안 기준 검토
  - 동기화/백업/복구/배포 운영 리스크 점검
  - 서버리스 운영 가능성 검토

### 1.6 Quality Assurance Group
- 태그: `#ORG-QA`
- 구성:
  - QA Engineer Agent
- 역할:
  - 테스트 시나리오 설계
  - 회귀 테스트/시뮬레이션/릴리즈 게이트 운영
  - 단계별 승인/반려 판단
  - 커버리지 70% 유지 여부와 예외 기록 확인

### 1.7 Workflow Enablement Group
- 태그: `#ORG-WF-ARCH`, `#ORG-WF-LIB`, `#ORG-WF-AUTO`
- 구성:
  - Workflow Architect Agent
  - Process Librarian Agent
  - Automation Enabler Agent
- 역할:
  - 작업/조직 관리 절차를 제품 기능 문서와 분리
  - skill/plugin 추출 후보 정리
  - GitHub/템플릿/자동화 절차 표준화

## 2. 단계별 기본 조직 매핑

### Stage A. 사전 검토
- 태그: `#STAGE-A`
- 담당 조직:
  - `#ORG-PM`
- 목적:
  - 요청 범위 해석
  - 기존 문서 충돌 검토
  - 완료 조건 설정

### Stage B. 기획 상세화
- 태그: `#STAGE-B`
- 담당 조직:
  - `#ORG-PM`
  - `#ORG-DESIGN`
- 목적:
  - 탭/기능 UX 상세화
  - 사용자 질문 도출
  - 전문가 검토 반영

### Stage C. 기술 설계
- 태그: `#STAGE-C`
- 담당 조직:
  - `#ORG-ARCH`
  - `#ORG-DATA`
  - 조건부 `#ORG-BE`
- 목적:
  - 도메인/상태/SQLite/동기화/이벤트 설계
  - 구현 경계와 blocked 조건 정의

### Stage D. 앱 구현
- 태그: `#STAGE-D`
- 담당 조직:
  - `#ORG-FE`
  - `#ORG-ARCH`
  - `#ORG-WF-AUTO`
  - 필요시 `#ORG-DESIGN`
- 목적:
  - Flutter 구현
  - 로컬 저장 반영
  - 탭 간 실제 연결 구현
  - 테스트 추가 및 커버리지 70% 이상 유지

### Stage E. 신뢰/운영 검토
- 태그: `#STAGE-E`
- 담당 조직:
  - `#ORG-SEC`
  - `#ORG-SRE`
  - 필요시 `#ORG-BE`
- 목적:
  - 개인정보/동기화/배포 위험 검토
  - 서버리스 적합성 점검

### Stage F. QA 검증
- 태그: `#STAGE-F`
- 담당 조직:
  - `#ORG-QA`
  - 필요시 `#ORG-PM`, `#ORG-FE`
- 목적:
  - 테스트 시나리오 실행
  - 자동 테스트/시뮬레이션 수행
  - 승인/반려
  - 커버리지 기준 충족 여부 확인

### Stage G. 출시 준비
- 태그: `#STAGE-G`
- 담당 조직:
  - `#ORG-PM`
  - `#ORG-QA`
  - `#ORG-SRE`
  - `#ORG-SEC`
  - `#ORG-WF-LIB`
- 목적:
  - 오픈 체크리스트 점검
  - 운영 리스크/릴리즈 판정

## 3. 작업 타입별 전문 조직

### 3.1 탭 기획 작업
- 태그:
  - `#TASK-TAB`
  - `#ORG-PM`
  - `#ORG-DESIGN`
  - `#ORG-QA`
- 예시:
  - Today/Decks/Add/Insights/Profile 상세화

### 3.2 학습 정책 작업
- 태그:
  - `#TASK-LEARNING`
  - `#ORG-PM`
  - `#ORG-EDU`
  - `#ORG-COG`
  - `#ORG-ARCH`
- 예시:
  - 간격표
  - 오답 재노출
  - 완료 기준

### 3.3 앱 구조/로컬 저장 작업
- 태그:
  - `#TASK-APP`
  - `#TASK-DATA`
  - `#ORG-FE`
  - `#ORG-ARCH`
  - `#ORG-DATA`
- 예시:
  - SQLite
  - 상태 모델
  - 세션 복원

### 3.4 동기화/서버리스 검토 작업
- 태그:
  - `#TASK-SYNC`
  - `#TASK-SERVERLESS`
  - `#ORG-DATA`
  - `#ORG-SEC`
  - `#ORG-SRE`
  - 조건부 `#ORG-BE`
- 예시:
  - Google Drive 연동안
  - snapshot/oplog
  - 충돌 해결 정책

### 3.5 결제/권한 설계 작업
- 태그:
  - `#TASK-COMMERCE`
  - `#ORG-PM`
  - `#ORG-SEC`
  - 조건부 `#ORG-BE`
- 예시:
  - entitlement 모델
  - 체험 종료 정책
  - 서버 필요성 판단

### 3.6 QA 작업
- 태그:
  - `#TASK-QA`
  - `#ORG-QA`
  - 필요시 `#ORG-FE`
  - 필요시 `#ORG-PM`
- 예시:
  - 테스트 시나리오
  - widget test
  - 회귀 테스트

### 3.7 Workflow 분리 작업
- 태그:
  - `#TASK-WORKFLOW`
  - `#ORG-WF-ARCH`
  - `#ORG-WF-LIB`
  - `#ORG-WF-AUTO`
- 예시:
  - issue/branch/pr 절차 분리
  - 조직 리더 운영 규칙 분리
  - skill/plugin 후보 문서화
  - backup/resume workflow 분리

## 4. 태깅 규칙
- 모든 작업 항목은 최소 다음 3종 태그를 가진다.
  - 단계 태그 1개
  - 작업 타입 태그 1개
  - 담당 조직 태그 1개 이상
- 예시:
  - `#STAGE-B #TASK-TAB #ORG-PM #ORG-DESIGN #ORG-QA`
  - `#STAGE-C #TASK-DATA #ORG-ARCH #ORG-DATA`
  - `#STAGE-F #TASK-QA #ORG-QA #ORG-FE`

## 4.1 자동 배정 규칙
- 사용자가 태그나 담당 조직을 직접 선택하지 않아도 된다.
- 요구사항이 대화로 정리되면 에이전트가 아래 기준으로 단계/작업/조직을 자동 배정한다.

### 자동 배정 순서
1. 요청이 기능 구현, 정책 변경, 데이터 구조, 동기화/결제, workflow 변경 중 어디에 가까운지 판단한다.
2. 그 요청에 맞는 기본 `Stage`와 `Task`를 고른다.
3. 필수 조직을 붙이고, 서버 의존성/보안 민감성/학습 정책 여부에 따라 조건부 조직을 추가한다.

### 기본 매핑
- 화면/탭/UX/문구/플로우 요청:
  - Stage: `#STAGE-B` 또는 `#STAGE-D`
  - Task: `#TASK-TAB`
  - Org: `#ORG-PM`, `#ORG-DESIGN`, 개발이면 `#ORG-FE`, 항상 `#ORG-QA`
- 학습 정책/간격표/오답 규칙/난이도 요청:
  - Stage: `#STAGE-B`
  - Task: `#TASK-LEARNING`
  - Org: `#ORG-PM`, `#ORG-EDU`, `#ORG-COG`, `#ORG-ARCH`
- SQLite/상태 모델/앱 구조/세션 복원 요청:
  - Stage: `#STAGE-C`
  - Task: `#TASK-APP`, 필요시 `#TASK-DATA`
  - Org: `#ORG-ARCH`, `#ORG-FE`, `#ORG-DATA`
- 동기화/가져오기/결제/서버 연동 요청:
  - Stage: `#STAGE-C` 또는 `#STAGE-E`
  - Task: `#TASK-SYNC`, `#TASK-SERVERLESS`, `#TASK-COMMERCE`
  - Org: `#ORG-DATA`, `#ORG-SEC`, `#ORG-SRE`, 필요시 `#ORG-BE`
- 테스트/회귀/품질 점검 요청:
  - Stage: `#STAGE-F`
  - Task: `#TASK-QA`
  - Org: `#ORG-QA`, 필요시 `#ORG-FE`, `#ORG-PM`
- workflow/템플릿/자동화 요청:
  - Stage: `#STAGE-C`
  - Task: `#TASK-WORKFLOW`
  - Org: `#ORG-WF-ARCH`, `#ORG-WF-LIB`, `#ORG-WF-AUTO`

### 조건부 추가 규칙
- 서버 API, 인증, 외부 저장소, 결제 검증이 나오면 `#ORG-BE` 추가
- 개인정보, 권한, 데이터 외부 반출이 나오면 `#ORG-SEC` 추가
- 학습 효과, 간격, 난이도, 회상 규칙이 나오면 `#ORG-EDU`, `#ORG-COG` 추가
- 병렬 탭 작업이면 `#ORG-PM`을 오케스트레이터로 유지

## 5. 현재 활성 조직 배치

### 5.1 현재 기준 오너십
- 탭 기획/충돌 조정:
  - `#ORG-PM`
  - `#ORG-DESIGN`
- 앱 구조/SQLite:
  - `#ORG-FE`
  - `#ORG-ARCH`
  - `#ORG-DATA`
- 서버리스 검토:
  - `#ORG-DATA`
  - `#ORG-SEC`
  - `#ORG-SRE`
- QA:
  - `#ORG-QA`
- workflow 분리:
  - `#ORG-WF-ARCH`
  - `#ORG-WF-LIB`
  - `#ORG-WF-AUTO`

### 5.2 현재 작업 태그 매핑
1. 탭 간 충돌 조정
- 태그: `#STAGE-B #TASK-TAB #ORG-PM #ORG-DESIGN #ORG-ARCH`

2. QA 마스터 시나리오
- 태그: `#STAGE-F #TASK-QA #ORG-QA #ORG-PM #ORG-FE`

3. SQLite/도메인/동기화 설계
- 태그: `#STAGE-C #TASK-DATA #TASK-SYNC #TASK-SERVERLESS #ORG-ARCH #ORG-DATA #ORG-SEC`

4. 서비스 오픈 계획
- 태그: `#STAGE-G #TASK-TAB #ORG-PM #ORG-QA #ORG-SRE`

5. workflow 분리/추출
- 태그: `#STAGE-C #TASK-WORKFLOW #ORG-WF-ARCH #ORG-WF-LIB #ORG-WF-AUTO`

## 6. PM 운영 규칙
- PM은 모든 작업 시작 전에 담당 조직 태그를 먼저 부여한다.
- 선행작업이 필요한 항목은 `blocked`로 두고, unblock 조건에도 동일 태그를 남긴다.
- `#TASK-SERVERLESS`, `#TASK-COMMERCE`는 PM 1차 판단을 거친다.
- PM이 서버 필요성을 판단했으나 확신이 없으면 사용자에게 의사결정을 요청한다.
- 모든 조직은 작업 중 발견한 운영 절차/조직 관리 내용을 Workflow Enablement Group에 넘겨 분리 여부를 판단한다.
