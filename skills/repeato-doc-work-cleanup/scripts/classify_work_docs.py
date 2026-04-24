#!/usr/bin/env python3
"""Suggest status labels for doc/work files."""

from __future__ import annotations

import argparse
import json
import pathlib
import re
import sys


REFERENCE_SOURCES = [
    "README.md",
    "doc/reference/project-context.md",
    "doc/reference/repeato-workflow.md",
    "doc/context/next-actions.md",
    "doc/context/context-log.md",
    "doc/work/index.md",
]

ACTIVE_KEYWORDS = {
    "workflow",
    "guide",
    "architecture",
    "strategy",
    "constitution",
    "scenario",
    "template",
    "organization",
    "orchestration",
    "icon-system",
    "user-interview",
}

ISSUE_MANAGED_KEYWORDS = {
    "spec",
    "review",
    "loop",
    "snapshot",
    "session",
    "alignment",
}


def load_text(path: pathlib.Path) -> str:
    return path.read_text(encoding="utf-8") if path.exists() else ""


def reference_flags(repo_root: pathlib.Path, rel_path: str) -> dict[str, bool]:
    flags: dict[str, bool] = {}
    for source in REFERENCE_SOURCES:
        flags[source] = rel_path in load_text(repo_root / source)
    return flags


def latest_snapshot_name(work_dir: pathlib.Path) -> str | None:
    snapshots = sorted(work_dir.glob("repeato-resume-snapshot-*.md"))
    return snapshots[-1].name if snapshots else None


def suggest_status(name: str, flags: dict[str, bool], latest_snapshot: str | None) -> tuple[str, str]:
    ref_count = sum(flags.values())
    lower_name = name.lower()

    if name == "index.md":
        return ("Active", "Index file for doc/work.")

    if name.startswith("repeato-resume-snapshot-") and latest_snapshot and name != latest_snapshot:
        return ("Archived", "Older resume snapshot; keep only for history.")

    if any(flags.get(source, False) for source in REFERENCE_SOURCES[:-1]):
        return ("Active", "Referenced by an active workflow or context document.")

    if any(keyword in lower_name for keyword in ACTIVE_KEYWORDS):
        return ("Active", "Reusable guide/workflow/reference pattern.")

    if any(keyword in lower_name for keyword in ISSUE_MANAGED_KEYWORDS):
        if ref_count <= 1:
            return ("Issue-managed", "Task-local or iteration-local document with low active references.")
        return ("Active", "Still referenced enough to stay in the active set.")

    if re.search(r"\d{4}-\d{2}-\d{2}", lower_name):
        return ("Issue-managed", "Date-scoped document; verify whether GitHub is the canonical source.")

    return ("Active", "No strong archive or issue-managed signal; keep active conservatively.")


def classify(repo_root: pathlib.Path) -> list[dict[str, object]]:
    work_dir = repo_root / "doc/work"
    latest_snapshot = latest_snapshot_name(work_dir)
    rows: list[dict[str, object]] = []

    for path in sorted(work_dir.glob("*.md")):
        rel_path = path.relative_to(repo_root).as_posix()
        flags = reference_flags(repo_root, rel_path)
        status, reason = suggest_status(path.name, flags, latest_snapshot)
        rows.append(
            {
                "path": rel_path,
                "status": status,
                "reference_count": sum(flags.values()),
                "reason": reason,
            }
        )

    for path in sorted((work_dir / "archive").glob("*.md")):
        rel_path = path.relative_to(repo_root).as_posix()
        rows.append(
            {
                "path": rel_path,
                "status": "Archived",
                "reference_count": 0,
                "reason": "Already stored under doc/work/archive/.",
            }
        )

    return rows


def render_table(rows: list[dict[str, object]]) -> str:
    path_width = max(len("PATH"), *(len(str(row["path"])) for row in rows))
    status_width = max(len("STATUS"), *(len(str(row["status"])) for row in rows))
    ref_width = max(len("REFS"), *(len(str(row["reference_count"])) for row in rows))
    lines = [
        f"{'PATH'.ljust(path_width)}  {'STATUS'.ljust(status_width)}  {'REFS'.ljust(ref_width)}  REASON",
        f"{'-' * path_width}  {'-' * status_width}  {'-' * ref_width}  {'-' * 40}",
    ]
    for row in rows:
        lines.append(
            f"{str(row['path']).ljust(path_width)}  "
            f"{str(row['status']).ljust(status_width)}  "
            f"{str(row['reference_count']).ljust(ref_width)}  "
            f"{row['reason']}"
        )
    return "\n".join(lines)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", default=".", help="Repository root.")
    parser.add_argument("--format", choices=["table", "json"], default="table")
    args = parser.parse_args()

    repo_root = pathlib.Path(args.repo_root).resolve()
    rows = classify(repo_root)
    if args.format == "json":
        json.dump(rows, sys.stdout, ensure_ascii=False, indent=2)
        sys.stdout.write("\n")
    else:
        print(render_table(rows))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
