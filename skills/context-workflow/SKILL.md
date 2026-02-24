---
name: context-workflow
description: Reusable context management workflow for any repo. Use when the user asks to set up or standardize request capture, decision logs, next-action queue, and pruning process as a skill or agent rule.
---

# Context Workflow Skill

## When to use
- User asks to standardize work context management.
- User asks to reuse the same workflow across multiple repositories.
- User asks to package workflow as a skill or agent policy.

## What this skill installs
- `doc/context-workflow.md` reusable process guide
- `doc/context-inbox.md` temporary context buffer
- `doc/context-log.md` decision log
- `doc/next-actions.md` prioritized queue
- `doc/context-prune-rules.md` pruning rules
- `doc/app-agent-organization.md` common app agent organization and collaboration protocol
- Optional project-specific workflow file: `doc/<project>-workflow.md`

## Execution steps
1. Create required document set using templates in `assets/templates/`.
2. Add agent integration block from `references/agent-integration.md` into repo `AGENTS.md`.
3. If the repo has a domain doc, separate project-specific flow into `doc/<project>-workflow.md`.
4. Start using the workflow immediately:
- Write request summary in inbox.
- Promote confirmed decisions into log.
- Carry unfinished items into next-actions with P1/P2/P3.
- Prune inbox before ending the turn.

## Fast path
- Run `scripts/init_context_workflow.sh <target_dir> <project_name>` to bootstrap docs and print the AGENTS snippet.

## Validation checklist
- `AGENTS.md` references both `doc/context-workflow.md` and `doc/<project>-workflow.md` (or equivalent project workflow).
- Inbox has only unresolved temporary notes after pruning.
- Decision log has at least one confirmed decision for this iteration.
- Next-actions keeps unfinished work with priority.

## References
- Agent integration snippet: `references/agent-integration.md`
- File content templates: `assets/templates/`
