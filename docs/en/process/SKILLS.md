<!-- docs-nav:start -->
English · [Português (Brasil)](../../pt-BR/process/SKILLS.md)

[Home](../../../README.md) · [Documentation index](../README.md)
<!-- docs-nav:end -->

Reading reference; operational source: `templates/.kit/SKILLS.md`. This page is not an installed skill or an authored project deliverable.

# Local skills and portability

Version 0.1.0 includes **10 original skills**, with local procedures and document references. It does not depend on personal skills. It needs an agent able to read/write files and tools relevant to the work: web access for online research, a stack runtime for code execution, and rendering for visual review.

Disciplines under docs/product are context/deliverable destinations; skills are procedures. A skill may consume/update multiple folders; multiple skills may review a folder. Not every document needs to become a skill.

| Local procedure | When to use | Main deliverables/folders |
|---|---|---|
| [guide-product](../../../templates/.agents/skills/guide-product/SKILL.md) | Select/resume the next action and authority | context, WORKFLOWS, register/handoff |
| [research-product](../../../templates/.agents/skills/research-product/SKILL.md) | Research, evidence, problem and hypotheses | research, definition, questions/review |
| [assess-feasibility](../../../templates/.agents/skills/assess-feasibility/SKILL.md) | Value, business, capacity and MVP | definition, business, cost/roadmap |
| [design-experience](../../../templates/.agents/skills/design-experience/SKILL.md) | Journeys, navigation, states and prototypes | experience, spec/criteria |
| [define-brand-design](../../../templates/.agents/skills/define-brand-design/SKILL.md) | Brand, voice, tokens/components | brand, UX/engineering consumers |
| [plan-engineering](../../../templates/.agents/skills/plan-engineering/SKILL.md) | Stack, architecture, data, structure and operations | engineering, plan/handoff |
| [review-security](../../../templates/.agents/skills/review-security/SKILL.md) | Requested or relevant threat/security review | engineering, quality, requirements/tasks |
| [deliver-slice](../../../templates/.agents/skills/deliver-slice/SKILL.md) | Plan/implement/verify authorized delivery | quality, delivery, affected documents |
| [evolve-product](../../../templates/.agents/skills/evolve-product/SKILL.md) | Pilot, operations, growth and changes | operations, evolution, new entry |
| [challenge-assumptions](../../../templates/.agents/skills/challenge-assumptions/SKILL.md) | Challenge material decisions/evidence | reviews and relevant consumers |
| [maintain-knowledge](../../../templates/.agents/skills/maintain-knowledge/SKILL.md) | Audit/consolidate current knowledge, provenance and history | product map, definitions, consumer docs, delivery notes |

Procedures were locally authored from this kit's models; they are not official external vendor releases. Personal specialists/services can help but are optional. Preserve licenses and references when reusing copied/adapted skill content.

These are not eleven running agents or an autonomous engine. Clients that discover .agents/skills can select by description; otherwise ask the agent to read the relevant SKILL.md. Do not load/execute all for each request. Results depend on work, evidence and verification; installation only makes procedures available.

Apply [organization](ORGANIZATION.md), [catalog](CATALOG.md) and [cycles](WORK_CYCLES.md): relevant materialization, explicit active work, preconditions, consistency, contextual TDD and final comparison. File presence does not demonstrate sufficient content. Scripts need PowerShell 7.2+.

Complete SKILL.md definitions are single-source and written in English. This catalog explains selection/output and links to full procedures. Do not duplicate instructions in translated pages or install translated skills. Skill language does not change deliverable output_language.

## AI clients and discovery

The core is a set of files and procedures, not a universal executor. Documentation checked on 2026-10-07; this assessment used explicit reading in Codex and local helpers. It does not demonstrate native instance-skill discovery or execution in Claude/Gemini/other clients. Confirm version, permissions and sources actually loaded in the selected client.

| Environment | Instructions and skills | Seedtrail use |
|---|---|---|
| [Codex](https://learn.chatgpt.com/docs/build-skills) | AGENTS.md and .agents/skills | Use documented discovery or explicit reading |
| [Claude Code](https://code.claude.com/docs/en/skills) | .claude/skills; [instructions](https://code.claude.com/docs/en/memory) through CLAUDE.md or AGENTS.md under documented version/configuration conditions | Read existing procedures; when needed, a small adapter points to the source instead of another editable library |
| [Gemini CLI](https://geminicli.com/docs/cli/using-agent-skills/) | .gemini/skills or .agents/skills; [context.fileName](https://geminicli.com/docs/cli/gemini-md/) selects the instruction file | Configure only when used and verify actual loading |
| Generic chat/other assistant | Local access, execution and discovery are not guaranteed | Supply relevant sources and state missing tools; do not promise local execution |

A skill supplies a procedure in the assistant's context. A **subagent** executes delegated work in its own context; it can help independent research or extensive review when available and authorized. Do not create agents per stage or job title. Define question, sources/baseline, relevant skill, output, write scope, stopping condition and integration owner. Prefer independent readers and one writer per source; isolate overlapping edits in separate checkouts.

Automatic memory, temporary plans and chat summaries are client conveniences. Team-relevant decisions, evidence and open questions belong to versioned sources and identified work. Resume from current files, reconciling differences, without copying the entire transcript into another memory.

Hooks, native commands, checkpoints and adapters are optional after concrete need and client testing. Host permissions/sandbox remain authoritative; guided/continuous modes do not replace them. MCPs, services and another agent runtime are not dependencies. Evaluate the method with consultation, resumption, change and collaboration tasks, recording outcomes/limits; AI simulation does not prove human comprehension or demand.
