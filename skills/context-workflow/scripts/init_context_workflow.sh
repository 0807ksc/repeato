#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="${1:-.}"
PROJECT_NAME="${2:-project}"
DOC_DIR="${TARGET_DIR%/}/doc"
REFERENCE_DIR="$DOC_DIR/reference"
CONTEXT_DIR="$DOC_DIR/context"
AGENT_DIR="$DOC_DIR/agents"
TEMPLATE_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/../assets/templates" && pwd)"

mkdir -p "$DOC_DIR" "$REFERENCE_DIR" "$CONTEXT_DIR" "$AGENT_DIR"

cp "$TEMPLATE_DIR/context-workflow.md" "$REFERENCE_DIR/context-workflow.md"
cp "$TEMPLATE_DIR/context-inbox.md" "$CONTEXT_DIR/context-inbox.md"
cp "$TEMPLATE_DIR/context-log.md" "$CONTEXT_DIR/context-log.md"
cp "$TEMPLATE_DIR/next-actions.md" "$CONTEXT_DIR/next-actions.md"
cp "$TEMPLATE_DIR/context-prune-rules.md" "$CONTEXT_DIR/context-prune-rules.md"
cp "$TEMPLATE_DIR/app-agent-organization.md" "$AGENT_DIR/app-agent-organization.md"
cp "$TEMPLATE_DIR/project-workflow.md" "$REFERENCE_DIR/${PROJECT_NAME}-workflow.md"

sed -i.bak "s/__PROJECT_NAME__/${PROJECT_NAME}/g" "$REFERENCE_DIR/${PROJECT_NAME}-workflow.md"
rm -f "$REFERENCE_DIR/${PROJECT_NAME}-workflow.md.bak"

cat <<MSG
[완료] context-workflow 문서를 다음 경로에 설치했습니다: $DOC_DIR

AGENTS.md에는 아래 블록을 추가하세요:
- 프로젝트 워크플로우: doc/reference/${PROJECT_NAME}-workflow.md
- 표준 워크플로우: doc/reference/context-workflow.md
- 임시 컨텍스트: doc/context/context-inbox.md
- 결정 로그: doc/context/context-log.md
- 다음 작업 큐: doc/context/next-actions.md
- 정리 규칙: doc/context/context-prune-rules.md
- 앱 에이전트 조직: doc/agents/app-agent-organization.md
MSG
