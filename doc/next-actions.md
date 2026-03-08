# Next Actions

## Priority Queue
1. [ ] (P1) `#STAGE-D #TASK-TAB #TASK-APP #ORG-FE #ORG-ARCH #ORG-QA` Deck 상세 화면과 Today 연결 구현
2. [ ] (P1) `#STAGE-C #TASK-DATA #TASK-APP #ORG-ARCH #ORG-DATA #ORG-FE` Flutter 로컬 SQLite 저장 계층과 도메인 모델 설계안을 코드 구조로 내리기 (`doc/work/repeato-local-first-architecture-v1.md`)
3. [ ] (P1) `#STAGE-C #TASK-WORKFLOW #ORG-WF-ARCH #ORG-WF-LIB #ORG-WF-AUTO #ORG-PM` workflow 조직 세션 기준 문서 유지 및 coverage 70% 운영 규칙을 다음 개발 이슈/PR에 계속 적용
4. [ ] (P1) `#STAGE-B #TASK-LEARNING #TASK-TAB #ORG-PM #ORG-DESIGN #ORG-EDU #ORG-COG` 카드 템플릿/정답 판정/세션 규칙과 공통 상태 키 확정 (`doc/plan-checklist.md` + `doc/work/repeato-cross-tab-conflict-review-v1.md`)
5. [ ] (P1) `#STAGE-C #TASK-DATA #ORG-PM #ORG-DATA #ORG-ARCH` KPI/이벤트 스키마 확정 후 `Insights` 구현 착수 (`doc/work/repeato-insights-tab-spec-v1.md`)
6. [ ] (P2) `#STAGE-E #TASK-SYNC #TASK-SERVERLESS #ORG-DATA #ORG-SEC #ORG-SRE` 동기화/결제는 기획안 유지, Google Drive 기반 서버리스안 상세 검토만 진행
7. [ ] (P2) `#STAGE-B #TASK-TAB #ORG-PM #ORG-DESIGN #ORG-QA` 각 탭 사용자 확인 질문을 인터뷰 스크립트로 전환하고 실제 피드백 수집

## Blocked
- 결제/동기화 서버 범위는 플랫폼 결정(iOS/Android/백엔드 방식) 후 확정 필요
- Flutter line coverage 측정/기록 방식은 다음 개발 이슈에서 실제 명령과 보고 포맷을 고정할 필요가 있음

## Done in This Iteration
- Add 직접 입력 MVP 이슈 생성(`#1`) 및 브랜치 생성(`feat/1-add-direct-input-mvp`)
- Add 직접 입력 폼 구현(앞면/뒷면/덱)
- 저장 후 CTA 구현(`계속 추가`, `Today로 이동`)
- AppRoot 메모리 카드 상태 관리 및 Decks 반영 연결
- `flutter analyze` 통과
- `flutter test --coverage` 통과
- 라인 커버리지 `84.31%` 확인
- GitHub 이슈/브랜치/PR/머지 강제 절차 문서 추가(`doc/work/repeato-github-tracking-workflow-v1.md`)
- workflow 분리 산출물 문서 추가(`doc/work/repeato-workflow-extraction-v1.md`, `doc/work/repeato-org-leader-workflow-v1.md`, `doc/work/repeato-workflow-agent-group-v1.md`)
- GitHub issue template / PR template 추가(`.github/ISSUE_TEMPLATE/feature-task.yml`, `.github/PULL_REQUEST_TEMPLATE.md`)
- Iteration 1 앱 구조 분리 및 Today 3단계 평가 UI 반영
- 사용자 그룹 구성 문서 추가(`doc/work/repeato-user-feedback-groups-v1.md`)
- Iteration 1 반복 루프 결과 문서 추가(`doc/work/repeato-iteration-001-loop-v1.md`)
- 작업 시작 전 조직도/단계별 책임/태깅 규칙 문서 추가(`doc/work/repeato-delivery-organization-v1.md`)
- 탭 간 충돌 범위 검토 및 PM 조정안 문서 추가(`doc/work/repeato-cross-tab-conflict-review-v1.md`)
- 전체 QA 마스터 시나리오 및 테스트 시뮬레이션 문서 추가(`doc/work/repeato-qa-master-scenario-v1.md`)
- 앱 도메인/SQLite/다중 디바이스 동기화/서버리스 판단 문서 추가(`doc/work/repeato-local-first-architecture-v1.md`)
- 서비스 오픈까지의 PM 실행 계획 문서 추가(`doc/work/repeato-service-open-plan-v1.md`)
- `flutter test`, `flutter analyze` 실행 및 기준 통과 확인
- PM 오케스트레이션 기준 문서 추가(`doc/work/repeato-tab-orchestration-v1.md`)
- `Decks`, `Add`, `Insights`, `Profile` 탭 상세 문서 추가
- `AGENTS.md`와 `doc/app-agent-organization.md`에 병렬 탭 조율/조건부 Backend 참여 규칙 반영
- `doc/project-context.md`, `doc/work/index.md`, 메뉴 스펙 문서에 탭별 상세 참조 추가
- 저장소 상태 점검 완료(현재 상태/미완료 지점/다음 3개 작업 제안)
- 중2 초급 영어 초기버전 앱 구현(`app/lib/main.dart`) 완료
- PDF 기반 120단어 데이터셋 생성(`app/assets/data/m2_beginner_words.json`)
- 데이터 생성 스크립트 추가(`scripts/extract_pdf_text.swift`, `scripts/build_m2_beginner_dataset.py`)
- 품질 검증 완료(`flutter analyze`, `flutter test`)
- 구현 결과 문서 추가(`doc/work/repeato-m2-initial-build-v1.md`)
- 플랫폼 전략 비교 문서 추가(`doc/work/repeato-platform-strategy-v1.md`)
- Case 1(단일 앱 + 인앱콘텐츠) 권고안 확정 및 인덱스 반영
- 핵심 사용자 인터뷰 결과 문서 추가(`doc/work/repeato-user-interview-001.md`)
- 메뉴/화면 스펙에 인터뷰 반영(중2 시작, 7:3 비율, 여행 우선, 약한 리마인드)
- `doc/work/index.md`, `doc/project-context.md`에 인터뷰 문서 인덱스 연결
- Repeato 탭바 아이콘 v1 생성(SVG 5종 + manifest)
- 아이콘 시스템 문서 추가(`doc/work/repeato-tab-icon-system-v1.md`)
- Flutter 앱 적용 스크립트 추가(`scripts/install_repeato_tab_icons.sh`)
- Repeato 필수 메뉴/화면 상세 설계 문서 추가(`doc/work/repeato-menu-and-screen-spec-v1.md`)
- `doc/work/index.md`, `doc/project-context.md`에 메뉴 설계 문서 인덱스 연결
- Flutter 로컬 개발환경 스크립트 5종 추가(`scripts/*.sh`)
- `doc/work/flutter-local-dev-setup-v1.md` 작성 및 work index 연결
- `project-context` 인덱스에 Flutter 환경 가이드 참조 추가
- `doc/work` 보존 정책 도입 및 `doc/work/index.md` 추가
- Repeato 헌법 본문을 `doc/work/repeato-constitution-v1.md`로 분리
- `doc/project-context.md`를 상세 본문 중심에서 인덱스 허브로 전환
- `AGENTS.md`/`doc/context-workflow.md`에 `doc/work` 운영 규칙 반영
- Repeato 기획 1~6 항목을 전 Agent 회의체 3차 검토 결과로 확정
- `doc/project-context.md`에 Repeato 헌법(회의체/3차 검토/최종 결론) 추가
- `AGENTS.md`에 Repeato 헌법 운영 규칙(3차 회의체 의무) 추가
- 프롬프트 입력 후 강제 파이프라인 규칙 추가(사전검토 -> 설계계획 -> 구현 -> 사후검토 -> QA)
- `doc/app-agent-organization.md`에 필수 게이트 상세 절차 추가
- `AGENTS.md`와 `doc/context-workflow.md`에 강제 게이트 연결
- `skills/context-workflow` 템플릿에 동일 파이프라인 반영
- 프롬프트 기반 강제 협업 파이프라인 추가(사전검토/설계계획/사후검토/QA)
- `AGENTS.md`/`doc/app-agent-organization.md`/`doc/context-workflow.md` 파이프라인 동기화
- `skills/context-workflow` 템플릿에도 동일 강제 게이트 반영
- 공통 앱 Agent 조직 문서 추가(`doc/app-agent-organization.md`)
- Repeato 전용 전문가 Agent 확장 문서 추가(`doc/repeato-agent-extension.md`)
- 작업별 Agent 호출 규칙을 `AGENTS.md`/`doc/context-workflow.md`/`doc/repeato-workflow.md`에 연결
- `skills/context-workflow` 템플릿에 공통 Agent 조직 포함
- 요청 자동 분류 규칙 추가(`workflow 반영` vs `Repeato 반영`)
- `AGENTS.md`/`doc/context-workflow.md`/`doc/repeato-workflow.md` 분류 규칙 동기화
- `skills/context-workflow` 스킬 패키지 추가(SKILL/스크립트/템플릿/agent integration)
- `doc/context-workflow.md`에 skill/agent 재사용 섹션 추가
- Repeato 전용 작업 흐름 분리(`doc/repeato-workflow.md`)
- `doc/context-workflow.md`를 재사용 가능한 공통 표준으로 개편
- `AGENTS.md`에 Repeato 전용 흐름 참조 추가
- `doc/plan-checklist.md`를 project-context 기준으로 재정렬
- 컨텍스트 운영 문서 5종 추가(`workflow/inbox/log/next-actions/prune-rules`)
- `AGENTS.md`에 컨텍스트 관리 프로토콜 고정
