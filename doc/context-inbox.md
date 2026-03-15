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
- 작업 주제: Today 세션 제어와 리셋 흐름 개선
- 임시 컨텍스트:
  - GitHub 이슈 `#9 Today 세션 제어와 리셋 흐름 개선` 생성 완료
  - 작업 브랜치 `feat/9-today-session-controls` 생성 완료
  - Today 상단에 세션 제어 카드와 명시적 `현재 세션 다시 시작` CTA를 추가
  - 목표 변경(`빠른 30카드`, `집중 60카드`) 흐름을 세션 제어 카드 안에서 명확화
  - `flutter analyze` 통과
  - `flutter test --coverage` 통과, line coverage 90.65%
- 검증 필요:
  - 다음 반복을 Add 2차 또는 Decks 2차 중 어디로 둘지
  - Today 3차에서 약점 카드 재도전 큐를 실제로 둘지
- 메모:
  - coverage 70% 기준은 이번 작업에서도 충족됨
