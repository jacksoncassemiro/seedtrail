<!-- docs-nav:start -->
[English](../en/KIT_REVIEW.md) · Português (Brasil)

[Início](../../README.pt-BR.md) · [Índice da documentação](README.md)
<!-- docs-nav:end -->

# Seedtrail 0.1.0: revisão e limites

Seedtrail é um experimento pessoal independente desenvolvido com o Codex. Combina descoberta proporcional, conhecimento vigente e mudanças delimitadas com evidências. Não substitui pesquisa com usuários, executa automaticamente um assistente nem estabelece aprovação por documentos gerados.

## Verificações realizadas

- Quatro subagentes especialistas examinaram clareza, referências, continuidade e consulta independente. Foram revisões de IA, não observações de uma equipe humana.
- Testes dos helpers em Windows/PowerShell 7.6.5: **39 passaram**. Cobrem inicialização enxuta, geração sob demanda, colisão de ID, limites de escopo/rodadas, pausa/retomada, gravação obsoleta, integridade e independência da instância copiada.
- Fixtures documentais: **15 passaram**. Cobrem links quebrados, referências obsoletas, idioma/fonte, JSON consumido e importação histórica explícita. O checker verifica estrutura, não suficiência semântica.
- Um cenário delimitado de reservas Node/SQLite planejou o MVP antes de código, implementou três operações, alterou ocupação e preservou versões examinadas. As provas distinguem execução local de web/autenticação/inventário apenas planejados. Não comprovam utilidade comercial ou todas as etapas/métodos.
- Exercícios sintéticos de reuso, consulta e integração orientaram a organização atual. Fixtures Git locais ou um assistente recuperar a fonte não comprovam colaboração humana, hospedagem CI ou descoberta nativa em todos os clientes.

Os exercícios comparativos com outros frameworks foram exploratórios, com cenários sintéticos e participantes de IA. As conclusões dependem da configuração e do cenário exercitado; não são avaliação independente, ranking geral nem evidência de superioridade do Seedtrail. Não demonstram compatibilidade ou cobertura completa do ciclo de produto.

## Achados incorporados

Uma página vigente de funcionalidade concentra comportamento, regras de negócio, aceite e desenho pertinente, com história curta. Mudanças referenciam essa fonte e guardam diferença, execução e provas. Trabalho encerrado não é reaberto para outra implementação. É possível planejar várias funcionalidades antes de implementar; o recorte acompanha o produto sem taxonomia obrigatória.

Helpers recusam ID repetido, mas não detectam duplicidade semântica entre nomes diferentes. Fechamento verifica bytes examinados e preserva fontes externas mutáveis. Editar uma fonte registrada exige nova revisão real antes de concluir; não atualizar hashes para fingir que a revisão anterior ainda vale.

Inicialização enxuta deixa o registro auxiliar de autoridade sob demanda. Usá-lo quando mapa/fonte forem insuficientes, como ao importar legado. Fontes históricas exigem caminhos de arquivos explícitos sob docs/product/sources e SHA256 conferido; instruções antigas são dados, não comandos vigentes.

Procedimentos de design tratam estados úteis, acessibilidade, conteúdo/larguras, implementação do contrato visual e crítica seletiva. Livros e agentes de terceiros não são redistribuídos. Heurística ou checklist não estabelece conformidade WCAG sem verificar a interface real.

## Cobertura e continuidade

Onze [procedimentos](process/SKILLS.md) cobrem orientação, pesquisa, premissas, viabilidade, UX, marca/design, engenharia, segurança, entrega, evolução e manutenção do conhecimento. Especialistas entram quando escopo/tecnologia justificarem. Mais agentes ou arquivos não comprovam melhor cobertura.

[Métodos](process/METHODS.md), [organização do conhecimento](KNOWLEDGE.md) e [documentação de funcionalidades](FEATURE_DOCUMENTATION.md) distinguem práticas adotadas de escolhas locais de arquivos/schema. SDD, TDD contextual, ADR, Docs as Code e vistas seletivas de arquitetura atendem perguntas distintas; nenhuma referência define sozinha todo o Seedtrail.

A triagem do nome não encontrou concorrente direto de software nos resultados retornados. Não é confirmação de marca/domínio disponível. Fontes, inspirações e limites de reutilização ficam nos [créditos](CREDITS.md).

## Limites restantes

Não houve estudo com participantes reais, validação de investimento, deploy de produção, certificação formal de segurança ou matriz de execução entre plataformas. Descoberta nativa pelo Codex CLI não foi demonstrada no ensaio restrito; Linux requer PowerShell para os helpers. Autoria concorrente real, compreensão humana e manutenção prolongada ainda precisam de avaliação direta.

Preservar fontes únicas e conclusões verificadas. Instâncias descartáveis e logs brutos de auditorias preliminares ficam fora da distribuição reutilizável; testes reproduzíveis do framework permanecem em tests. Mudanças do método atualizam instruções afetadas, traduções, hashes do catálogo e testes antes de distribuir.
