# __PROJECT_NAME__ Workflow

## Purpose
- Keep __PROJECT_NAME__-specific domain decisions separate from reusable context workflow.

## Source Documents
- Product/Domain context: `doc/project-context.md`
- Detailed requirements: `doc/plan-checklist.md`
- Reusable context operations: `doc/context-workflow.md`

## Project-Specific Flow
1. Check task fit against project domain scope.
2. Resolve requirement details from project requirement docs.
3. Apply code/document changes within requested scope only.
4. If implementation conflicts with project context, record change proposal instead of forced decision.
5. Verify output remains inside project boundaries.

## Usage
- Use this file for domain decisions.
- Use `doc/context-workflow.md` for capture/log/carry-over/pruning mechanics.
