<!-- docs-nav:start -->
[English](../../en/process/METHODS.md) · Português (Brasil)

[Início](../../../README.pt-BR.md) · [Índice da documentação](../README.md)
<!-- docs-nav:end -->

Referência de leitura; fonte operacional: `templates/.kit/METHODS.md`. Esta página não é uma skill instalada nem uma entrega elaborada do projeto.

# Padrões leves de artefatos e mudança

## Fonte responsável e versão

Cada entrega relevante identifica pergunta, estado, origem/versão, responsável, resultado, desconhecidos e consumidores afetados em sua fonte ou no mapa responsável. Criar docs/product/context/artifact-register.md somente se autoridade/origem/consumidores ainda estiverem ambíguos, como numa importação legada. Não duplicar um mapa suficiente nem criar registro vazio por obrigação. Usar IDs estáveis quando ajudam a relação; não exigir metadados longos em toda nota.

Idioma do texto vem de .kit/project.json. Preservar caminhos/keys do tooling quando exigidos. Não usar título “definitivo” como prova de aprovação.

## Padrões selecionados

| Padrão | Quando usar | Aplicação no kit |
|---|---|---|
| TDD contextual | Regras/contratos determinísticos e correções com risco relevante | Falha pela causa prevista → implementação mínima → aprovação → refatoração; guardar evidência. Justificar alternativa pertinente; pesquisa/documento simples não exige testes de código |
| Princípios ágeis | Organizar entrega e aprendizado | Incrementos pequenos, prioridade por valor/risco, capacidade limitada e revisão do rumo; Scrum não é obrigatório |
| SDD | Especificar mudanças de software antes de implementar | Resultado → spec → plano → tarefas → código/verificação, com contratos locais proporcionais |
| Cenários de comportamento, referência BDD | Evitar critérios vagos | Dado contexto, quando ação/evento, então resultado observável. Markdown não é teste executável sem harness |
| ADR | Decisão técnica com consequências relevantes | Contexto, alternativas, decisão/status, consequência e condição de revisão; registrar substituições |
| C4 | Explicar contexto e componentes de software | Usar nível de contexto/contêiner e componentes quando necessário; Mermaid é representação, não validação formal de C4 |
| Tokens de design | Manter identidade aplicada consistentemente | Nome semântico, valor, uso e versão; conferir tradução em código e revisão visual |
| Proposta de alteração com impacto | Funcionalidade/correção/regra nova | Baseline → diferença → impacto → critérios → implementação/verificação → atualização do vigente |
| Registro de evidência/experimento | Descoberta/negócio/UX | Fonte, contexto, limite, hipótese, teste e decisão; não confundir opinião com resultado |
| Segurança e gestão de dependências | Acesso/dados/infraestrutura/código relevantes | Riscos e controles, origem/versão das dependências e verificação; sem presumir auditoria completa |

Referências primárias: [SDD](https://github.github.io/spec-kit/quickstart.html), [Gherkin](https://cucumber.io/docs/gherkin/reference/), [ADRs](https://adr.github.io/), [C4](https://c4model.com/), [Design Tokens](https://www.designtokens.org/).

São complementos seletivos, não um pacote de frameworks obrigatório. SDD organiza engenharia; não cobre por si só pesquisa, marca ou aquisição. BDD não se resume à sintaxe, e um ADR não substitui spec.

## Design e revisão

Brief → fluxos/estados → alternativas/protótipo → direção visual/tokens → implementação → revisão renderizada. Avaliar conteúdo real, acessibilidade, comportamento responsivo e estados relevantes. Uma imagem aprovada não é funcionalidade pronta; tokens não descrevem todo o comportamento.

## Critérios de passagem

Uma entrega pode ficar pronta para pesquisa, discussão, protótipo, especificação ou execução, conforme escopo. Registrar o que foi observado vs proposto e o que impede o próximo passo. Não usar uma lista marcada como prova de funcionamento.

Para nova funcionalidade, manter conhecimento vigente e histórico de mudanças distintos; finalizar significa conferir o resultado do alcance declarado e atualizar documentos afetados, sem duplicar specs ativas. Definição documental pode encerrar sem código; implementação exige verificar comportamento na base técnica pertinente. Nenhuma dessas conclusões demonstra disponibilidade fora do ambiente examinado.

Antes de derivar plano para uma regra ambígua, usar exemplos que diferenciem interpretações: reserva 09:00–10:00 e outra 10:00–11:00 compartilham limite, mas não intervalo; 09:30–10:30 conflita. Registrar regra, exemplos decisivos e perguntas ainda abertas na fonte responsável. [Example Mapping](https://cucumber.io/docs/bdd/example-mapping/) inspira essa descoberta, sem exigir cartões, sintaxe Gherkin, arquivo extra ou alegar colaboração humana quando só há inspeção por IA.

Conferir suficiência pela pergunta do próximo consumidor, além de existência de arquivo: engenharia encontra base/contrato/dependência disponível? QA consegue derivar resultado esperado e casos relevantes? O leitor encontra definição, disponibilidade e próxima decisão sem reconstruir todos os históricos? Escolher perguntas pertinentes à entrega e registrar lacunas na verificação/convergência existente; corrigir a fonte responsável. [Diátaxis](https://diataxis.fr/quality/) orienta necessidades e qualidade de consulta, sem impor cópias por público. Inspeção por IA não comprova compreensão por pessoas reais.

Revisar docs/product/context/open-questions.md antes da próxima entrega e no fechamento. Questão aberta não se fecha por geração de texto; registrar evidência/decisão ou motivo do adiamento. Usar evidence-review.md quando dados determinam uma decisão ou entram em conflito.

## Atualização de versões e substituições

Atualização não sobrescreve adaptações de projeto. Comparar base anterior, estado local e modelo novo quando disponíveis; preservar decisões/evidências e registrar conflitos. Conferir consumidores de arquivo/regra substituída: índices, skills, AGENTS.md, handoff, especificações e verificações pertinentes. Manter uma fonte vigente, identificando histórico e substituto. Registrar resultado e pendências em docs/product/evolution/decisions-and-changes.md antes de atualizar kit_version; igualdade de versão não implica identidade de conteúdo. Sem base anterior, declarar limite da comparação. Não há sincronização/migrador automático.

Organização vigente: [organização](ORGANIZATION.md), [catálogo](CATALOG.md) e [ciclos](WORK_CYCLES.md). Fundamentos, biblioteca e trabalhos por ID têm papéis distintos. Antes de implementar, revisar cobertura e conflitos; depois, conferir resultado contra intenção. Referências: [TDD](https://martinfowler.com/bliki/TestDrivenDevelopment.html), [princípios ágeis](https://agilemanifesto.org/iso/ptbr/principles.html).

## Diagnóstico, escolhas e simplificação

Em falha técnica, registrar esperado/observado, reprodução e ambiente. Examinar mudanças relevantes e localizar onde o fluxo se desvia. Formular uma hipótese com evidência e executar o menor experimento que diferencie causas; se falhar, atualizar a hipótese, sem acumular correções especulativas. Corrigir a causa demonstrada e verificar reprodução/regressão pertinentes. Uma mitigação urgente pode preceder a causa completa: declarar alcance e manter a investigação aberta. Não expor segredos na instrumentação.

Na convergência, identificar escolhas materiais introduzidas pelo assistente: escopo, dados, armazenamento, dependências, contratos, permissões ou custos. Registrar fundamento, consequência, caráter reversível e autoridade. Escolha delegada não é aprovação pessoal do usuário; escolha conflitante exige correção ou resolução explícita. Essa revisão complementa inspeção e testes, sem substituí-los.

Antes de criar abstração, arquivo ou dependência, verificar necessidade atual e soluções já disponíveis no código/plataforma. Preferir a alternativa de menor custo de manutenção que atenda os critérios. Não medir qualidade pela contagem de linhas, suprimir requisitos explícitos, legibilidade, acessibilidade ou proteção contra perda de dados. Reutilização também exige conferir adequação e licença.

Quando o trabalho for otimizar um resultado mensurável, definir baseline, métrica, conjunto de avaliação e limite antes das rodadas. Comparar sob condições equivalentes e guardar tentativas úteis; passar um teste de correção não demonstra melhoria. Pesquisa de mercado sem experimento não recebe uma métrica de sucesso inventada.

## Revisão das entregas escritas

Antes de entregar ou atualizar documentos, conferir se estados, datas, nomes, versões, caminhos e links correspondem ao resultado real. Remover resíduos de conversa e conclusões repetidas que não acrescentam informação. Explicar decisão, evidência, consequência e lacuna de modo concreto. Edição de estilo preserva fatos, citações, IDs, código, schema e força da afirmação; não converter hipótese em evidência ou recomendação em aprovação. Dados ausentes permanecem desconhecidos. Aplicar somente ao documento pertinente, sem outro relatório obrigatório.

Inspirações seletivas, com procedimentos escritos para este kit: [BMad, profundidade por intenção](https://docs.bmad-method.org/plan/choose-a-planning-path/), [dzhng, auditoria de escolhas](https://github.com/dzhng/skills/tree/main/skills/engineering/audit-choices), [Superpowers, diagnóstico](https://github.com/obra/superpowers/tree/main/skills/systematic-debugging), [Humanizer](https://github.com/blader/humanizer) e [Ponytail](https://github.com/DietrichGebert/ponytail). Não carregam hooks, agentes ou regras persistentes desses projetos.

## Referências existentes e escolhas próprias

Não existe um padrão universal para todas as pastas, documentos e formas de execução deste kit. A organização física, schema JSON, identificação de trabalhos, critérios e helpers são contratos locais. Não alegar conformidade ISO, Scrum, C4, arc42 ou outro framework integral pela presença de Markdown/diagramas.

| Referência primária | Prática aproveitada | Limite da adoção |
|---|---|---|
| [Docs as Code](https://www.writethedocs.org/guide/docs-as-code/) | Documentação versionável, revisão junto da mudança e verificações pertinentes | Git/PR/CI dependem do projeto; editar arquivos não instala governança automaticamente |
| [Diátaxis](https://diataxis.fr/) | Documentar conforme necessidade: aprender, fazer, consultar ou compreender | Orienta guia para leitores; não obriga quatro pastas nem é modelo para pesquisa/negócio/branding |
| [OpenSpec](https://github.com/Fission-AI/OpenSpec/blob/main/docs/concepts.md) e [Spec Kit](https://github.github.io/spec-kit/reference/core.html) | Distinguir regra vigente, mudança, especificação e execução verificável | Não importar organização/comandos completos nem afirmar sincronização automática |
| [ADR](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions.html) | Preservar motivos e substituições de decisões relevantes | Não duplicar decisão já identificada nem exigir um arquivo por escolha trivial |
| [arc42](https://docs.arc42.org/section-5/) e [C4](https://c4model.com/abstractions) | Vistas pertinentes e decomposição técnica seletiva | Não definir por eles a árvore de capacidades de produto ou de marca |
| [Design Council](https://www.designcouncil.org.uk/resources/the-double-diamond/) | Explorar problema/alternativas e revisar a aposta | Descoberta não é checklist linear nem pesquisa pública equivale a uso observado |

Referências consultadas em 06/10/2026. Nossa escolha combina endereços por assunto, entrada por pergunta e trabalhos por mudança. É uma adaptação avaliada, não um padrão formal já validado para este utilitário. Se o projeto tem boas fontes próprias, linkar e manter sua autoridade em vez de criar espelhos para encaixá-las no kit.

## Vocabulário para consulta e execução

Preferir termos reconhecíveis e explicar seu papel. [Spec Kit](https://github.github.io/spec-kit/reference/core.html), [OpenSpec](https://github.com/Fission-AI/OpenSpec/blob/main/docs/concepts.md) e [BuilderOS](https://github.com/BuildGreatProducts/builder-os) usam vocabulário parcialmente comum com layouts e responsabilidades diferentes. Isso não estabelece um padrão único de mercado.

| Termo | Significado neste kit | Onde aparece, conforme necessidade |
|---|---|---|
| Visão do produto / product vision | Propósito, público candidato, resultado e restrições; hipóteses têm estado explícito | Contexto e definição de problema/valor |
| Requisito / requirement | Comportamento ou qualidade exigidos, com critério verificável | Definição vigente e spec da mudança |
| Funcionalidade / feature | Comportamento/resultado oferecido pela solução; capacidade pode ser sinônimo conforme domínio | Fonte atual e capítulo de consulta; não é ID de trabalho |
| Especificação / specification, spec | Contrato de comportamento/requisitos; a spec da mudança descreve a diferença em relação à base | Fonte atual responsável e/ou spec delimitada; não é manual nem plano técnico completo |
| PRD / Product Requirements Document | Visão organizada de requisitos de produto quando coordenação justificar | Pode reunir seções ou apontar às fontes existentes. Não gerar PRD adicional que duplique tudo |
| Mudança / change | Alteração delimitada que pode afetar uma ou várias funcionalidades | Trabalho identificado, com origem/base/resultado |
| Tarefa / task | Passo verificável para executar uma mudança | Tarefas do trabalho, não uma pasta/spec por arquivo |
| Desenho técnico / technical design | Como realizar requisitos, com alternativas, contratos e razões | Plano/arquitetura. DESIGN.md em brand é contrato visual, não desenho técnico |
| ADR / Architecture Decision Record | Decisão arquitetural relevante, contexto, alternativas e consequências | Decisão responsável ou ADR existente; não duplicar a mesma decisão |
| Base / baseline | Versão recuperável usada para avaliar a mudança | Commit/tag ou snapshot pertinente; nome/data sozinhos podem ser insuficientes |
| Roadmap | Prioridades/resultados previstos e dependências no horizonte necessário | Planejamento de entregas; tarefas de uma mudança têm sua fonte própria |
| Guia/manual, referência e histórico | Uso/consulta atual, contratos e origem/resultados passados têm perguntas distintas | Mapa aponta ao conteúdo responsável conforme leitor |

“Trabalho” é o contêiner amplo para uma mudança, pesquisa ou decisão; não é uma nova entidade obrigatória do produto. WRK é prefixo opcional de exemplos antigos, sem status de padrão. Preferir novos IDs descritivos estáveis (como document-item-removal), mantendo históricos existentes. Não impor epic/story/module como níveis: a equipe pode usá-los quando coordenação exigir, sem duplicar o backlog. Não renomear arquivos apenas para imitar outro framework.

BuilderOS reúne visão, PRD e roadmap e liga skills pelos documentos; Spec Kit agrupa spec/plano/tarefas por feature; OpenSpec distingue specs atuais e mudanças. Aproveitamos essas responsabilidades, sem instalar executores nem importar uma taxonomia rígida. Para o Seedtrail, a pergunta/leitor e a autoridade do conteúdo decidem a separação física.
