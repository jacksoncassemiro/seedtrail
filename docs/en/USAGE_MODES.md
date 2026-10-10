<!-- docs-nav:start -->
English · [Português (Brasil)](../pt-BR/USAGE_MODES.md)

[Home](../../README.md) · [Documentation index](README.md)
<!-- docs-nav:end -->

# Local kit, Spec Kit and runtime

Method comparison dated October 6, 2026. Local 0.1.0 is independent and is the selected workflow. Spec Kit and its community composition were evaluation references; this distribution does not install them. This table is not execution history or an instruction to retain two kits.

| Aspect | Local kit | Spec Kit and evaluated composition |
|---|---|---|
| Guidance | Eleven original procedures selected by the question | Core and component commands/contracts |
| Discovery through evolution | Templates and progressive information gathering | Assessment/SDD/bugs; Forge and complements expand stages |
| Organization | On-demand foundations, library and docs/product/work/ID | Feature artifacts and integration-managed resources |
| Consistency/completion | Review procedures and presence/state/hash helpers | analyze and converge have dedicated commands/templates |
| Extensibility | Edit procedures; no plugin API | Extensions, presets and workflows |
| Installation/updates | Initializer and manual comparison of bases | CLI, integrations and upgrade procedures |
| Dependencies | PowerShell helpers; manual file-based use | Python/uv CLI and component tools |
| Responsibility | Maintain our schema, scripts, skills and tests | Manage core/component versions and compatibility |
| Current evidence | Helper tests on Windows | Documentary reference; comparative effectiveness not demonstrated |

Sources: [official documentation](https://github.github.io/spec-kit/), [core](https://github.github.io/spec-kit/reference/core.html), [convergence](https://github.com/github/spec-kit/blob/main/templates/commands/converge.md), and this distribution's scripts/procedures.

The local kit allows adapting questions, language and depth without an additional CLI. Its disadvantage is owning installation, updates and behavior maintenance. It lacks Spec Kit's integration/extension ecosystem and command experience. Overlap in SDD, analysis and convergence is conceptual, with original implementation; it does not imply operational equivalence or better decisions.

Using only the local kit is supported. Before further framework investment, apply it to a real question: assess document usefulness, detected inconsistencies and resumption. Future comparisons should use the same question and base. Popularity and installation do not demonstrate superiority.

## PowerShell or Python

PowerShell 7 supports [installation on Windows, Linux and macOS](https://learn.microsoft.com/en-us/powershell/scripting/install/install-powershell). Linux therefore does not require another implementation, but needs PowerShell installed if absent. Our helpers have only been tested on Windows.

There is no second Python engine. Duplicating state and materialization would duplicate fixes and tests without demonstrated need. A Python wrapper that calls PowerShell would retain that dependency.

If environments without PowerShell become a requirement, compare migrating the single engine to Python with adapters around a shared implementation. Require equivalent tests for preservation, links, limits, evidence and completion. Without helpers, manual editing can follow the method and contracts; do not claim automatic safeguards were executed.

[Use and reuse scenarios](USE_CASES.md) cover a complete journey, independent entries and cross-cutting resources; examples are hypothetical, not execution of every stage.
