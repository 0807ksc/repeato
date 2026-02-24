# Context Workflow (Reusable)

## Purpose
- Keep context capture, decision logging, carry-over, and pruning consistent across tasks.
- Keep this file product-agnostic so it can be reused in any repository.

## Files
- `doc/context-inbox.md`: temporary notes and unresolved questions
- `doc/context-log.md`: confirmed decisions with rationale
- `doc/next-actions.md`: prioritized unfinished work
- `doc/context-prune-rules.md`: pruning rules

## Standard Flow
1. Capture incoming request summary in inbox.
2. Select required agent set and record it in context-log.
3. Pre-review gate: PM + Architect check spec conflicts and service intent fit.
4. Planning gate: Architect writes detailed execution plan.
5. Execute implementation with Engineer + Designer.
6. Post-review gate: PM + Architect verify implementation against plan.
7. QA gate: execute tests and approve.
8. Promote confirmed decisions to context-log.
9. Move unfinished work to next-actions with P1/P2/P3.
10. Prune inbox before ending the task.

## Exit Criteria
- At least one meaningful decision in context-log.
- Unfinished work prioritized in next-actions.
- Inbox contains only unresolved temporary notes.
