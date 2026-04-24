#!/usr/bin/env python3
"""Generate a reusable Repeato delivery packet for issue/PR tracking."""

from __future__ import annotations

import argparse
import pathlib
import re
import sys
import unicodedata


def slugify(value: str) -> str:
    normalized = unicodedata.normalize("NFKD", value)
    ascii_value = normalized.encode("ascii", "ignore").decode("ascii")
    slug = re.sub(r"[^a-zA-Z0-9]+", "-", ascii_value).strip("-").lower()
    return slug or "task"


def render_packet(args: argparse.Namespace) -> str:
    slug = args.slug or slugify(args.title)
    issue_ref = str(args.issue_number) if args.issue_number is not None else "<issue-number>"
    branch_name = f"{args.branch_type}/{issue_ref}-{slug}"
    tags_line = " ".join(args.tag) if args.tag else "<#STAGE-* #TASK-* #ORG-*>"
    linked_issue = f"#${issue_ref}" if args.issue_number is not None else "#<issue-number>"

    return f"""# Delivery Packet

## Branch
`{branch_name}`

## Tags
`{tags_line}`

## Issue Title
`[Task] {args.title}`

## Issue Body
### Background
- 

### Goal
- 

### Scope
- 

### Out of Scope
- 

### 3-Developer Implementation Review
- Development Lead:
- Feature Engineer:
- Integration Engineer:

### Role Split
- Development Lead:
- Feature Engineer:
- Integration Engineer:

### QA Checkpoints
- 

### Test Coverage Plan
- Target line coverage: >= {args.coverage_target}%
- Planned tests:
- Risk to baseline:

### User Feedback Need
- 

## PR Body
### Linked Issue
- Closes {linked_issue}

### Summary
- 

### Review Plan
- Development Lead:
- Feature Engineer:
- Integration Engineer:

### Tests
- [ ] flutter test
- [ ] flutter analyze
- [ ] coverage >= {args.coverage_target}%
- [ ] manual QA

### Coverage
- Current line coverage:
- If below {args.coverage_target}%, reason:
- Follow-up plan / owner:

### User Impact
- 

### QA Focus
- 

### PM Decision Needed
- 

## Blocked Auth Fallback
- Record `GitHub issue pending` in `doc/context/context-log.md` if issue creation is blocked.
- Restore the GitHub issue before opening a PR.
"""


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--title", required=True, help="Task title without the [Task] prefix.")
    parser.add_argument("--issue-number", type=int, help="GitHub issue number.")
    parser.add_argument(
        "--branch-type",
        default="feat",
        choices=["feat", "fix", "docs", "chore", "refactor"],
        help="Branch prefix.",
    )
    parser.add_argument("--slug", help="ASCII branch slug. Recommended for non-ASCII titles.")
    parser.add_argument("--tag", action="append", default=[], help="Tag to include in the packet.")
    parser.add_argument(
        "--coverage-target",
        type=int,
        default=70,
        help="Target line coverage percentage.",
    )
    parser.add_argument("--output", help="Optional output markdown path.")
    args = parser.parse_args()

    packet = render_packet(args)
    if args.output:
        output_path = pathlib.Path(args.output)
        output_path.write_text(packet, encoding="utf-8")
    else:
        sys.stdout.write(packet)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
