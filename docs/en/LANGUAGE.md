<!-- docs-nav:start -->
English · [Português (Brasil)](../pt-BR/LANGUAGE.md)

[Home](../../README.md) · [Documentation index](README.md)
<!-- docs-nav:end -->

# Technical names and deliverable language

## Kit reading language

`README.md` is the English entry; `README.pt-BR.md` is Portuguese. Both offer language selection. This is a documentation reading choice and does not change project configuration.

Reading documentation lives in docs/en/ and docs/pt-BR/, including guides, procedure catalogs and models for consultation. Each page offers language switching and navigation to pages in the same language. Reading references of guides/models are neither executable files nor project deliverables. Full skills have unique English sources.

templates/ contains single operational sources: full skills in English, guides/models in Portuguese. Each language's skills catalog explains selection and links to full SKILL.md without reproducing it. Reading the procedure explicitly opens its English source without changing deliverable language. Guide/model reading pages retain localized pairs under docs/. CONTRIBUTING.md and SECURITY.md have their only English versions at the root, with Portuguese versions in docs/pt-BR/. docs/catalog.json identifies pairs, sources and eleven skills; check-docs.ps1 verifies structure/hashes, not semantic equivalence.

## Project deliverable language

Folder/file names, skills, catalog IDs, JSON fields, parameters and states use English. Final content, headings and recommendations follow output_language, default pt-BR. For example, docs/product/work/add-registration/spec.md can contain a Portuguese specification.

```powershell
& ./scripts/init-project.ps1 -Destination ../my-product -Name 'Minha ideia' -Language pt-BR
& ./scripts/init-project.ps1 -Destination ../another-product -Name 'Another product' -Language en-US
```

Changing output_language in .kit/project.json guides new deliverables/revisions. It does not automatically translate existing files, sources or the library. template_language records pt-BR templates; naming_language remains en.

Before authoring, the assistant reads output_language, uses the model as structure and writes contextual content in that language, including necessary headings. Preserve paths, IDs, commands, APIs and originals/quotations when required by their source.

Helpers copy preparation without automatic translation. Brief/handoff are supporting records with Portuguese/English assistance; for other languages, the assistant adapts narrative before delivery. Technical state/fields stay English. Copying a template is not producing a localized final deliverable.

Changing language does not change artifact identity or path. A necessary rename updates consumers and records the reason. Do not translate historical copies as though they were the original.

English naming was chosen for consistency/interoperability. Token savings depend on the tokenizer and were not measured.
