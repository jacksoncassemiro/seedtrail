<!-- docs-nav:start -->
English · [Português (Brasil)](docs/pt-BR/CONTRIBUTING.md)

[Home](README.md) · [Documentation index](docs/en/README.md)
<!-- docs-nav:end -->

# Contributing

Start with the README, [architecture](docs/en/ARCHITECTURE.md) and [credits](docs/en/CREDITS.md). Describe a demonstrated problem, usage scenario, alternatives and expected effect. Keep changes proportional: new stages/files need actual consumers. Avoid adding entire questionnaires, runtimes, external services or agents because of popularity.

README.md is the English entry; README.pt-BR.md is Portuguese. Detailed documentation lives in docs/en/ and docs/pt-BR/. Keep behavior, limits, commands and links equivalent across pairs. Each page must preserve language during navigation and offer an explicit translation link. Reading language does not change output_language.

templates/ is the single operational source of procedures and models. Full SKILL.md files remain unique English sources; localized catalogs summarize selection and link to them. Guides/model references under docs/<language>/process and templates are for reading only. When an operational guide/model changes, update its Portuguese reference and English translation. Register source hashes, including skills, in docs/catalog.json and run scripts/check-docs.ps1. Do not register translations as additional skills or artifacts. The catalog must include new pages and pairs; further translations follow the same pattern.

After script changes, run tests/test-kit.ps1 with PowerShell 7.2+ and examine the evidence. After skill/template changes, check selection, links, proportionality and behavior on a bounded delivery. Structural tests do not prove product decision quality. Preserve license text, third-party provenance and instance adaptations.

Record behavior/version changes in CHANGELOG.md. Updating an instance is separate from updating the kit: compare bases and actual data without overwriting decisions or research. PRs should explain the problem, resulting behavior, verification and limits. Framework contributions follow MIT; third-party material needs declared compatible provenance/permission.

Before distributing a package, check generic content, internal links, license/credits, version and verification. Instance files, client references, private reports and secrets are outside the distribution. This repository does not automatically publish or purchase services.

After documentation changes, also run tests/test-docs.ps1: negative fixtures verify detection of broken links, wrong language navigation, obsolete names, source divergence and missing JSON references. This does not test translation semantics.
