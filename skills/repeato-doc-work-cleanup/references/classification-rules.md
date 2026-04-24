# Classification Rules

## Status Meanings
- `Active`: Keep in `doc/work/` because the file is still read directly in the repo workflow.
- `Archived`: Move to `doc/work/archive/` because the file is kept only for history.
- `Issue-managed`: Keep only if needed temporarily, but treat GitHub issue or PR as the canonical source.

## Decision Order
1. Check whether the file is directly referenced by `doc/reference/project-context.md`, `doc/context/next-actions.md`, `doc/reference/repeato-workflow.md`, or the main README.
2. If it is a reusable guide, workflow, architecture, or template, keep it `Active`.
3. If it is task-local, iteration-local, or feature-local and GitHub already holds the canonical state, mark it `Issue-managed`.
4. If it is historical and no longer part of the active reading path, mark it `Archived`.

## Update Checklist
- Update `doc/work/index.md`
- Leave a replacement path or GitHub issue link
- Move the file only after the index change is ready
- Keep the archive conservative when the status is uncertain
