---
name: deliver-slice
description: Decompose, implement and verify a product slice within authorized scope, or prepare execution handoff. Use for local delivery, MVP, features or fixes; do not start development from an idea still in discovery.
---

# Deliver a slice

Read the current request, project base and [handoff](../../../docs/product/delivery/handoff.md). Identify authoritative requirements/plan before authorized local implementation. No personal skills required; product runtime/libraries follow its actual stack.

1. Confirm requested outcome, scope/non-goals, base and observable criteria. In planning, produce tasks/completion conditions without inventing executed code/tests. For bugs, record expected/observed, reproduction and impact before proposing changes.
2. Decompose into complete slices with real dependencies/criteria. Use [roadmap/management](../../../docs/product/delivery/roadmap-and-management.md), [changes](../../../.kit/WORK_CONTRACT.md) and [local structure](../../../docs/product/engineering/structure-and-development.md). Tasks reference requirements/decisions, not just filenames.
3. Use the [local slice contract](../../../.kit/WORK_CONTRACT.md) for specs/plans/tasks and consistency. Avoid duplicate canonical backlogs/plans; checklists are not executed tests.
4. When implementation is requested, inspect environment/code and preserve conventions/existing changes. Make bounded changes; review access/data risk and use review-security when relevant. Local development does not require publication or purchases.
5. Perform proportional [verification](../../../docs/product/quality/verification.md): original behavior, meaningful regression, criteria/contracts, relevant failures and rendered UI. Record commands/versions, results and limits. Tests merely repeating implementation do not demonstrate benefit; CI only when relevant.
6. Review affected docs, release/operations and open questions. Complete by criteria evidence, not file existence. If failures/information block progress, record the precise blocker and continue authorized independent work.

Output: concrete delivery/plan, requirement → task → result traceability, criteria status and updated consumers. Passing tests do not prove demand, comprehensive security or publication authorization.

For UI/MVP, consume [design/accessibility review](../../../docs/product/experience/design-and-accessibility-review.md) criteria; verify actual material and record what remains untested.

## Organization and results

Read authoritative sources and any selected work relevant to this request. For a simple edit, preserve existing records; do not create work/state or load process guides just to apply the skill. Consult [organization](../../../.kit/ORGANIZATION.md) when destinations/authority need clarification, [catalog](../../../.kit/CATALOG.md) when selecting/materializing a missing artifact, and [cycles](../../../.kit/WORK_CYCLES.md) when managing work state, resumption or preserved evidence. Models guide format, not observed results; materialize only what is needed and preserve existing knowledge/proofs.

Before implementation, review specific spec/plan/task consistency: uncovered requirements, tasks without sources, conflicts, dependencies and criteria without verification. Correct authoritative artifacts. Apply contextual TDD to deterministic rules, permissions/links, contracts and reproducible bugs: observe initial failure, implement, observe pass and refactor; justify suitable alternatives. At closure, compare results with intent, adding traceable corrections and preserving IDs; update consumers. Helpers check structure/hash while relevant inspection/tests establish behavior.

For unexpected failure, use [.kit/METHODS.md](../../../.kit/METHODS.md) diagnosis: reproduction, evidence-backed hypothesis, cause-distinguishing experiment and verified correction. Expose material assistant choices not explicit in the base; separate authorized autonomy from user decisions. Do not weaken criteria to make delivery appear complete.

At change entry, identify the affected feature's current definition and reader guidance, not only past work specs. Tasks slice execution; use descriptive names for new changes without mandatory prefixes. Reuse the feature identity/current consultation page across deliveries. Record which guidance/contracts require updates and verify actual behavior before consolidation; a plan or completed documentation task does not prove feature implementation. Prefer links to responsible sources over regenerating a whole manual.
