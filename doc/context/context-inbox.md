# Context Inbox (임시)

## 사용 규칙
- 검증 전 메모만 기록한다.
- 항목은 짧게 작성한다.
- 확정되면 `doc/context/context-log.md`로 승격한다.

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
- 날짜: 2026-04-04
- 작업 주제: 제품 기동/사용 테스트 기반 추가 요구사항 도출 skill 생성
- 임시 컨텍스트:
  - 사용자는 `skill-creator`를 사용해 현재 Repeato 제품을 직접 기동/사용해보고 추가 요구사항을 제안하는 사용자 skill을 원한다
  - 현재 실행 가이드는 `doc/work/flutter-local-dev-setup-v1.md`와 `app/README.md`에 분산돼 있다
  - `flutter --version` 확인 결과 Flutter `3.41.2`가 설치돼 있고, `flutter devices` 결과 `macOS`와 `Chrome` 타깃이 사용 가능하다
  - 프로젝트 전용 skill은 repo-local `skills/` 아래에 두는 것이 자연스럽다
- 검증 필요:
  - 제품 기동/사용 기준 가이드를 어느 `doc/work` 경로로 고정할지
  - 실제 GUI 기동과 자동 테스트를 어디까지 기본 절차로 강제할지
- 메모:
  - skill 내부에는 README를 두지 않고, 얇은 절차 + references 구조를 유지해야 한다

- 날짜: 2026-03-31
- 작업 주제: 이전 작업 루프 재가동 (`Add` 2차 반복)
- 임시 컨텍스트:
  - 이전 반복 구현 이슈 `#19`, `#21`은 열려 있으나 PR은 없는 상태였다
  - 새 이슈 `#23 [Task] Add 2차 반복: 입력 히스토리와 최근 덱 제안` 생성 완료
  - 작업 브랜치 `feat/23-add-second-iteration` 생성 완료
  - `Add`에 최근 사용 덱 칩과 최근 입력 재사용 UI를 추가했다
  - 저장 후 마지막 선택 덱 유지 흐름을 고정했다
  - `flutter analyze` 통과
  - `flutter test --coverage` 통과, line coverage 92.22%
- 검증 필요:
  - 최근 덱 제안의 원천을 메모리 상태로만 둘지, SQLite 전 임시 세션 기록까지 둘지
  - PR 생성 전 커밋 메시지와 QA 인수인계 문구를 어떻게 고정할지
- 메모:
  - 구현 결과는 GitHub 이슈 `#23` 댓글로도 기록했다

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
