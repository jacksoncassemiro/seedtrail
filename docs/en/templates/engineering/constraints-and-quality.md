<!-- docs-nav:start -->
English · [Português (Brasil)](../../../pt-BR/templates/engineering/constraints-and-quality.md)

[Home](../../../../README.md) · [Documentation index](../../README.md)
<!-- docs-nav:end -->

Reading reference; operational source: `templates/docs/product/engineering/constraints-and-quality.md`. This page is not an installed skill or an authored project deliverable.

# Quality requirements and constraints

Status: technical investigation; no invented numeric targets.

Before stack selection, identify relevant functional outcomes, data/audiences, platform, offline/realtime needs, probable volume, performance, availability, integrity, accessibility, privacy/retention and recovery.

Gather capacity, experience, budget, deadline, existing tools and operating costs. Distinguish requirements from technology preferences. Load estimates need assumptions/ranges.

Output: prioritized constraints, observable qualities, investigation hypotheses and criteria guiding architecture/technology/structure/tests.

For decisive quality, use concrete scenarios: source/actor, event, environment/condition, affected part, expected response and grounded measure/limit. Example without an invented target: membership access loss during a query must prevent restricted content exposure in the response and relevant consumers. Connect scenarios to decisions/contracts and tests/proofs; unknown numbers stay open. Views/ADRs should answer slice questions rather than fill forms.
