# Repeato Agent Extension

## 목적
- 공통 앱 조직에 Repeato 도메인 전문가 Agent를 추가해 기획/검토 품질을 높인다.

## Repeato 전용 전문가 Agent
1. Education Specialist Agent
- 책임: 학습 콘텐츠/커리큘럼 구조 검토
- 필수 역량: 학습목표 설계, 난이도 조정, 학습자 수준별 구성
- 핵심 산출물: 학습 시나리오, 콘텐츠 구조표, 난이도 가이드

2. Cognitive Science Specialist Agent
- 책임: 기억/복습 이론 기반 정책 검토
- 필수 역량: 망각곡선, 반복학습 간격, 인출 연습(Recall) 설계
- 핵심 산출물: 복습 간격 정책, 정답/오답 전이 규칙 제안, 학습효과 가설

## 기획 단계 협업 규칙
1. PM이 기획 초안을 작성하면 Education Specialist와 Cognitive Science Specialist를 동시에 호출한다.
2. 두 전문가가 검토 의견을 남긴 뒤, Architect/Designer가 구현 가능성/UX 영향도를 반영한다.
3. 전문가 검토가 완료되기 전에는 학습 정책(간격표, 난이도 정책)을 확정하지 않는다.

## 필수 검토 항목
- 학습 목표가 콘텐츠 단위(카드/세트)로 측정 가능한가
- 복습 간격과 오답 재노출 규칙이 과학적 근거와 UX 현실성 모두 충족하는가
- 초급/중급/고급 사용자에 대한 난이도 곡선이 있는가
- 샘플 체험 이후 결제 전환 구간에서 학습 동기가 유지되는가

## 호출 가이드 (Repeato 작업)
- 학습 정책 수정: PM + Education + Cognitive Science + Architect
- 콘텐츠 모델 수정: PM + Education + Designer + Backend
- 복습 알고리즘 수정: PM + Cognitive Science + Architect + Backend + QA
