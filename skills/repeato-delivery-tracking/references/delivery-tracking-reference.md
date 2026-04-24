# Delivery Tracking Reference

## Required Inputs
- Task title
- Goal
- Scope
- Out of scope
- Issue number
- Stage/task/org tags when already known

## Mandatory Sequence
1. Confirm the task is a development task.
2. Prepare the 3-developer implementation review.
3. Create or restore the GitHub issue.
4. Create a branch with the issue number.
5. Implement and test.
6. Record `flutter analyze`, `flutter test --coverage`, and line coverage.
7. Prepare the PR with QA focus and PM decision notes.

## Required Issue Fields
- Background
- Goal
- Scope
- Out of Scope
- 3-Developer Implementation Review
- Role Split
- QA Checkpoints
- Test Coverage Plan
- User Feedback Need

## Required PR Fields
- Linked Issue
- Summary
- Review Plan
- Tests
- Coverage
- User Impact
- QA Focus
- PM Decision Needed

## Coverage Rule
- Default baseline: line coverage `>= 70%`
- If below baseline, record the measured value, reason, follow-up plan, and owner.

## GitHub Auth Blocked Rule
- Log `GitHub issue pending` in `doc/context/context-log.md`.
- Do not treat local-only tracking as final.
- Restore the GitHub issue before PR creation at the latest.
