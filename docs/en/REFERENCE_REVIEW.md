<!-- docs-nav:start -->
English · [Português (Brasil)](../pt-BR/REFERENCE_REVIEW.md)

[Home](../../README.md) · [Documentation index](README.md)
<!-- docs-nav:end -->

# Evaluation of agent references

Documentary review dated October 6, 2026, on main branches. This is neither our benchmark nor a vendor installation test. These are our suitability judgments: retain one local guide and adopt practices that close concrete gaps. The six projects were not installed or redistributed in Seedtrail.

| Project and primary source | What it offers | Application and potential conflict |
|---|---|---|
| [dzhng/skills](https://github.com/dzhng/skills) | Exploration, slice specs, implementation, tests, review, handoff and agent choice skills. [audit-choices](https://github.com/dzhng/skills/tree/main/skills/engineering/audit-choices) surfaces decisions introduced by the implementer; [auto-research](https://github.com/dzhng/skills/tree/main/skills/engineering/auto-research) uses measurable evaluation. | Adopted choice review and a baseline for optimization. Do not adopt automatic delegation/push or replace code review with a ledger. A technical experiment does not validate a market. |
| [BMad Method](https://github.com/bmad-code-org/BMAD-METHOD) | Broad method, specialist perspectives and persistent context. Its [planning guide](https://docs.bmad-method.org/plan/choose-a-planning-path/) selects tools by intent/uncertainty, with more depth for coordination/risk. | Adopted procedure sizing in guide-product. The whole system would introduce another guide and artifact organization. Our review did not demonstrate local superiority; future alternative adoption needs separate evidence. |
| [BuilderOS](https://github.com/BuildGreatProducts/builder-os) | Independent skills connect idea, plan, design, code and launch through documents. [Build Loop Codex](https://github.com/BuildGreatProducts/builder-os/blob/main/skills/build-loop-codex/SKILL.md) reviews, tests and fixes increments. | Document handoff, tokens and experience review fit local skills. Do not introduce another canonical roadmap or checkbox-only execution. Review commands depend on the host; repeating every test and requesting scope confirmation every time would be inappropriate for some deliveries. |
| [Humanizer](https://github.com/blader/humanizer) | Prose review checking claims and preserving facts and structured content. | Added editorial checks to METHODS without a redundant skill. Aim for clarity; never invent stories, opinions, interviews or data to sound human. Style rewriting does not establish truth. |
| [Superpowers](https://github.com/obra/superpowers) | Engineering process with brainstorming, plans, TDD, review and execution. [systematic-debugging](https://github.com/obra/superpowers/tree/main/skills/systematic-debugging) investigates causes and tests hypotheses. | Adopted diagnosis in METHODS/deliver-slice. TDD and verification already exist locally. Avoid whole bootstrap: repeated approvals, universal policies, agents per task or removing untested code can conflict with scope, context and authorized autonomy. |
| [Ponytail](https://github.com/DietrichGebert/ponytail) | Its [procedure](https://github.com/DietrichGebert/ponytail/blob/main/skills/ponytail/SKILL.md) reduces complexity and favors reuse, with persistent rules and intensity levels. | Adopted comparison of simple solutions by suitability and maintenance. Do not enable globally: fewer files, less text and fewer tests may weaken explanation, traceability or coverage. Preserve requirements, security, readability and accessibility. |

## Effects on the workflow

Original procedures in [METHODS](process/METHODS.md), [guide-product](../../templates/.agents/skills/guide-product/SKILL.md) and [deliver-slice](../../templates/.agents/skills/deliver-slice/SKILL.md) now specify proportional depth, diagnosis, assistant choices, simplification, baseline evaluation and editorial checks. They fit our contract without copying complete prompts or layering six frameworks. Eleven skills remain sufficient; skill count does not measure coverage.

| When | Responsible procedure | Concrete result |
|---|---|---|
| Small request or later-stage entry | guide-product | Sufficient scope and artifacts without restarting every phase |
| Reproducible bug or failed verification | deliver-slice + METHODS diagnosis | Experiment-backed cause and verified correction |
| Assistant selected material behavior/technology | METHODS choice review | Choice, reason, consequence and need for a user decision |
| Optimization with measurable outcome | METHODS baseline evaluation | Before/after comparison and limits, not a savings claim |
| Document/response ready for delivery | METHODS editorial check | Clear text preserving facts, sources and uncertainty |
| Solutions of different complexity | METHODS simplification | Sufficient alternative with maintenance cost and preserved requirements |

Stars help discover candidates; they do not measure suitability, security, quality or demand. These practices are not all activated for every task. Installing all six packages would combine overlapping guides, memories, approvals and conventions; benefits must justify that cost. Prefer adapting a demonstrable practice in its responsible procedure. Remove adaptations that do not produce useful decisions or verification.

[Ponytail's published benchmarks](https://github.com/DietrichGebert/ponytail/blob/main/benchmarks/results/2026-06-18-agentic.md) state limitations: one model, few repetitions and bounded checks. They do not promise savings or security in our kit. We did not measure token or cost savings from English names.

## Additional sources examined on October 7, 2026

| Primary source | Contribution and decision |
|---|---|
| [Impeccable](https://github.com/pbakaus/impeccable) | Challenges generic interfaces and reviews clarity/recovery. Own design-experience criteria, without engine/hooks or replacing task success/accessibility with a visual blacklist |
| [ECC](https://github.com/affaan-m/ECC/tree/main) | Overlaps agent/skill execution. Adopted research channels/limits, selective context and skill review; no vault, observer, universal TDD/coverage or automatic delegation. main/VERSION 2.2.3 reviewed, without installation or our own benchmark |
| [OpenAI skill evaluation](https://developers.openai.com/blog/eval-skills) | Structure and behavior assessed separately with positive/negative cases; available skill creator is a complement, not a kit dependency |
| [Anthropic skill-creator](https://github.com/anthropics/skills/tree/main/skills/skill-creator) | Result assessment and optional version comparison. Grader/comparator inform review; Claude-specific automation is not imported. No blind A/B comparison was executed |

Useful shared capabilities are repository instructions, selective skills, recoverable records and bounded delegation when available/authorized. Discovery filenames and permissions differ between clients; [SKILLS](process/SKILLS.md) distinguishes documented paths from actual observed execution. These consultations do not add another runtime or catalog to install.

## License and installation

Consulted licenses state MIT: [dzhng](https://github.com/dzhng/skills/blob/main/LICENSE), [BMad](https://github.com/bmad-code-org/BMAD-METHOD/blob/main/LICENSE), [BuilderOS](https://github.com/BuildGreatProducts/builder-os/blob/main/LICENSE.txt), [Humanizer](https://github.com/blader/humanizer/blob/main/LICENSE), [Superpowers](https://github.com/obra/superpowers/blob/main/LICENSE), [Ponytail](https://github.com/DietrichGebert/ponytail/blob/main/LICENSE). BMad also states trademark rights. Repository licensing does not replace checking components and attribution for actually reused content.

Future installation needs demonstrated need, trigger scope, license/version, available tools/hooks and coexistence testing. Do not overwrite AGENTS.md, import nonexistent commands or enable policies for all work for convenience. [CREDITS](CREDITS.md) distinguishes inspiration from redistribution; incorporated third-party material must be identified and accompanied by applicable notices.
