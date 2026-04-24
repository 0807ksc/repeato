---
name: repeato-delivery-tracking
description: Run Repeato development work through the required issue -> branch -> implementation -> PR -> QA -> merge flow. Use when Codex needs to start or advance a Repeato coding task, draft the 3-developer implementation review, generate branch names, prepare issue or PR text, or enforce the repository's coverage and QA gates.
---

# Repeato Delivery Tracking

## Workflow
1. Read `doc/work/repeato-github-tracking-workflow-v1.md` and `doc/work/repeato-delivery-organization-v1.md` if scope, tags, or roles are unclear.
2. Collect the minimum inputs: task title, goal, scope, non-scope, issue number, and any required tags.
3. Run `scripts/build_delivery_packet.py` to generate the branch name and reusable Markdown packet.
4. Paste the generated issue and PR sections into GitHub or the temporary tracking surface in use.
5. Record `GitHub issue pending` in `doc/context/context-log.md` if GitHub auth is blocked, but restore the issue before opening a PR.
6. Run tests and capture coverage before review.
7. Keep GitHub issue and PR as the canonical source for feature-level delivery tracking.

## Commands
- Build a delivery packet:
  - `python3 skills/repeato-delivery-tracking/scripts/build_delivery_packet.py --title "Add 2차 반복: 입력 히스토리와 최근 덱 제안" --issue-number 23 --slug add-second-iteration --tag "#STAGE-D" --tag "#TASK-TAB"`
- Write the packet to a file:
  - `python3 skills/repeato-delivery-tracking/scripts/build_delivery_packet.py --title "Profile 2차 반복" --issue-number 31 --output /tmp/profile-delivery.md`

## Guidance
- Prefer passing `--slug` when the title contains mostly non-ASCII text so the branch name is stable.
- Treat the generated packet as a starting point. Replace placeholders before posting.
- Keep the coverage threshold aligned with the repository baseline unless an approved exception exists.

## References
- Read `references/delivery-tracking-reference.md` for the required fields, gates, and blocked-auth fallback.
