# Agent Integration

Use this block in `AGENTS.md` to make the workflow reusable at agent level.

```md
## Context Management Protocol (Always Apply)
- Project workflow: `doc/<project>-workflow.md`
- Standard workflow: `doc/context-workflow.md`
- Temporary context: `doc/context-inbox.md`
- Decision log: `doc/context-log.md`
- Next-action queue: `doc/next-actions.md`
- Pruning rules: `doc/context-prune-rules.md`

Working rules:
- At task start, summarize the request in `doc/context-inbox.md`.
- Record meaningful decisions in `doc/context-log.md`.
- Move unfinished work into `doc/next-actions.md` with priority.
- Before ending task, prune inbox and keep only unresolved items.
```

Project-specific notes:
- Keep product/domain rules in `doc/<project>-workflow.md`.
- Keep `doc/context-workflow.md` product-agnostic so it can be copied to other repos.
