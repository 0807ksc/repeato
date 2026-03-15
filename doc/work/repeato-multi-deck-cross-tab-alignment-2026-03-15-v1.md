# Repeato Multi-Deck Cross-Tab Alignment Review v1

- 날짜: 2026-03-15
- 범위: 하루 다중 덱 학습 3차 반복
- 태그: `#STAGE-B` `#TASK-TAB` `#TASK-APP` `#ORG-PM` `#ORG-DESIGN` `#ORG-FE` `#ORG-QA` `#ORG-EDU`

## Round 1
- User Representative: 다중 덱이 Today에만 보이면 맥락이 끊긴다. `Insights`와 `Add`에서도 현재 오늘 학습 덱을 보여야 한다.
- PM: 이번 반복은 다중 덱 상태의 교차 탭 일관성 확보에 집중한다.
- Product Designer: 덱 이름 전체 나열보다 `오늘 학습 덱 N개` 요약과 빠른 선택 칩이 읽기 쉽다.
- App Developer: `AppRoot`에서 이미 상태를 관리하므로 props 확장으로 해결 가능하다.
- Learning Specialist: 새 카드 입력도 현재 학습 중인 덱과 연결돼야 학습 연속성이 생긴다.
- QA Engineer: 다중 덱 선택 후 `Insights`와 `Add`가 함께 바뀌는 경로를 검증해야 한다.

## Round 2
- PM: `Insights`는 합산 기준임을 명시해야 오해가 없다.
- UX Developer: `Add`는 자유 입력을 유지하되 현재 오늘 학습 덱을 빠르게 선택할 수 있어야 한다.
- App Developer: 기본 덱 입력값은 현재 오늘 학습 덱 첫 항목으로 유지하고, 칩 선택으로 즉시 전환한다.
- QA Engineer: `Add` 저장 이후 기존 저장 CTA 회귀를 같이 확인한다.

## Round 3
- PM: 범위를 `Insights` 다중 덱 요약 + `Add` 오늘 학습 덱 추천으로 확정한다.
- Product Designer: 덱 수 요약, 대표 덱명, 합산 기준 안내 문구를 확정한다.
- Learning Specialist: 현재 학습 중인 덱으로 카드 추가를 유도하는 흐름을 승인한다.
- QA Engineer: 다중 덱 시나리오 위젯 테스트 추가와 coverage 70% 이상 유지 기준을 승인한다.

## Final Decisions
- `Insights`는 `오늘 학습 덱 N개`와 대표 덱명 요약을 노출한다.
- `Insights`의 진행률/남은 카드/통계는 선택된 Today 덱의 합산 기준으로 해석한다.
- `Add`는 오늘 학습 덱 요약 카드와 선택 칩을 제공한다.
- `Add` 기본 덱 입력값은 현재 오늘 학습 덱 첫 항목을 사용한다.
- 영속 저장소, 덱별 분리 통계, 자동 추천 로직은 이후 작업으로 보류한다.
