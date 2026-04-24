#!/usr/bin/env python3
"""Build or inspect Repeato resume snapshot data."""

from __future__ import annotations

import argparse
import datetime as dt
import glob
import pathlib
import subprocess
import sys


REPO_ROOT = pathlib.Path(__file__).resolve().parents[3]


def run_command(args: list[str]) -> str:
    try:
        result = subprocess.run(
            args,
            cwd=REPO_ROOT,
            check=False,
            capture_output=True,
            text=True,
        )
    except FileNotFoundError:
        return "unavailable"
    output = (result.stdout or result.stderr).strip()
    return output or "clean"


def current_branch() -> str:
    return run_command(["git", "rev-parse", "--abbrev-ref", "HEAD"])


def current_git_status() -> str:
    return run_command(["git", "status", "--short"])


def gh_auth_status() -> str:
    return run_command(["gh", "auth", "status"])


def latest_snapshot() -> pathlib.Path | None:
    candidates = glob.glob(str(REPO_ROOT / "doc/work/repeato-resume-snapshot-*.md"))
    if not candidates:
        return None
    return pathlib.Path(sorted(candidates)[-1])


def build_snapshot(args: argparse.Namespace) -> str:
    completed = args.completed or ["<completed-item>"]
    blocked = args.blocked or ["<blocked-item>"]
    next_items = args.next or ["<next-action>"]
    resume_steps = args.resume_step or [
        "Read this snapshot.",
        "Read `doc/context/next-actions.md`.",
        "Read `doc/context/context-log.md`.",
    ]
    references = args.reference or [
        "`doc/context/next-actions.md`",
        "`doc/context/context-log.md`",
    ]
    decisions = args.decision or ["<decision-needed>"]

    def bullets(items: list[str]) -> str:
        return "\n".join(f"- {item}" for item in items)

    def numbered(items: list[str]) -> str:
        return "\n".join(f"{index}. {item}" for index, item in enumerate(items, start=1))

    git_status = current_git_status()
    status_block = git_status if git_status != "clean" else "clean"
    return f"""# Repeato Resume Snapshot

## 메타
- 작성일: {args.date}
- 목적: 현재 작업 컨텍스트를 백업하고, 다음 세션에서 동일한 흐름으로 resume 하기 위한 기준점

## 1. 현재 상태 요약
- {args.summary}

## 2. 이번 반복 완료 항목
{bullets(completed)}

## 3. 현재 blocked / 주의사항
{bullets(blocked)}

## 4. 다음 우선순위 후보
{numbered(next_items)}

## 5. resume 시작 절차
{numbered(resume_steps)}

## 6. resume 시 필수 참조 문서
{bullets(references)}

## 7. Git / GitHub 상태
- 현재 브랜치: `{current_branch()}`
- 연결 이슈: {args.issue}
- PR 상태: {args.pr_status}
- 인증 상태: {args.auth_status or gh_auth_status()}
- git status:

```text
{status_block}
```

## 8. 사용자 의사결정 필요 항목
{bullets(decisions)}

## 9. resume용 한 줄 프롬프트 예시
- {args.resume_prompt or "latest snapshot과 context 문서를 읽고 다음 1순위 작업부터 재개해줘"}
"""


def handle_snapshot(args: argparse.Namespace) -> int:
    content = build_snapshot(args)
    if args.output:
        output_path = pathlib.Path(args.output)
        if output_path.exists() and not args.force:
            raise SystemExit(f"Refusing to overwrite existing file: {output_path}")
        output_path.write_text(content, encoding="utf-8")
    else:
        sys.stdout.write(content)
    return 0


def handle_resume(args: argparse.Namespace) -> int:
    snapshot_path = pathlib.Path(args.snapshot) if args.snapshot else latest_snapshot()
    if snapshot_path is None:
        raise SystemExit("No resume snapshot found.")
    print("# Resume Checklist")
    print(f"- Snapshot: `{snapshot_path.relative_to(REPO_ROOT)}`")
    print("- Read: `doc/context/next-actions.md`")
    print("- Read: `doc/context/context-log.md`")
    print(f"- Current branch: `{current_branch()}`")
    print("- Current git status:")
    print("```text")
    print(current_git_status())
    print("```")
    print("- GitHub auth status:")
    print("```text")
    print(gh_auth_status())
    print("```")
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    subparsers = parser.add_subparsers(dest="command", required=True)

    snapshot_parser = subparsers.add_parser("snapshot", help="Build a resume snapshot draft.")
    snapshot_parser.add_argument("--summary", required=True, help="Current state summary.")
    snapshot_parser.add_argument("--completed", action="append", help="Completed item.")
    snapshot_parser.add_argument("--blocked", action="append", help="Blocked item or caution.")
    snapshot_parser.add_argument("--next", action="append", dest="next", help="Next action.")
    snapshot_parser.add_argument("--resume-step", action="append", help="Resume step.")
    snapshot_parser.add_argument("--reference", action="append", help="Reference doc.")
    snapshot_parser.add_argument("--decision", action="append", help="Decision still needed.")
    snapshot_parser.add_argument("--issue", default="<issue-or-pending>", help="Issue state.")
    snapshot_parser.add_argument("--pr-status", default="<pr-status>", help="PR status.")
    snapshot_parser.add_argument("--auth-status", default="", help="Auth status override.")
    snapshot_parser.add_argument("--resume-prompt", help="One-line resume prompt.")
    snapshot_parser.add_argument(
        "--date",
        default=dt.date.today().isoformat(),
        help="Snapshot date in YYYY-MM-DD format.",
    )
    snapshot_parser.add_argument("--output", help="Optional output file path.")
    snapshot_parser.add_argument("--force", action="store_true", help="Overwrite existing output.")
    snapshot_parser.set_defaults(handler=handle_snapshot)

    resume_parser = subparsers.add_parser("resume", help="Print a resume checklist.")
    resume_parser.add_argument("--snapshot", help="Snapshot path to use.")
    resume_parser.set_defaults(handler=handle_resume)

    args = parser.parse_args()
    return args.handler(args)


if __name__ == "__main__":
    raise SystemExit(main())
