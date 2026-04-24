---
name: repeato-workflow
description: Repeato 저장소 전용 workflow skill이다. Repeato 기능, 정책, 문서, 개발 작업을 수행할 때 대화형 요구사항 수집, 문서 우선순위, GitHub 추적 절차, 에이전트 자동 배정을 적용해야 하면 사용한다.
---

# Repeato Workflow Skill

## 사용 시점
- Repeato 기능/정책/문서 작업을 시작할 때
- Repeato 개발 작업에서 문서 읽는 순서와 GitHub 추적 절차를 빠르게 적용해야 할 때
- Repeato workflow에서 사용자와의 대화 후 자동 배정 규칙까지 적용해야 할 때

## 핵심 절차
1. 먼저 사용자와의 대화로 요구사항을 정리한다.
2. 전체 흐름은 `README.md`로 빠르게 파악한다.
3. Repeato 전용 기준은 `doc/reference/repeato-workflow.md`에서 확인한다.
4. 공통 컨텍스트 절차는 `doc/reference/context-workflow.md`를 따른다.
5. 개발 작업이면 `doc/work/repeato-delivery-organization-v1.md`와 `doc/work/repeato-github-tracking-workflow-v1.md`를 함께 읽는다.
6. 탭 병렬 작업이면 `doc/work/repeato-tab-orchestration-v1.md`를 추가로 읽는다.
7. 학습 정책 작업이면 `doc/agents/repeato-agent-extension.md`를 추가로 읽는다.

## 경계 규칙
- 권위 있는 결정과 버전 문서는 `doc/reference/repeato-workflow.md`와 `doc/work/*`에 남긴다.
- 이 skill은 반복 실행을 돕는 얇은 지침이어야 하며, 산출물 저장소를 대체하지 않는다.
- 요구사항 정리 후 태그와 담당 조직은 문서 규칙으로 자동 배정한다.

## 참고 자료
- 공통 workflow: `skills/context-workflow/SKILL.md`
