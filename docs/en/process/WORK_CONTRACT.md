<!-- docs-nav:start -->
English · [Português (Brasil)](../../pt-BR/process/WORK_CONTRACT.md)

[Home](../../../README.md) · [Documentation index](../README.md)
<!-- docs-nav:end -->

Reading reference; operational source: `templates/.kit/WORK_CONTRACT.md`. This page is not an installed skill or an authored project deliverable.

# Work and change contract

For significant questions or changes, use docs/product/work/ID with origin/baseline, scope and verifiable outcome. This is a method contract, not a product deliverable. Work may span relevant stages for one intent. Do not create a package per stage or another changes directory.

Keep only necessary information:

| Logical artifact | Content | Consumer |
|---|---|---|
| Brief/state | Origin, objective, recoverable base, scope, criteria and progress | Selection/resumption |
| Research/decision | Question, source/date/limits, alternatives, choice/authority and review condition | Definition, experiment or plan |
| Spec | Baseline delta, scope/non-goals, scenarios, requirement IDs, access/data and criteria | Plan/verification |
| Plan | Decisions/alternatives, structure/contracts, dependencies with versions/availability, risks/migration | Tasks/operations |
| Tasks | Verifiable results linked to requirements, actual dependencies and criteria | Execution |
| Consistency | Uncovered requirements, conflicts, unavailable dependencies, unverifiable criteria | Fixing authoritative sources |
| Verification/convergence | Version/environment, expected/observed, outcome/limits, choices and updated consumers | Closure/current knowledge |

Not every file is mandatory. Small bugs may use a record and verification; research may end in a decision without implementation. Material technical changes can reference ADRs/contracts. Recorded information has one authoritative source, referenced elsewhere.

Current product/UX/design/architecture knowledge is input. Work records differences; current documentation incorporates relevant outcomes/decisions with state/provenance. Decided does not mean implemented. Missing dependencies block consuming actions, not all independent work.

Current requirements, business rules and acceptance scenarios belong in the feature definition, including before implementation when a decision is recorded. The change spec records deltas and relevant criteria/regressions; at closure, consolidate new rules/scenarios into their authoritative source. Pass/fail, environment and proofs remain in that change's verification. Helper IDs such as C001 identify work criteria; they do not replace feature requirements or scenarios.

At closure, examine criteria/effects, update the map and relevant consumers, retain examined-version proof and open questions. Material scope/criterion changes get a new identity tied to the previous base, as described in [cycles](WORK_CYCLES.md). Correct false relationships with reasons; retain history/superseded decisions. Capability folders are optional consultation aids; do not repeat the whole product per request.

[Organization](ORGANIZATION.md), [catalog](CATALOG.md) and [stage contracts](STAGE_CONTRACTS.md) guide destinations/transitions.

Identify new changes with descriptive names such as add-registration; prefixes and numeric sequences are unnecessary. Specs are work artifacts; tasks slice execution and features retain separate identity/consultation addresses. Brief/spec identify current documentation consumed and readers/sources needing updates. Do not generate a complete manual per change. After material delivery, a later change has its own baseline/identity; clarification within open work retains its intent/acceptance. Usage guidance incorporates available behavior in its declared state.

## Identity, intent and similar names

The ID uniquely names a work folder within the project; its readable title may resemble another work. Helpers accept IDs of 3–80 characters beginning with a letter and containing letters/digits/hyphens, and reject an existing folder. This does not detect different names with overlapping intent or coordinate identity across branches/machines. Do not rely on capitalization alone to distinguish IDs.

Before creating, consult the feature's work and compare objective, baseline, criteria and state. Continue the same open intent with its ID; a new delivery after closure receives another, linked to its origin. Prefer a differentiating effect/context such as fix-registration-capacity. If description is insufficient, use an existing ticket identifier or agreed unique suffix, such as implement-registration-20261010-a; a date alone is not unique. Do not rename history to free a name or mandate another global sequence. In teams, examine concurrent work and planned integration too.

In brief/index, identify the affected feature and pertinent relationship: implements a definition, continues an origin, depends on another delivery or supersedes a particular decision. No additional registry is needed. Select by explicit ID; similar titles, newest folders and active_work do not establish priority or ownership.

Specification work may close against documentary criteria with its definition still unimplemented. Later implementation identifies the recoverable definition and observed technical state, referencing decided requirements instead of duplicating them. completed means that work's objective was met with its proofs, not that every associated feature is available. The [definition-before-code workflow](WORKFLOWS.md) describes both transition options.
