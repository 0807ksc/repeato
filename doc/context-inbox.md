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
- 날짜: 2026-03-15
- 작업 주제: Insights 최근 변화와 다음 복습 시점 카드 구현
- 임시 컨텍스트:
  - GitHub 이슈 `#15 Insights 최근 변화와 다음 복습 시점 카드 추가` 생성 완료
  - 작업 브랜치 `feat/15-insights-trend-next-review` 생성 완료
  - `Insights`에 `최근 변화` 카드 추가
  - `Insights`에 `다음 복습 시점` 카드 추가
  - 현재 로컬 세션 기준 해석 문구와 예상 복습 문구를 노출
  - `flutter analyze` 통과
  - `flutter test --coverage` 통과, line coverage 92.03%
- 검증 필요:
  - 장기 이벤트 스키마 없이 최근 변화/다음 복습을 어디까지 추정치로 허용할지
  - 이후 `Insights` 차트형 확장을 언제 시작할지
- 메모:
  - 현재 최근 변화/다음 복습 시점은 장기 히스토리가 아니라 현재 세션 기준 해석 문구를 사용함
