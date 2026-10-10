<!-- docs-nav:start -->
[English](../../CONTRIBUTING.md) · Português (Brasil)

[Início](../../README.pt-BR.md) · [Índice da documentação](README.md)
<!-- docs-nav:end -->

# Contribuição

Comece pelo README, [arquitetura](ARCHITECTURE.md) e [créditos](CREDITS.md). Descreva problema demonstrado, cenário de uso, alternativas e efeito esperado. Prefira mudança proporcional; novas etapas/arquivos precisam de consumidor real. Evite adicionar questionário inteiro, runtime, serviço externo ou agente por popularidade.

README.md é a entrada em inglês; README.pt-BR.md é a versão em português. A documentação detalhada fica em docs/en/ e docs/pt-BR/. Manter comportamento, limites, comandos e links equivalentes nos pares. Cada página deve preservar o idioma durante a navegação e oferecer um link explícito à tradução. Não alterar output_language por causa do idioma escolhido para ler o manual.

templates/ é a fonte operacional única dos procedimentos e modelos. As cópias de guias/modelos em docs/<idioma>/process e templates servem só para leitura. Skills têm uma única definição completa em inglês; o catálogo traduzido só resume seleção/entregas e aponta à fonte. CONTRIBUTING/SECURITY ingleses ficam na raiz; não duplicá-los em docs/en. Créditos e changelog ficam em docs por idioma. Ao modificar guia/modelo operacional, atualizar sua referência em português e a tradução em inglês; ao mudar skill, atualizar a fonte inglesa e o catálogo pertinente. Registrar o hash em docs/catalog.json e executar scripts/check-docs.ps1. Não registrar as traduções como skills ou artefatos adicionais. O catálogo deve incluir novas páginas e seus pares; outras traduções seguem o mesmo padrão.

Ao alterar script, executar tests/test-kit.ps1 em PowerShell 7.2+ e examinar a evidência. Ao alterar skill/modelo, verificar seleção, links, proporcionalidade e comportamento em uma entrega delimitada. Testes estruturais não comprovam a qualidade de decisões de produto. Preservar texto de licença, origem de terceiros e adaptações das instâncias.

Registrar mudança de comportamento/versão em CHANGELOG.md. Atualização de uma instância é separada da atualização do kit: comparar bases e dados reais, sem sobrescrever decisões ou pesquisa. PR deve explicar problema, comportamento resultante, verificações e limites. Contribuições destinadas ao framework seguem sua licença MIT; material de terceiros precisa de origem/permissão compatível declaradas.

Antes de disponibilizar o pacote: conferir conteúdo genérico, links internos, licença/créditos, versão e verificações. Arquivos de uma instância, referências de cliente, relatórios privados e segredos não fazem parte da distribuição. Este repositório não publica nem contrata serviços automaticamente.

Após alterar documentação, executar também tests/test-docs.ps1: fixtures negativas verificam se links quebrados, navegação errada, nomes antigos, divergência da fonte e referências JSON ausentes são detectados. Isso não verifica qualidade semântica de tradução.
