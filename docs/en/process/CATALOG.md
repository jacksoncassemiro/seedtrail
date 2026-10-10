<!-- docs-nav:start -->
English · [Português (Brasil)](../../pt-BR/process/CATALOG.md)

[Home](../../../README.md) · [Documentation index](../README.md)
<!-- docs-nav:end -->

Reading reference; operational source: `templates/.kit/CATALOG.md`. This page is not an installed skill or an authored project deliverable.

# Catalog and on-demand generation

The instance catalog is .kit/catalog.json: id, stage, scope, template and destination. It is not a backlog. Source-kit models are linked below; in lean instances, links to absent results point to the .kit library.

The [product map](../templates/README.md), ID product-guide, links context, current knowledge and work. [Current behavior](../templates/definition/product-behavior.md), ID product-behavior, is authored only when shared rules need a current source; it is not another change report.

| Stage | Reference model/contract | Author when |
|---|---|---|
| context | [Context](../templates/context/idea.md), [principles](../templates/context/principles.md) | Entry, resumption and relevant decisions |
| research | [Research](../templates/research/desk-research.md) | A question changes the next decision |
| product | [Problem/value](../templates/definition/problem-and-value.md), [experiments](../templates/definition/experiments-and-mvp.md) | Define a bet and experiment |
| business | [Feasibility](../templates/business/feasibility.md) | Relevant capacity, buyer, channel or revenue |
| experience | [Flows](../templates/experience/flows-and-prototype.md), [review](../templates/experience/design-and-accessibility-review.md) | Interaction or prototype under discussion |
| brand | [Brand](../templates/brand/brand.md), [DESIGN](../templates/brand/DESIGN.md) | Identity/visual contract needed |
| engineering | [Architecture](../templates/engineering/architecture.md), [decisions](../templates/engineering/decisions-and-technical-review.md) | Plan solution/technical proof |
| quality | [Verification](../templates/quality/verification.md) | Prepare or check results |
| delivery | [Roadmap](../templates/delivery/roadmap-and-management.md), [slice](WORK_CONTRACT.md) | Prioritize deliveries or implement changes |
| operations | [Operations](../templates/operations/launch-and-operations.md) | Relevant pilot/release |
| evolution | [Decisions/changes](../templates/evolution/decisions-and-changes.md) | Learning or updates |
| reviews | [Critique](../templates/reviews/critical-review.md), [evidence](../templates/reviews/evidence-review.md) | Decisive assumption or conflict |

For foundations: -Stage research or -Document desk-research, architecture, technologies, DESIGN, etc. IDs are filenames without extension; the README map uses product-guide. Inspect JSON before calling the helper.

For identified work: -Work ID and -Document research, decision, spec, plan, tasks, consistency, verification or convergence. Create only what is needed. Engineering uses spec → plan → tasks → consistency → implementation → verification/convergence; research/design use relevant inputs.

Models have explicit status. When authoring, replace “Status: model” with the actual state and retain sources/limits. Materializing every document does not complete a stage. Read [organization](ORGANIZATION.md) and [cycles](WORK_CYCLES.md).
