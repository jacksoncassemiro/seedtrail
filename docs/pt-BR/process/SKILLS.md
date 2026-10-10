<!-- docs-nav:start -->
[English](../../en/process/SKILLS.md) · Português (Brasil)

[Início](../../../README.pt-BR.md) · [Índice da documentação](../README.md)
<!-- docs-nav:end -->

Referência de leitura; fonte operacional: `templates/.kit/SKILLS.md`. Esta página não é uma skill instalada nem uma entrega elaborada do projeto.

# Skills locais e portabilidade

Versão 0.1.0. Este projeto inclui **11 skills próprias**, com procedimentos locais e referências aos seus documentos. Não depende de skills pessoais. Precisa de um agente capaz de ler/escrever arquivos e das ferramentas pertinentes ao trabalho: acesso web para pesquisa online, runtime da stack para executar código, renderização quando houver revisão visual.

As disciplinas sob docs/product são destinos de contexto/entregas; skills são procedimentos. Uma skill pode consumir/atualizar várias pastas, e uma pasta pode ser revisada por várias skills. Nem todo documento precisa virar uma skill.

| Procedimento local | Quando usar | Entregas/pastas principais |
|---|---|---|
| [guide-product](../../../templates/.agents/skills/guide-product/SKILL.md) | Selecionar/retomar próxima ação e autoridade | context, WORKFLOWS, registro/handoff |
| [research-product](../../../templates/.agents/skills/research-product/SKILL.md) | Pesquisa, evidências, problema e hipóteses | research, definition, pendências/revisão |
| [assess-feasibility](../../../templates/.agents/skills/assess-feasibility/SKILL.md) | Valor, negócio, capacidade e MVP | definition, business, custo/roadmap |
| [design-experience](../../../templates/.agents/skills/design-experience/SKILL.md) | Jornadas, navegação, estados e protótipos | experience, spec/critério |
| [define-brand-design](../../../templates/.agents/skills/define-brand-design/SKILL.md) | Marca, voz, tokens/componentes | brand, consumidores UX/engenharia |
| [plan-engineering](../../../templates/.agents/skills/plan-engineering/SKILL.md) | Stack, arquitetura, dados, estrutura e operação | engineering, plan/handoff |
| [review-security](../../../templates/.agents/skills/review-security/SKILL.md) | Ameaças/revisão solicitada ou pertinente | engineering, quality, requisitos/tarefas |
| [deliver-slice](../../../templates/.agents/skills/deliver-slice/SKILL.md) | Planejar/implementar/verificar entrega autorizada | quality, delivery, docs afetados |
| [evolve-product](../../../templates/.agents/skills/evolve-product/SKILL.md) | Piloto, operação, crescimento e mudanças | operations, evolution, nova entrada |
| [challenge-assumptions](../../../templates/.agents/skills/challenge-assumptions/SKILL.md) | Confrontar decisão material e suas evidências | reviews e consumidores pertinentes |
| [maintain-knowledge](../../../templates/.agents/skills/maintain-knowledge/SKILL.md) | Auditar/consolidar conhecimento, origem e histórico | mapa, definições, consumidores e notas de entrega |

Os procedimentos são autoria local a partir dos modelos deste kit; não são releases oficiais de fornecedores externos. Especialistas pessoais/serviços podem ajudar, mas são opcionais; não copiar/adaptar uma skill sem preservar licença e referências quando seu conteúdo for reutilizado.

Não são onze agentes em execução nem um motor autônomo. Se o cliente descobre .agents/skills, podem ser selecionadas por descrição; caso contrário, pedir ao agente que leia o SKILL.md pertinente. Não carregar/executar todas para cada pedido. O resultado depende do trabalho, evidências e verificação — instalação só disponibiliza o procedimento.

Aplicar [organização](ORGANIZATION.md), [catálogo](CATALOG.md) e [ciclos](WORK_CYCLES.md): materialização pertinente, trabalho ativo explícito, precondições, consistência, TDD contextual e confronto final. Presença de arquivo não demonstra conteúdo suficiente. Scripts usam PowerShell 7.2+.

As definições completas de SKILL.md são únicas e escritas em inglês. Este catálogo explica seleção e entregas; links abrem o procedimento integral. Não duplicar instruções em páginas traduzidas nem instalar traduções como outras skills. O idioma da skill não muda output_language das entregas.

## Clientes de IA e descoberta

O núcleo é um conjunto de arquivos e procedimentos, não um executor universal. Documentação consultada em 07/10/2026; nesta avaliação foram usados leitura explícita no Codex e helpers locais. Isso não comprova descoberta nativa das skills de cada instância, nem execução em Claude/Gemini/outros clientes. Confirmar versão, permissões e arquivos efetivamente carregados no cliente escolhido.

| Ambiente | Instruções e skills | Uso no Seedtrail |
|---|---|---|
| [Codex](https://learn.chatgpt.com/docs/build-skills) | AGENTS.md e .agents/skills | Usar a descoberta documentada ou leitura explícita |
| [Claude Code](https://code.claude.com/docs/en/skills) | .claude/skills; [instruções](https://code.claude.com/docs/en/memory) em CLAUDE.md ou AGENTS.md nas condições de versão/configuração documentadas | Ler o procedimento existente; se necessário, um adaptador pequeno aponta à fonte, sem outra biblioteca editável |
| [Gemini CLI](https://geminicli.com/docs/cli/using-agent-skills/) | .gemini/skills ou .agents/skills; [context.fileName](https://geminicli.com/docs/cli/gemini-md/) permite escolher o arquivo de instruções | Configurar o cliente somente quando usado e conferir o carregamento |
| Chat genérico/outro assistente | Acesso local, execução e descoberta não são garantidos | Fornecer as fontes pertinentes e declarar ferramentas ausentes; não prometer execução local |

Uma skill fornece procedimento no contexto do assistente. Um **subagente** executa uma tarefa delegada em contexto próprio; pode ajudar em investigação independente e revisão extensa, quando disponível e autorizado. Não criar agentes por etapa ou por cargo. O mandato declara pergunta, fontes/base, skill pertinente, resultado, limite de escrita, condição de parada e responsável pela integração. Preferir leitores independentes e um escritor por fonte; separar checkouts quando houver edições sobrepostas.

Memória automática, plano temporário e resumo do chat são conveniências do cliente. Decisões, evidências e pendências necessárias à equipe permanecem nas fontes versionadas e no trabalho identificado. Retomar pelos arquivos atuais, confrontando divergências, sem copiar a transcrição inteira para outra memória.

Hooks, comandos nativos, checkpoints e adaptadores são opcionais, após necessidade concreta e teste no cliente. Permissões/sandbox continuam responsabilidade do host; modos guided/continuous não os substituem. MCPs, serviços e um novo runtime de agentes não são dependências. Avaliar o método por tarefas de consulta, retomada, alteração e colaboração com resultados e limites registrados; simulação por IA não comprova compreensão humana ou demanda.
