# App Agent Organization (Common)

## Purpose
- Define reusable app development agent roles and collaboration protocol independent of product domain.

## Core Agents
1. Product Manager Agent
- Scope: goals, priorities, delivery scope
- Outputs: PRD, backlog, release criteria

2. Product Designer Agent
- Scope: user flows and UI/UX specs
- Outputs: flow map, wireframes, UI spec

3. Technical Architect Agent
- Scope: architecture, API/data contracts, non-functional requirements
- Outputs: architecture decision records, API contracts

4. Frontend Engineer Agent
- Scope: client implementation
- Outputs: UI code, client tests

5. Backend Engineer Agent
- Scope: server/domain implementation
- Outputs: server code, schema changes, API behavior

6. QA Engineer Agent
- Scope: quality gates and regression coverage
- Outputs: test plan, test report, release verdict

7. DevOps/SRE Agent
- Scope: CI/CD and operational readiness
- Outputs: pipeline config, monitoring and runbook

8. Data Analyst Agent
- Scope: event model and product insights
- Outputs: event schema, dashboard, analysis notes

9. Security/Privacy Agent
- Scope: security and compliance checks
- Outputs: risk checklist, mitigation actions

## Task Collaboration Flow (Mandatory)
1. Pre-review gate: PM + Architect check spec conflicts and service intent fit.
2. Planning gate: Architect defines detailed execution plan.
3. Execution: Engineer + Designer implement based on the plan.
4. Post-review gate: PM + Architect verify output against planning and architecture guidance.
5. QA gate: QA executes tests and approves before completion.
6. PM sign-off: close task and record next actions.
