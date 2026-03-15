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
- 작업 주제: 다중 덱 Today 상태를 Insights와 Add에 반영 3차
- 임시 컨텍스트:
  - GitHub 이슈 `#21 다중 덱 오늘 학습 상태를 Insights와 Add에 반영 3차` 생성 완료
  - 작업 브랜치 `feat/21-multi-deck-insights-add` 생성 완료
  - `Insights`에 `오늘 학습 덱 N개` 요약과 합산 기준 문구 추가
  - `Add`에 오늘 학습 덱 안내 카드와 선택 칩 추가
  - 다중 덱 시나리오 위젯 테스트 추가/보정
  - 현재 로컬 세션 기준 해석 문구와 예상 복습 문구를 노출
  - `flutter analyze` 통과
  - `flutter test --coverage` 통과, line coverage 92.14%
- 검증 필요:
  - 오늘 학습 덱 추천에서 최근 입력 히스토리까지 확장할지
  - 다중 덱 상태를 Profile에도 더 명시적으로 노출할지
- 메모:
  - 현재 Add는 오늘 학습 덱 선택 칩을 제공하지만 자동 추천 로직/영속 저장은 아직 없다
