---
name: repeato-doc-work-cleanup
description: Review `doc/work` and classify local work documents as Active, Archived, or Issue-managed under the repository's documentation policy. Use when Codex needs to reduce doc clutter, find archive candidates, map local docs to GitHub issues, or update `doc/work/index.md` and archive links consistently.
---

# Repeato Doc Work Cleanup

## Workflow
1. Read `doc/README.md`, `doc/work/index.md`, and `references/classification-rules.md` before moving files.
2. Run `scripts/classify_work_docs.py` to get a first-pass status suggestion for each `doc/work` document.
3. Treat the script output as a conservative suggestion, not a final decision.
4. Verify the canonical source before changing a file status.
5. Update `doc/work/index.md` and leave a GitHub issue or replacement-doc link before archiving or removing a file.
6. Move archived files to `doc/work/archive/` only after the index or replacement link is ready.

## Commands
- Print a table:
  - `python3 skills/repeato-doc-work-cleanup/scripts/classify_work_docs.py --repo-root .`
- Print JSON:
  - `python3 skills/repeato-doc-work-cleanup/scripts/classify_work_docs.py --repo-root . --format json`

## Guidance
- Prefer `Issue-managed` for task-local specs or reviews whose canonical state lives in GitHub.
- Prefer `Archived` only when the file is no longer part of the active local reading path.
- Keep `Active` for reusable guides, architecture, workflow, and long-lived reference docs.

## References
- Read `references/classification-rules.md` for the decision order and the exact meanings of the three statuses.
