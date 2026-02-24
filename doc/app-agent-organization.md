# App Agent Organization (Common)

## 목적
- 특정 도메인과 무관하게 앱 개발에 공통으로 적용할 수 있는 Agent 조직과 협업 방식을 정의한다.

## 조직 구조
1. Product Manager Agent
- 책임: 문제 정의, 우선순위, 일정/범위 관리
- 필수 역량: PRD 작성, KPI 설정, 의사결정 정리
- 핵심 산출물: PRD, 릴리즈 목표, 우선순위 백로그

2. Product Designer Agent
- 책임: 사용자 흐름, UX/UI 설계
- 필수 역량: 정보구조, 인터랙션 설계, 접근성 기준
- 핵심 산출물: 사용자 플로우, 와이어프레임, 화면 명세

3. Technical Architect Agent
- 책임: 기술 구조/표준 결정
- 필수 역량: 아키텍처 설계, API/데이터 모델링, 비기능 요구사항 정의
- 핵심 산출물: 아키텍처 문서, API 계약, 기술 리스크 목록

4. Frontend Engineer Agent
- 책임: 클라이언트 구현
- 필수 역량: 컴포넌트 설계, 상태 관리, 성능/접근성 대응
- 핵심 산출물: UI 코드, 화면 테스트, 사용자 오류 처리

5. Backend Engineer Agent
- 책임: 서버/도메인 로직 구현
- 필수 역량: API 구현, 데이터 무결성, 인증/권한, 관측성
- 핵심 산출물: 서버 코드, DB 스키마 변경, 운영 로그 이벤트

6. QA Engineer Agent
- 책임: 품질 검증과 릴리즈 게이트
- 필수 역량: 테스트 설계, 회귀 테스트, 결함 분석
- 핵심 산출물: 테스트 케이스, 테스트 리포트, 릴리즈 판정

7. DevOps/SRE Agent
- 책임: 빌드/배포/운영 안정성
- 필수 역량: CI/CD, 모니터링/알림, 장애 대응
- 핵심 산출물: 파이프라인, 런북, 운영 대시보드

8. Data Analyst Agent
- 책임: 제품 데이터 해석 및 실험 설계
- 필수 역량: 이벤트 설계, 퍼널/리텐션 분석, 실험 설계
- 핵심 산출물: 이벤트 스키마, 지표 대시보드, 인사이트 보고

9. Security/Privacy Agent
- 책임: 보안/개인정보 기준 점검
- 필수 역량: 위협 모델링, 취약점 점검, 정책 준수
- 핵심 산출물: 보안 체크리스트, 리스크 리포트, 완화 계획

## 협업 프로토콜 (작업 단위)
1. 프롬프트 접수 및 사전 검토 (필수)
- PM + Architect가 요청을 함께 검토한다.
- 검토 항목: 기존 스펙 충돌 여부, 서비스 취지 적합성, 범위/완료조건.
- 충돌/불일치가 있으면 구현 전에 변경 제안 또는 스펙 정정을 먼저 수행한다.

2. 설계 계획 수립 (필수)
- Architect가 구현 가능한 상세 작업 계획을 작성한다.
- 최소 포함: 작업 단계, 영향 범위, 리스크, 검증 방법, 담당 Agent.

3. 실행 Agent 확정
- 요청 성격에 맞춰 최소 3개, 일반적으로 4~6개 Agent를 선택한다.
- 기본 세트: PM + Architect + Engineer(Frontend/Backend) + Designer + QA

4. 구현 수행
- Engineer와 Designer가 설계 계획 기준으로 작업을 수행한다.
- 계획 외 변경이 생기면 PM + Architect 재검토 후 진행한다.

5. 사후 적합성 검토 (필수)
- 구현 후 PM + Architect가 결과물을 검토한다.
- 검토 기준: 기획 의도 충족, 설계 지침 준수, 변경 범위 일치.
- 불일치 시 구현 단계로 되돌려 수정한다.

6. QA 테스트 (필수)
- QA Agent가 테스트 케이스/회귀 테스트를 수행한다.
- QA 승인 전에는 완료로 처리하지 않는다.

7. 종료 승인
- PM이 최종 완료 판정을 내리고 다음 액션을 확정한다.

## 작업별 Agent 호출 규칙
- 문서 작업: PM, Designer, Architect 우선 호출
- 기능 구현: Architect + 해당 Engineer + QA 호출
- 배포/운영: DevOps + Backend + QA 호출
- 데이터 개선: Data + PM + Engineer 호출
- 보안 민감 작업: Security Agent 필수 포함

## 강제 게이트 요약
- Gate A (사전): `PM + Architect` 스펙 충돌/취지 적합성 검토
- Gate B (계획): `Architect` 상세 작업 계획 확정
- Gate C (사후): `PM + Architect` 구현 결과 적합성 검토
- Gate D (품질): `QA` 테스트 승인

## 최소 운영 조합 (소규모 팀)
- 3-Agent: PM/Designer(겸직), Fullstack Engineer, QA
- 5-Agent: PM, Designer, Architect, Engineer, QA
