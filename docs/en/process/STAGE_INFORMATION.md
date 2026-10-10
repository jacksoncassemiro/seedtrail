<!-- docs-nav:start -->
English · [Português (Brasil)](../../pt-BR/process/STAGE_INFORMATION.md)

[Home](../../../README.md) · [Documentation index](../README.md)
<!-- docs-nav:end -->

Reading reference; operational source: `templates/.kit/STAGE_INFORMATION.md`. This page is not an installed skill or an authored project deliverable.

# Information needed at the right time

Status: guidance rule; not a mandatory questionnaire or list to fill completely at the start.

Before asking, read the request and relevant sources: context, previous answers, decisions, evidence and open questions. Reuse valid information with a reference. If changed, contradictory or inapplicable to new scope, explain why it needs review. Do not load the entire history for a small change.

## When to ask

| Stage/decision | Relevant information | What can wait |
|---|---|---|
| Idea/discovery | Problem/context, intent, hypothetical audience, materials and investigation-changing constraints | Stack, deployment details, credentials and full infrastructure estimate |
| Feasibility/MVP scope | Capacity, time, initial budget/recurring ceiling when they affect the bet; essential constraints | Detailed architecture and suppliers not yet affecting decisions |
| UX/design | Flows, rules, audiences/access, content, accessibility and relevant existing identity | Technical details without current experience effects |
| Engineering/technical decision | Relevant requirements/constraints, local/online execution, available environment/experience, grounded load | Distant hypothetical scale and unselected service configuration |
| Local implementation | Repository/version, task/criteria, commands/dependencies and necessary test data/configuration | Public domain, hosting purchases and production credentials |
| Publication/operations | Destination, owners, operating budget, migrations, recovery and action authorization | Expansions not required for delivery |
| Existing project evolution | Current state, desired change and affected-area evidence | Repeating all discovery or unaffected decisions |

This guides timing without forbidding early decisive constraints. Offline operation, sensitive data or a budget that invalidates the bet may need to be known before engineering.

## Missing information

Ask when an answer materially changes the next decision/action and cannot be found in sources or authorized inspection. Explain its purpose, use the smallest necessary question set and continue independent work. Do not ask the user for information the assistant can inspect in the repository.

Record information not yet needed as an open question with a review condition. If a reversible hypothesis allows progress, identify it and what would change the conclusion. If indispensable, leave the dependent decision open; do not invent answers or treat silence as a choice.

Information requests and authorization requests are different. Do not demand approval at every stage by habit; respect authorized scope and choices. Secrets do not belong in documents: record configuration names/requirements only and guide appropriate secret handling when needed.

## Stage handoff

Reuse the authoritative previous output, with version and limits. Identify only gaps affecting the new delivery; update source and consumers when something changes. Relate unknowns to the [open question register](../templates/context/open-questions.md). A phase does not require filling every template field.
