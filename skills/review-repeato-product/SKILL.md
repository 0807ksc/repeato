---
name: review-repeato-product
description: Boot and use the current Repeato product, following the project's product run guide, to evaluate real user flows, identify broken or missing behavior, and convert findings into next requirements. Use when Codex needs to test the current app build, gather user-style feedback, propose follow-up requirements, or proceed automatically on low-risk documentation/test/workflow follow-ups.
---

# Review Repeato Product

## Overview
- Follow the project run guide, boot the product, exercise core user flows, and turn observations into concrete follow-up requirements.
- Prefer actual product use when the environment supports it. When GUI interaction is limited, combine real boot evidence with widget tests and code-backed scenario review.

## Workflow
1. Read the canonical run guide at `doc/work/repeato-product-run-guide-v1.md`.
2. Run deterministic smoke checks first.
   - `scripts/run_repeato_smoke_checks.sh ../../app`
3. Boot the product with one of the targets listed in the guide.
4. Walk through the guide scenarios in order.
   - `Today`
   - `Decks`
   - `Add`
   - `Insights`
   - `Profile`
5. Write findings using the evidence format from the run guide.
6. Convert findings into requirements using `references/feedback-rubric.md`.
7. If the follow-up is low risk, continue automatically.
   - Documentation updates
   - Test additions
   - Workflow queue updates
   - Copy cleanup
8. If the follow-up changes product scope, priorities, server dependencies, or payment/import behavior, stop and report the requirement to the user first.

## Output Rules
- Always distinguish between:
  - actual boot evidence
  - automated test evidence
  - inference from code/documents
- Always group findings into:
  - broken
  - missing
  - unclear
  - polish
- Always propose the minimum next requirement, not a full roadmap by default.

## References
- Canonical run guide: `doc/work/repeato-product-run-guide-v1.md`
- Example review artifact: `doc/work/repeato-product-review-2026-04-04-v1.md`
- Requirement triage rubric: `references/feedback-rubric.md`
