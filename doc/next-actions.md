# Next Actions

## Priority Queue
1. [ ] (P1) 카드 템플릿(영단어/한자/구구단) 필드 정의 확정
2. [ ] (P1) 망각곡선 초기 간격표 및 정답/오답 전이 규칙 확정
3. [ ] (P2) 대시보드 KPI 5개 및 오늘 완료 기준 확정

## Blocked
- 결제/동기화 서버 범위는 플랫폼 결정(iOS/Android/백엔드 방식) 후 확정 필요

## Done in This Iteration
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
