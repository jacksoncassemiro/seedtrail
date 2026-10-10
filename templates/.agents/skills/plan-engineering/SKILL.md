---
name: plan-engineering
description: Propose/challenge architecture, technologies, data, contracts, structure and operations based on requirements/capacity; assess existing projects. Use for material technical planning, not default stack choices or unscoped code execution.
---

# Plan engineering

Read context, relevant requirements/UX and decisions. Use [technical decisions/review](../../../docs/product/engineering/decisions-and-technical-review.md). Personal skills are not required. Explain terms/consequences to a beginner founder.

1. Extract behavior, data/access, quality, capacity and known constraints. Use [constraints](../../../docs/product/engineering/constraints-and-quality.md) and [capacity/costs](../../../docs/product/engineering/capacity-costs-and-evolution.md). Unknowns do not justify microservices, cache or invented metrics.
2. For existing projects, perform [assessment](../../../docs/product/engineering/existing-project-assessment.md): actual structure, dependency versions, contracts, tests, limits and observed results. Do not recommend rewrites by preference or claim unperformed execution.
3. Compare [architecture](../../../docs/product/engineering/architecture.md) and [technology](../../../docs/product/engineering/technologies.md) options by requirements, maintenance, team, cost, scale and reversibility. Research current primary sources for material differences; identify version/environment. Preserve final user choice and document demonstrated conflicts.
4. Model identity, relationships, integrity, access, transactions/failures and API/event contracts only where needed. Produce [useful diagrams](../../../docs/product/engineering/diagrams.md) answering context, flow, data or deployment questions; use Mermaid when appropriate. Avoid views without a decision purpose.
5. Prepare [structure/local execution](../../../docs/product/engineering/structure-and-development.md) and [dependencies/infrastructure](../../../docs/product/engineering/dependencies-and-infrastructure.md): applicable frontend/backend, environments, migrations, configuration, observability, backup/recovery and stage-appropriate CI/CD. Local prototypes do not require hosting.
   Inspect and respect existing team conventions before proposing changes. Distinguish management (Scrum/Kanban), Git integration (GitHub Flow, Gitflow or trunk practices) and physical isolation (clones/worktrees). Ask only for missing constraints relevant to this work: release cadence, reviewers, concurrent owners, CI and checkout topology. Separate checkouts/branches reduce overlapping edits but do not eliminate integration or semantic conflicts; shared active_work is selection, not assignment. State the topology actually tested. Do not impose a branching method or create branches/agents automatically.
6. Use review-security for relevant boundaries/threats/review. Use small proofs for decisive technical risks; proposals are not implemented controls.

Output: justified decision, alternatives/constraints, contracts/diagrams, risks/proofs, structure and [handoff](../../../docs/product/delivery/handoff.md). Local plans/contracts own their slice per WORK_CONTRACT.md; general models reference them. Do not keep two canonical plans.

## Organization and results

Read authoritative sources and any selected work relevant to this request. For a simple edit, preserve existing records; do not create work/state or load process guides just to apply the skill. Consult [organization](../../../.kit/ORGANIZATION.md) when destinations/authority need clarification, [catalog](../../../.kit/CATALOG.md) when selecting/materializing a missing artifact, and [cycles](../../../.kit/WORK_CYCLES.md) when managing work state, resumption or preserved evidence. Models guide format, not observed results; materialize only what is needed and preserve existing knowledge/proofs.
