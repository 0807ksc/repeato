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
- 작업 주제: Insights 덱 전체 진행률과 오늘 남은 카드 구현
- 임시 컨텍스트:
  - GitHub 이슈 `#11 Insights 덱 전체 진행률과 오늘 남은 카드 추가` 생성 완료
  - 작업 브랜치 `feat/11-insights-deck-progress` 생성 완료
  - `Insights`에 `현재 학습 중인 덱` 카드 추가
  - 덱 전체 진행률과 오늘 남은 카드 수 노출 구현
  - `doc/work/repeato-insights-user-needs-review-2026-03-15-v1.md`와 `repeato-insights-tab-spec-v1.md` 연결 완료
  - `flutter analyze` 통과
  - `flutter test --coverage` 통과, line coverage 91.53%
- 검증 필요:
  - `덱 전체 진행률`을 현재 세션 경험 기준에서 장기 진행 기준으로 바꾸려면 어떤 저장 모델이 필요한지
  - 다음 반복을 약점 영역 요약과 CTA 고도화로 바로 이어갈지
- 메모:
  - 현재 구현의 덱 전체 진행률은 영속 학습 이력이 아니라 현재 세션 기준 경험 카드 수를 사용함
