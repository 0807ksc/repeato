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
- 작업 주제: Insights 약점 영역 요약과 덱 확인 CTA 구현
- 임시 컨텍스트:
  - GitHub 이슈 `#13 Insights 약점 영역 요약과 덱 확인 CTA 추가` 생성 완료
  - 작업 브랜치 `feat/13-insights-weak-summary` 생성 완료
  - `Insights`에 `약점 영역 요약` 카드 추가
  - `약점 다시 학습`과 `덱 확인하기` CTA를 함께 노출
  - `덱 확인하기` CTA가 `Decks` 탭으로 이동하도록 연결
  - `flutter analyze` 통과
  - `flutter test --coverage` 통과, line coverage 91.65%
- 검증 필요:
  - 약점 영역을 카드/태그/주제 기준으로 세분화하려면 어떤 데이터가 필요한지
  - 다음 반복에서 최근 변화와 다음 복습 시점을 어떤 문구로 보여줄지
- 메모:
  - 현재 약점 영역 요약은 응답 집계(`헷갈림`, `모르겠음`) 기준 해석 문구를 사용함
