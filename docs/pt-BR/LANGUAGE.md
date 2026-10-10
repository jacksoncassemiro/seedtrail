<!-- docs-nav:start -->
[English](../en/LANGUAGE.md) · Português (Brasil)

[Início](../../README.pt-BR.md) · [Índice da documentação](README.md)
<!-- docs-nav:end -->

# Nomes técnicos e idioma das entregas

## Idioma de leitura do kit

`README.md` é a entrada em inglês; `README.pt-BR.md` oferece leitura em português. Ambos incluem links para alternar idioma. Essa escolha é de leitura da documentação e não modifica a configuração do projeto.

A documentação de leitura fica em docs/en/ e docs/pt-BR/, incluindo guias, catálogo de procedimentos e modelos para consulta. Cada página oferece troca de idioma e navegação para páginas do mesmo idioma. As cópias de leitura de skills e modelos não são arquivos executáveis nem entregas de projeto.

templates/ guarda fontes operacionais únicas: skills completas em inglês; guias e modelos em português. O catálogo de skills em cada idioma explica quando usar e liga ao SKILL.md integral, sem reproduzi-lo. A leitura desse procedimento muda explicitamente para sua fonte inglesa; não muda o idioma das entregas. Guias e modelos de leitura mantêm pares localizados em docs/. CONTRIBUTING.md e SECURITY.md têm sua única versão inglesa na raiz, com versões portuguesas em docs/pt-BR/. docs/catalog.json identifica pares, fontes e as onze skills; check-docs.ps1 verifica estrutura/hash, não equivalência semântica.

## Idioma das entregas do projeto

Nomes de pastas/arquivos, skills, IDs de catálogo, campos JSON, parâmetros e estados usam inglês. Conteúdo, títulos e recomendações finais seguem output_language, padrão pt-BR. Exemplo: docs/product/work/add-registration/spec.md contém uma especificação escrita em português.

```powershell
& ./scripts/init-project.ps1 -Destination ../my-product -Name 'Minha ideia' -Language pt-BR
& ./scripts/init-project.ps1 -Destination ../another-product -Name 'Another product' -Language en-US
```

Na instância, alterar output_language em .kit/project.json orienta novas entregas/revisões. Não traduz automaticamente arquivos existentes, fontes ou biblioteca. template_language registra modelos em pt-BR; naming_language permanece en.

Antes de elaborar a entrega, o assistente lê output_language, usa o modelo como estrutura e escreve o conteúdo contextualizado nesse idioma, incluindo títulos necessários. Preservar caminhos, IDs, comandos, APIs e originais/citações quando exigido pela fonte.

Helpers copiam preparação, sem tradução automática. Brief/handoff são registros auxiliares com apoio em português/inglês; para outros idiomas, o assistente adapta a narrativa antes de entregar. Estado/campos técnicos permanecem em inglês. Não confundir cópia de modelo com entrega final localizada.

Mudar idioma não muda identidade ou caminho de artefatos. Renomeação necessária atualiza consumidores e registra motivo. Não traduzir cópias históricas como se fossem o original.

O padrão inglês foi escolhido por consistência/interoperabilidade. Economia de tokens depende do tokenizador e não foi medida.
