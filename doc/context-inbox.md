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
- 작업 주제: Add 직접 입력 MVP 구현 및 검증
- 임시 컨텍스트:
  - GitHub 이슈 `#1 Add direct input MVP` 생성 완료
  - 작업 브랜치 `feat/1-add-direct-input-mvp` 생성 완료
  - Add 탭은 직접 입력 폼, 저장 완료 CTA, Today 이동, Decks 반영까지 로컬 구현 완료
  - `flutter analyze` 통과
  - `flutter test --coverage` 통과, line coverage 84.31%
- 검증 필요:
  - PR 생성 전 커버리지 보고 형식을 PR 본문에 어떻게 고정할지
  - Deck 상세 화면과 Today 연결 구현을 다음 작업으로 바로 이어갈지
- 메모:
  - coverage 70% 기준은 현재 작업에서 충족됨
