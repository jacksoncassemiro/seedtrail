<!-- docs-nav:start -->
English · [Português (Brasil)](../pt-BR/PLUGIN.md)

[Home](../../README.md) · [Documentation index](README.md)
<!-- docs-nav:end -->

# Plugin distribution

Seedtrail has two distribution modes. The local kit continues to work without a plugin; the plugin makes its eleven procedures selectable in a compatible assistant. Installing a procedure does not execute an autonomous workflow.

## Source and build

The only authored skill sources remain under templates/.agents/skills. [The builder](../../scripts/build-plugin.py) generates portable skill copies, rebases bundled links and adds host-context guidance. [The manifest](../../plugin/plugin.json) describes the listing and release. [The icon](../../assets/seedtrail-icon.png) is shared with [the website](../../website/index.html).

Run Python 3.9+ from any directory, choosing an output directory outside this repository:

```text
python scripts/build-plugin.py --output ../seedtrail-distribution
```

The output contains a self-contained seedtrail folder and versioned ZIP. It includes the MIT library and notices, not Git history, customer instances, credentials or a hosted MCP service. The script checks skill metadata, contained references, listing lengths, PNG dimensions and ZIP integrity. Local helpers need PowerShell 7.2+ only when used.

## Public website and plugin review

Website source lives in website/. GitHub Pages publishes that directory through the dedicated workflow when its source or the workflow changes on main. [The website](https://jacksoncassemiro.github.io/seedtrail/) documents both modes, support, privacy and terms.

The plugin is free, with no payments, donations, accounts or telemetry of its own. Jackson Cassemiro is the intended publisher; support: jacksoncassemiro@outlook.com.br. Country targeting has no restrictions. Host and connected-service policies still apply to conversations, files and tools.

Public directory status: package prepared; not yet submitted, approved or published. The developer must select the intended organization/project, verify the publishing identity, resolve package scans and complete policy attestations. [Official submission instructions](https://developers.openai.com/plugins/deploy/submission). Skills-only distribution needs no MCP review cases or demo recording.

## Verification and limits

The original helper suite and documentation checks passed on Windows/PowerShell 7.6.5 during preparation. Portable skill references and the generated archive were checked. Native installation/discovery and behavioral evaluation of the installed plugin are still unverified. Structural checks do not prove product decisions, market demand or security coverage. Source/icon changes do not change the kit's instance version automatically.
