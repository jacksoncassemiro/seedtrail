<!-- docs-nav:start -->
English · [Português (Brasil)](../../pt-BR/process/ORGANIZATION.md)

[Home](../../../README.md) · [Documentation index](../README.md)
<!-- docs-nav:end -->

Reading reference; operational source: `templates/.kit/ORGANIZATION.md`. This page is not an installed skill or an authored project deliverable.

# Where to save and find information

Start with the product README and its map at docs/product/README.md. Read a feature's current page to understand it; open the selected change to modify it. Readers do not need the whole catalog.

## Two parts of product documentation

```text
docs/product/
├── README.md                  product index
├── features/                  current features: rules, usage and short history
│   ├── item-addition.md        example topic, not a required file
│   └── item-removal.md
├── context/                   idea, principles and open questions
├── brand/                     brand and DESIGN.md
├── engineering/               shared architecture and contracts
├── delivery/                  roadmap and delivery notes when needed
└── work/                      research/changes with origin, plan and outcome
    ├── add-checklist/          initial creation
    └── persist-undo/           later change to the same feature
```

**Current documentation** explains the product in its declared state. A **change** retains bounded intent and what happened to realize it. A feature receives several changes over time; one change may affect several features. Research can also use work/<name> for provenance/resumption without being an implementation.

features is the recommended starting destination for features in new projects. Do not add a parallel capability tree. Existing projects retain useful sources linked from the map. A very small product can use sections in one page; do not generate a page per button, requirement or task.

## What goes where

| Question | Authoritative source | Useful content |
|---|---|---|
| What is this feature's current definition? | A features page, or an existing source linked from the map | Purpose, state, requirements/business rules, acceptance scenarios, usage, limits, dependencies and technical links |
| What should change and how is delivery accepted? | The change's spec.md | Delta from the current baseline, scope, non-goals and verifiable criteria |
| How will it be done? | The change's plan.md when needed | Approach, alternatives, dependencies/risks and links to shared architecture |
| What needs execution? | The change's tasks.md when needed | Steps/checks tied to criteria |
| What actually happened? | The change's verification.md and evidence/ | Baseline/environment, procedure, observations, results and limits |
| How should work resume? | The change's brief.md and handoff.md | Objective, scope, state and next step; state.json supports the helper |
| What changed in this feature? | Short history on its current page | ISO date, effect, originating change and confirmed version/availability |
| What shipped in a product version? | delivery/release-notes.md when a delivery exists | Effects grouped by audience/version, linking changes |
| Why does the product exist, what is its brand and how is it built? | context/, brand/ and engineering/ | Shared knowledge, not repeated in every feature |

Do not create every file by default. A small fix can use a record plus verification. A research decision may end without a spec, code or release. Other [catalog](CATALOG.md) disciplines appear only for their own question and content.

## Feature page

Combine definition and consultation on one page when they serve the same readers: purpose/state, rules/scenarios, usage/limits, relationships and history. Do not require separate manuals/specs for each feature. If an existing contract or manual serves another audience, retain its authority and link the documents instead of duplicating rules. Public guidance can omit internal details, with explicit consumer review.

The page also answers how this part works: relevant flows, data/access, integrations/dependencies, architecture/useful diagrams, failure/recovery, quality and operations as appropriate. Shared details remain in directly linked contract/architecture/design/operations sources. Readers should find current answers without opening every old change. Do not require sections without useful content or reproduce code/contracts in full.

Current requirements, business rules and acceptance criteria belong in that definition. Criteria describe expected outcomes; pass/fail and proofs belong to verification of the examined change. The change spec records deltas and relevant regressions without replacing the consultation source. A definition can be decided before code: record authority/origin and distinguish proposal, decision, implementation and availability without inventing approval. Incorporate new rules/scenarios into their authoritative source as the feature evolves, retaining the decision and proof at their origin.

Start with features/<name>.md. When consultation warrants it, group by area, such as features/events/registration.md; a large feature can grow into features/events/registration/README.md and subtopics. Its page/map declares the current address and updates links when moved. Do not mandate product → module → submodule → feature or mirror frontend/backend. Capability may mean feature; it is not another mandatory registry.

Behavior changes normally retain the consultation address. Justified regrouping or association corrections may move the authority: preserve identity/provenance, record reasons and update the map/current consumers. If the old address is referenced, retain a brief pointer where useful without repeating rules. Historical bytes/proofs are not rewritten to appear as though they already referenced the new organization.

## Change and preserve history

1. Read the current page and affected contracts/dependencies; pin a recoverable baseline such as commit/tag or snapshot.
2. Create a descriptively named change, such as persist-undo, when new intent/delivery warrants separate history. Clarification within open work stays there; trivial edits may use the source and Git history.
3. Record the delta and criteria in its spec; add plans, tasks and research as needed.
4. Execute/verify within authorized scope. Then update the same current page and relevant consumers. Proposed work is not presented as available behavior.
5. Retain proofs/decisions in the change. Add a feature-history row and delivery notes only when useful. Do not write the full account three times.

Dates and links make evolution consultable; independent feature versions are not required. Separate versions make sense only for independently distributed contracts. Helpers neither generate manuals nor guarantee semantic synchronization.

## Method and resumption

.kit holds configuration, library and helpers; .agents/skills holds procedures. Neither is product documentation. Lean initialization creates context/map; -Structure complete only prepares models. Technical names are English; authored content follows output_language.

Resume through .kit/project.json.active_work or an explicit ID, reading relevant brief/handoff/sources. Do not choose the newest folder. WRK in old examples is neither required nor a market standard: new names describe the change. Completed history retains its identities/proofs; changing a link label does not change origin.

Preserve proof bytes/hashes before revising a mutable source, as explained in [cycles](WORK_CYCLES.md). Do not rewrite historical evidence to imply it verified a newer version. Helpers reject stale state/configuration writes under a short local lock, exercised across processes in the same Windows OS session; they provide neither an all-file transaction nor coordination across sessions/machines, editors and Git. In teams, use explicit IDs: active_work is shared selection, not personal assignment. Reload/reconcile after conflicts instead of automatically merging criteria. Separate branches/checkouts help overlapping edits. The [work contract](WORK_CONTRACT.md) details artifacts, and [methods](METHODS.md) record reference practices and their limits.
