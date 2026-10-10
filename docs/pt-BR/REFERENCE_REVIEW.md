<!-- docs-nav:start -->
[English](../en/REFERENCE_REVIEW.md) · Português (Brasil)

[Início](../../README.pt-BR.md) · [Índice da documentação](README.md)
<!-- docs-nav:end -->

# Avaliação das referências de agentes

Consulta documental em 06/10/2026, nas branches main. Não é benchmark próprio nem teste de instalação dos fornecedores. A decisão abaixo é nossa avaliação de adequação: manter um condutor local e aproveitar práticas que resolvam lacunas concretas. Os seis projetos não foram instalados ou redistribuídos no Seedtrail.

| Projeto e fonte primária | O que oferece | Aplicação e conflito possível |
|---|---|---|
| [dzhng/skills](https://github.com/dzhng/skills) | Skills de exploração, spec por fatias, implementação, testes, revisão, handoff e escolhas do agente. [audit-choices](https://github.com/dzhng/skills/tree/main/skills/engineering/audit-choices) explicita decisões que o implementador introduziu; [auto-research](https://github.com/dzhng/skills/tree/main/skills/engineering/auto-research) usa avaliação mensurável. | Aproveitados revisão de escolhas e baseline quando houver otimização. Não adotar delegação/push automático, nem substituir revisão de código por um ledger. Experimento técnico não valida mercado. |
| [BMad Method](https://github.com/bmad-code-org/BMAD-METHOD) | Método amplo, perspectivas especializadas e contexto persistente. O [guia de planejamento](https://docs.bmad-method.org/plan/choose-a-planning-path/) escolhe ferramentas pela intenção e incerteza, com profundidade maior para coordenação/risco. | Aproveitado dimensionamento do procedimento em guide-product. Usar o sistema inteiro seria outro condutor e outra organização de artefatos. Nossa revisão não demonstrou que o local seja superior; adoção futura como alternativa exige prova separada. |
| [BuilderOS](https://github.com/BuildGreatProducts/builder-os) | Skills independentes ligam ideia, plano, design, código e lançamento por documentos. [Build Loop Codex](https://github.com/BuildGreatProducts/builder-os/blob/main/skills/build-loop-codex/SKILL.md) revisa, testa e corrige incrementos. | Passagem entre documentos, tokens e revisão da experiência já cabe nas skills locais. Não incorporar outro roadmap canônico ou execução integral por checkbox. Comandos de review dependem do host; repetir toda a suíte e pedir confirmação de escopo sempre seria inadequado para algumas entregas. |
| [Humanizer](https://github.com/blader/humanizer) | Revisão de prosa, com verificação das afirmações; preserva fatos e partes estruturadas dos arquivos. | Acrescentada conferência editorial em METHODS, sem outra skill redundante. Clareza é o objetivo; não inventar histórias, opiniões, entrevistas ou dados para parecer humano. Reescrever o estilo não comprova veracidade. |
| [Superpowers](https://github.com/obra/superpowers) | Processo de engenharia com brainstorming, planos, TDD, revisão e execução. [systematic-debugging](https://github.com/obra/superpowers/tree/main/skills/systematic-debugging) investiga causa e testa hipóteses. | Aproveitado diagnóstico em METHODS/deliver-slice. TDD e verificação já existem no local. Não adotar o bootstrap inteiro: aprovação reiterada, políticas universais, agentes por tarefa ou exclusão de código sem teste podem conflitar com escopo, contexto e autonomia autorizada. |
| [Ponytail](https://github.com/DietrichGebert/ponytail) | O [procedimento](https://github.com/DietrichGebert/ponytail/blob/main/skills/ponytail/SKILL.md) reduz complexidade e favorece reutilização; há regras persistentes e níveis de intensidade. | Aproveitada comparação de soluções simples por adequação e manutenção. Não ativar globalmente: a preferência por menos arquivos, pouco texto e poucos testes pode empobrecer explicações, rastreabilidade ou cobertura. Preservar requisitos, segurança, legibilidade e acessibilidade. |

## O que mudou no fluxo

Os procedimentos próprios em [METHODS](process/METHODS.md), [guide-product](../../templates/.agents/skills/guide-product/SKILL.md) e [deliver-slice](../../templates/.agents/skills/deliver-slice/SKILL.md) agora explicitam profundidade proporcional, diagnóstico, escolhas do assistente, simplificação, avaliação com baseline e conferência editorial. São escritos para o nosso contrato, sem copiar os prompts completos ou montar seis frameworks sobrepostos. A revisão de continuidade acrescentou maintain-knowledge ao catálogo; quantidade de skills não mede cobertura.

| Quando aplicar | Procedimento responsável | Resultado concreto |
|---|---|---|
| Pedido pequeno ou entrada numa etapa posterior | guide-product | Alcance e artefatos suficientes, sem reiniciar todas as fases |
| Bug reproduzível ou verificação que falha | deliver-slice + diagnóstico de METHODS | Causa sustentada por experimento e correção verificada |
| Assistente escolheu comportamento/tecnologia material | Revisão de escolhas de METHODS | Escolha, motivo, consequência e necessidade de decisão do usuário |
| Otimização com resultado mensurável | Avaliação com baseline de METHODS | Comparação antes/depois e limites; não uma alegação de economia |
| Documento ou resposta pronta para entregar | Conferência editorial de METHODS | Texto claro que preserva fatos, fontes e incertezas |
| Soluções de complexidades diferentes | Simplificação de METHODS | Alternativa suficiente, com custo de manutenção e requisitos preservados |

Estrelas ajudam a encontrar candidatos; não medem adequação, segurança, qualidade ou demanda. Não há regra de ativar essas práticas todas em cada tarefa. Instalar os seis pacotes faria conviver condutores, memórias, aprovações e convenções que se sobrepõem; o ganho precisa justificar esse custo. Preferimos adaptar uma prática demonstrável no procedimento responsável. Se a adaptação não produzir uma decisão ou verificação útil, deve ser retirada.

Os [benchmarks publicados pelo Ponytail](https://github.com/DietrichGebert/ponytail/blob/main/benchmarks/results/2026-06-18-agentic.md) têm limitações declaradas: um modelo, poucas repetições e verificações delimitadas. Não são promessa de economia ou segurança no nosso kit. Não medimos economia de tokens ou custo por traduzir nomes para inglês.

## Complementos examinados em 07/10/2026

| Fonte primária | Contribuição e decisão |
|---|---|
| [Impeccable](https://github.com/pbakaus/impeccable) | Ajuda a confrontar interfaces genéricas e revisar clareza/recuperação. Critérios próprios em design-experience, sem importar engine/hooks nem substituir tarefa/acessibilidade por blacklist visual |
| [ECC](https://github.com/affaan-m/ECC/tree/main) | Sobrepõe execução de agentes/skills. Aproveitados canais/limites de pesquisa, contexto seletivo e revisão de skills; não importar vault, observer, regras universais de TDD/cobertura ou delegação automática. Avaliação de main/VERSION 2.2.3, sem instalação/benchmark próprio |
| [OpenAI: avaliação de skills](https://developers.openai.com/blog/eval-skills) | Estrutura e comportamento examinados separadamente, com casos positivos/controle negativo; skill-creator disponível como complemento, não dependência do kit |
| [Anthropic skill-creator](https://github.com/anthropics/skills/tree/main/skills/skill-creator) | Oferece avaliação de resultados e comparação opcional de versões. Grader/comparator são referências; automação específica de Claude não é importada. Comparação cega A/B não foi executada |

Recursos comuns úteis são instruções do repositório, skills seletivas, registros recuperáveis e delegação delimitada quando disponível/autorizada. Descoberta/nomes de arquivos e permissões diferem entre clientes; [SKILLS](process/SKILLS.md) distingue caminhos documentados da execução efetivamente observada. Não há mais um runtime ou catálogo a instalar por estas consultas.

## Licença e instalação

As licenças consultadas declaram MIT: [dzhng](https://github.com/dzhng/skills/blob/main/LICENSE), [BMad](https://github.com/bmad-code-org/BMAD-METHOD/blob/main/LICENSE), [BuilderOS](https://github.com/BuildGreatProducts/builder-os/blob/main/LICENSE.txt), [Humanizer](https://github.com/blader/humanizer/blob/main/LICENSE), [Superpowers](https://github.com/obra/superpowers/blob/main/LICENSE), [Ponytail](https://github.com/DietrichGebert/ponytail/blob/main/LICENSE). BMad também declara direitos de marca. Licença do repositório não dispensa conferir componentes e atribuição do conteúdo efetivamente reutilizado.

Uma instalação futura exige necessidade demonstrada, escopo do gatilho, licença/versão, ferramentas/hook disponíveis e teste de coexistência. Não sobrescrever AGENTS.md, importar comandos inexistentes ou ativar políticas para todo trabalho por conveniência. [CREDITS](CREDITS.md) distingue inspiração de redistribuição; material incorporado de terceiros deverá ser identificado e acompanhado dos avisos aplicáveis.
