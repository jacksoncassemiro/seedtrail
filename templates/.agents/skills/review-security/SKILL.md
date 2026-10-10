---
name: review-security
description: Model threats and challenge access, privacy, data and dependencies in a proposal, or review code controls within requested scope. Use for explicit security review or relevant planning, not certified auditing.
---

# Review security

Read scope, sensitive data, actors, architecture/contracts and [security/privacy](../../../docs/product/engineering/security-and-privacy.md). No personal skills/external scanners required. Use available tools and state coverage/limits. Do not conduct offensive exploitation of external systems or extend tests beyond authorization.

- Identify assets, trust boundaries, identity/authorization, roles and visibility. Examine references, search, notifications, logs, attachments, export and publication when they can expose data; general membership is not universal access.
- For each relevant scenario, record actor capability, entry, precondition, abuse path, impact, mitigation and verification. Challenge isolation, exposed IDs, escalation, validation, execution/rendering, secrets, retention/revocation and recovery proportionally.
- Without code, record design requirements/risks and future tests rather than runtime vulnerabilities. With code, inspect concrete paths/versions: server authorization, validation, parameterization, uploads, sessions, dependencies and configuration for the stack. Current technical documentation must support specific recommendations.
- Distinguish evidence-confirmed findings, plausible risks and unknowns. Link cause/file/flow, impact, correction and regression test; avoid acronym checklists or conformity claims based on naming standards.
- Compare mitigation cost/impact with risk rather than indiscriminate controls. For audit tools, record command/version/coverage and confirm findings before treating them as facts.

Output: prioritized threats/findings, evidence, mitigation and residual risk; update requirements/plans/tasks and [verification](../../../docs/product/quality/verification.md). Documentary review does not certify security or replace relevant execution. Authorized local fixes may proceed within scope; publication/production retain their own conditions.

## Organization and results

Read authoritative sources and any selected work relevant to this request. For a simple edit, preserve existing records; do not create work/state or load process guides just to apply the skill. Consult [organization](../../../.kit/ORGANIZATION.md) when destinations/authority need clarification, [catalog](../../../.kit/CATALOG.md) when selecting/materializing a missing artifact, and [cycles](../../../.kit/WORK_CYCLES.md) when managing work state, resumption or preserved evidence. Models guide format, not observed results; materialize only what is needed and preserve existing knowledge/proofs.
