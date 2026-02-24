#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="${1:-.}"
PROJECT_NAME="${2:-project}"
DOC_DIR="${TARGET_DIR%/}/doc"
TEMPLATE_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/../assets/templates" && pwd)"

mkdir -p "$DOC_DIR"

cp "$TEMPLATE_DIR/context-workflow.md" "$DOC_DIR/context-workflow.md"
cp "$TEMPLATE_DIR/context-inbox.md" "$DOC_DIR/context-inbox.md"
cp "$TEMPLATE_DIR/context-log.md" "$DOC_DIR/context-log.md"
cp "$TEMPLATE_DIR/next-actions.md" "$DOC_DIR/next-actions.md"
cp "$TEMPLATE_DIR/context-prune-rules.md" "$DOC_DIR/context-prune-rules.md"
cp "$TEMPLATE_DIR/app-agent-organization.md" "$DOC_DIR/app-agent-organization.md"
cp "$TEMPLATE_DIR/project-workflow.md" "$DOC_DIR/${PROJECT_NAME}-workflow.md"

sed -i.bak "s/__PROJECT_NAME__/${PROJECT_NAME}/g" "$DOC_DIR/${PROJECT_NAME}-workflow.md"
rm -f "$DOC_DIR/${PROJECT_NAME}-workflow.md.bak"

cat <<MSG
[done] context-workflow documents installed in: $DOC_DIR

Add this to AGENTS.md:
- Project workflow: doc/${PROJECT_NAME}-workflow.md
- Standard workflow: doc/context-workflow.md
- Temporary context: doc/context-inbox.md
- Decision log: doc/context-log.md
- Next-action queue: doc/next-actions.md
- Pruning rules: doc/context-prune-rules.md
- App agent organization: doc/app-agent-organization.md
MSG
