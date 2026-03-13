# Context Inbox (임시)

## 사용 규칙
- 검증 전 메모만 기록한다.
- 항목은 짧게 작성한다.
- 확정되면 `doc/context-log.md`로 승격한다.

## Template
- 날짜:
- 작업 주제:
- 임시 컨텍스트:
  - 
- 검증 필요:
  - 
- 메모:
  - 

## Active
- 날짜: 2026-03-13
- 작업 주제: Insights KPI 대시보드 및 Today 재진입 CTA 구현
- 임시 컨텍스트:
  - GitHub 이슈 `#5 [Task] Enhance Insights dashboard and action CTA` 생성 완료
  - 작업 브랜치 `feat/5-insights-dashboard-cta` 생성 완료
  - Insights에 핵심 KPI 3개(오늘 완료율, 정답률, 오늘 상태)와 `약점 다시 학습` CTA를 추가
  - 탭 전환 시 Today 세션 상태가 유지되도록 `IndexedStack` 기반 앱 셸로 변경
  - `flutter analyze` 통과
  - `flutter test --coverage` 통과, line coverage 87.43%
- 검증 필요:
  - 다음 반복을 Profile 1차 설정/학습 환경 카드로 둘지, Today 2차 세션 제어 개선으로 둘지
  - Insights 후속 범위를 이벤트 스키마 전의 lightweight 추세 카드까지 허용할지
- 메모:
  - coverage 70% 기준은 이번 작업에서도 충족됨
