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
- 날짜: 2026-03-08
- 작업 주제: Deck 상세 화면과 Today 연결 구현
- 임시 컨텍스트:
  - GitHub 이슈 `#3 Connect Deck detail to Today` 생성 완료
  - 작업 브랜치 `feat/3-decks-today-link` 생성 완료
  - Deck 상세 화면 진입과 `학습 시작` CTA를 Today 탭 이동으로 연결
  - Add로 늘어난 카드 수가 Deck 상세 카드 수/직접 추가 카드 수에 반영됨
  - `flutter analyze` 통과
  - `flutter test --coverage` 통과, line coverage 85.59%
- 검증 필요:
  - Deck 상세에서 다음 복습/목표 외에 어떤 정보가 더 필요한지
  - 다음 작업을 SQLite 설계 코드화와 Deck 상태 모델 중 무엇으로 둘지
- 메모:
  - coverage 70% 기준은 현재 작업에서도 충족됨
