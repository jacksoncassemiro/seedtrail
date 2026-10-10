<!-- docs-nav:start -->
English · [Português (Brasil)](../../../pt-BR/templates/engineering/architecture.md)

[Home](../../../../README.md) · [Documentation index](../../README.md)
<!-- docs-nav:end -->

Reading reference; operational source: `templates/docs/product/engineering/architecture.md`. This page is not an installed skill or an authored project deliverable.

# Software architecture

Status: to author; not an implementation.

Inputs: bet requirements, constraints, UX and decisions. For services not needing software, mark not applicable with a reason.

Compare a simple solution and justified alternatives: component boundaries, responsibilities, data, information flow, contracts, access, failure/retry, consistency and operations. Do not impose microservices, queues, cache or distributed scaling by default.

Produce Mermaid diagrams, conceptual data models, essential contracts and decisions with problem, alternatives, recommendation, consequences and review conditions. Explain why these choices meet behavior requirements.

Output: design proportional to the product's declared state, risks/open questions, necessary technical proofs and change-plan references. Distinguish proposal, decision and observed implementation. Maintain this source as features, data, contracts and operations evolve; change plans retain the approach/delta and link to authoritative architecture. Do not restrict it to the first delivery or copy every historical plan.

Apply [scenario-based technical challenge](decisions-and-technical-review.md) before consolidating significant decisions. Also consider the user-selected option and simplest alternative; record decisions/consumers without equating documentary design with verified behavior.
