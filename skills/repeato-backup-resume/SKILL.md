---
name: repeato-backup-resume
description: Capture and restore Repeato session state with resume snapshots, context files, and git or GitHub status. Use when Codex needs to pause work, hand off between sessions, create a snapshot in `doc/work`, or resume from the latest snapshot without losing branch, issue, or QA context.
---

# Repeato Backup Resume

## Workflow
1. Read `doc/work/repeato-backup-resume-workflow-v1.md` if the snapshot fields or resume order are unclear.
2. Run `scripts/build_resume_snapshot.py snapshot ...` to draft a snapshot with the current branch and git status.
3. Review the generated snapshot and replace any placeholders before saving it under `doc/work/`.
4. Reflect the resulting decisions in `doc/context/context-log.md` and unfinished work in `doc/context/next-actions.md`.
5. Run `scripts/build_resume_snapshot.py resume` to print the resume checklist from the latest or selected snapshot.
6. Use the resume checklist together with `doc/context/context-log.md` and `doc/context/next-actions.md`, not the snapshot alone.

## Commands
- Print a snapshot draft:
  - `python3 skills/repeato-backup-resume/scripts/build_resume_snapshot.py snapshot --summary "Profile 2차 반복 진행 중" --completed "Today 연결 카드 반영" --blocked "결제 범위 미확정" --next "Profile 목표 카드 수 상태 연결"`
- Write a snapshot file:
  - `python3 skills/repeato-backup-resume/scripts/build_resume_snapshot.py snapshot --summary "Add 2차 반복 마감" --completed "히스토리 UI 반영" --next "PR 생성" --output doc/work/repeato-resume-snapshot-2026-04-19-v1.md`
- Print the latest resume checklist:
  - `python3 skills/repeato-backup-resume/scripts/build_resume_snapshot.py resume`

## Guidance
- Keep the snapshot concise. It is a restart surface, not a full changelog.
- Include at least one next action and one resume step so the next session has a clear entry point.
- Prefer saving snapshots to `doc/work/` and keeping the context files as the mutable working set.

## References
- Read `references/backup-resume-reference.md` for the required fields and the recommended decision order.
