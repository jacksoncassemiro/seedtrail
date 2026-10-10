<!-- docs-nav:start -->
English · [Português (Brasil)](../../../pt-BR/templates/engineering/dependencies-and-infrastructure.md)

[Home](../../../../README.md) · [Documentation index](../../README.md)
<!-- docs-nav:end -->

Reading reference; operational source: `templates/docs/product/engineering/dependencies-and-infrastructure.md`. This page is not an installed skill or an authored project deliverable.

# Dependency and infrastructure research

Status: investigation; no tool/vendor selected or installed.

Inputs: behavior, qualities/constraints, architecture, capacity/cost and risks. Feeds technologies.md, structure-and-development.md and the authoritative slice plan.

## Decisions to compare as needed

| Category | Criteria/questions |
|---|---|
| Language/runtime/framework | Suitability, experience/capacity, versions/support, maintenance, libraries and verifiable productivity |
| Database/persistence model | Queries/relationships, transactions/consistency, migration, recovery, volume and cost |
| Hosting | Local/pilot versus release, platform/region, operations, costs, limits, availability and portability |
| Cache | Demonstrated need, audience-specific data/keys, invalidation/expiry, consistency, benefit/cost |
| Queues/events/realtime | Concrete requirements, delivery/retry/idempotency, ordering, monitoring and fallback |
| Storage/files/search | Types/volume, access, versioning, retention/export and pricing |
| Direct/transitive dependencies | Origin, license, versions, maintenance, vulnerability notices, API and replacement cost |
| Build/CI/configuration | Reproducibility, ecosystem-appropriate lockfiles, secrets, environments and proportional verification |

“No cache/queue/separate service now” is valid when unjustified by requirements. Technology names are not architecture; popularity is not comparison.

## Selection register

| Decision/requirement | Options/official sources and dates | Versions/assumptions | Cost/risk/maintenance | Recommendation/needed proof |
|---|---|---|---|---|
| — | Not yet researched | — | — | — |

Research official docs, changelogs, support policies, advisories and licenses. Verify version compatibility/necessary capabilities. Prices/limits are temporal: record access date/scenario instead of freezing old tables as budgets.

With code, maintain relevant inventory/lockfiles; assess available ecosystem scanners/CI with explicit scope/results. [OWASP vulnerable dependency management](https://cheatsheetseries.owasp.org/cheatsheets/Vulnerable_Dependency_Management_Cheat_Sheet.html) informs triage/maintenance. Inventories/scanners do not remove the need to assess actual exposure.

Output: justified decisions, accepted/deferred dependencies, risks/verification tasks and update triggers. Do not install tools just to fill a table.
