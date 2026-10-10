<!-- docs-nav:start -->
English · [Português (Brasil)](../../../pt-BR/templates/engineering/security-and-privacy.md)

[Home](../../../../README.md) · [Documentation index](../../README.md)
<!-- docs-nav:end -->

Reading reference; operational source: `templates/docs/product/engineering/security-and-privacy.md`. This page is not an installed skill or an authored project deliverable.

# Security, privacy and audit

Status: preparation. Creating this file performs no audit, scan, penetration test or implemented-control demonstration.

## Cycle integration

| Moment | Question/work | Output feeds |
|---|---|---|
| Context/requirements | Which data, people/audiences, assets and consequences need protection? | Rules, constraints and scenarios |
| UX/design | Does the interface respect audience, access, errors and sensitive information? | Flows/states and review |
| Architecture | Could trust boundaries, authorization, data and failures permit abuse? | Risks/mitigations and contracts |
| Technologies/dependencies | Do versions, support, provenance and exposure alter risks? | Selection, updates and tasks |
| Implementation | Do defined controls actually work? | Review/tests and findings |
| Release/operations | Are configuration, secrets, recovery and response appropriate for the audience? | Release conditions and operations guide |
| Change/incident | New audience, data flow, endpoint or dependency? | Model and relevant consumer review |

Select relevant verifiable requirements from references such as [OWASP ASVS](https://owasp.org/www-project-application-security-verification-standard/), recording version/IDs. No conformity/full-coverage claims without corresponding work.

## Risk model to author

Assets, boundaries, actors/access, data/flows; plausible scenarios, conditions, impacts, evidence/hypotheses; mitigations, requirements/tests, owners and residual risk. [Threat modeling](https://owasp.org/www-community/Threat_Modeling) supports ongoing review.

Privacy: necessary collection, audience, retention, export/deletion and logs. Identify actual applicable obligations before promising conformity; requirements do not imply certification.

## Findings/audit register

| ID/base/scope | Evidence/reproduction | Consequence/justified priority | Mitigation/consumer | Verification/limit |
|---|---|---|---|---|
| — | No audit executed | — | — | — |

Distinguish conceptual risks, code/configuration findings, tool alerts and demonstrated failures. Reports include paths/versions, method, examined and excluded scope. Clean scans do not prove total security; alerts need contextual triage.

Security skills can support available, requested work within scope/supported languages. Optional examples are security-best-practices and security-threat-model when available on the host; they are neither scanners nor independent audits. The reusable kit does not install them.

## Technical integration

Also read dependencies-and-infrastructure.md and diagrams.md. Material risk becomes decisions/requirements/tasks and verification. Access/cache/log/storage changes require relevant scenario review. Do not impose full audits on every small edit or mark nonexistent checks passed.
