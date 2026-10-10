<!-- docs-nav:start -->
English · [Português (Brasil)](../../../pt-BR/templates/engineering/existing-project-assessment.md)

[Home](../../../../README.md) · [Documentation index](../../README.md)
<!-- docs-nav:end -->

Reading reference; operational source: `templates/docs/product/engineering/existing-project-assessment.md`. This page is not an installed skill or an authored project deliverable.

# Existing project assessment

Status: procedure; no code/environment analysis performed in this file.

## Input and objective

For existing systems/repositories, understand assessment objective, desired change, version/commit, current rules/docs. Entry may be feature, fix, architecture or operational review. With planning only, review the proposal and state that code/production does not exist or was not supplied.

Use system-design when available for responsibilities/contracts and challenge-assumptions for technical challenge. No skill collection installation required. Security, UX, performance or CI can receive specialist review within scope/available evidence.

## Evidence to examine by scope

- Actual structure/entry points, manifests/lockfiles, modules and dependency direction.
- Critical frontend/backend flows, contracts, data/migrations and relevant access controls.
- Existing tests/checks, build/CI/CD configuration, environments and execution documentation.
- Supplied operating/cost data, metrics, incidents, backups/restoration and dependency maintenance when available.
- Differences between documentation, code and observed behavior. Record supporting file/line/commit or command/log/context.

Do not expose secrets. Code reading does not prove runtime behavior; pipeline configuration does not prove passing execution. Run proportional authorized checks when needed; state missing environment/metric limits. Missing evidence does not prove missing controls.

## Challenge and output

Prioritize findings by objective impact, risk, effort and evidence rather than style preferences. Compare keeping, incremental improvement, component replacement and materially justified rewrite. Assess migration/data costs, compatibility, reversal, deadline and maintenance capacity.

| Finding/source/version | Impact/certainty/limit | Alternatives/cost/effort | Recommendation/verification |
|---|---|---|---|
| — | No assessment performed | — | — |

Deliver current-state map, strengths, demonstrated problems, hypotheses/open questions and a proportional change plan. Relate to [technical decision](decisions-and-technical-review.md) and [capacity/costs](capacity-costs-and-evolution.md). Record user decision/affected consumers. Assessment does not automatically authorize rewriting, production changes or all improvements.
