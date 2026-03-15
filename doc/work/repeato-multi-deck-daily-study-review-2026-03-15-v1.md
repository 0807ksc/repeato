# Repeato Multi-Deck Daily Study Review 2026-03-15 v1

## 메타
- 버전: v1
- 작성일: 2026-03-15
- 상태: Active
- 태그: `#STAGE-B #TASK-TAB #TASK-LEARNING #ORG-PM #ORG-DESIGN #ORG-FE #ORG-QA #ORG-EDU`
- 목적: 하루 학습은 여러 덱을 함께 할 수 있다는 관점으로 `Today`와 `Decks` 역할을 재정의한다.

## 참여 팀
- User Representative
- PM
- Product Designer
- UX Developer
- App Developer
- Learning Specialist
- QA Engineer
- Workflow Enablement Group

## 핵심 사용자 문장
- 오늘은 영어만 하지 않고 `중2 초급 영어 + 천자문`을 같이 조금씩 하고 싶다.
- 오늘 학습에 넣을 덱을 내가 직접 고르고, 바로 시작하고 싶다.
- 너무 많은 덱이 한꺼번에 들어오면 부담스럽기 때문에 현재 무엇이 포함됐는지도 보고 싶다.

## 1차 논의
- 합의:
  - 하루 학습은 단일 덱이 아니라 `오늘 학습 큐` 개념으로 봐야 한다.
  - `Decks`는 덱 정리 화면이면서 동시에 `오늘 학습 큐 편성`의 진입점이 된다.
- 금지:
  - 관리자형 복잡한 편집 UI
  - 덱을 무한정 켜도록 유도하는 과밀한 화면

## 2차 논의
- 합의:
  - 상태는 `선택된 덱` 하나가 아니라 `오늘 학습에 포함된 덱들`로 관리한다.
  - `Today` 상단에는 현재 포함된 덱 이름 요약이 보여야 한다.
  - 기본 권장치는 2~3개 덱이며, 이후 가이드를 붙인다.
- UX 조정:
  - 목록에서 바로 포함/제외 토글 가능해야 한다.
  - 상세 화면 CTA는 `오늘 학습에 추가`와 `지금 바로 학습`으로 나눈다.

## 3차 논의
- 최종 결정:
  1. 앱 루트 상태는 `todayStudyDeckIds`를 사용한다.
  2. `Today`는 해당 덱들의 카드를 합친 큐를 사용한다.
  3. `Decks` 목록에서 덱의 Today 포함 여부를 즉시 조정할 수 있다.
  4. 현재 포함된 덱은 `Today`와 `Insights`에 함께 반영된다.
  5. 하루 학습 큐는 나중에 `추천`과 `자동 편성`으로 확장하되, 현재는 수동 선택이 우선이다.

## 구현 최소 단위
1. 다중 덱 선택 상태 도입
2. Today 다중 덱 큐 반영
3. Decks 토글 UI 추가
4. 선택 상태를 Insights/Add까지 일관되게 반영

## QA 포인트
1. 영어/천자문 2개 덱을 동시에 Today에 포함할 수 있는가
2. 한 덱만 해제하면 즉시 Today에서 빠지는가
3. Today/Insights가 현재 포함 덱 상태를 같은 기준으로 보는가
