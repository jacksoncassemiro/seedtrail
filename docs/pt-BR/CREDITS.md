<!-- docs-nav:start -->
[English](../en/CREDITS.md) · Português (Brasil)

[Início](../../README.pt-BR.md) · [Índice da documentação](README.md)
<!-- docs-nav:end -->

# Origem, créditos e escopo da licença

Este é um projeto independente: scripts, modelos e onze procedimentos locais foram elaborados para este kit, com apoio de assistentes de IA. Não foi criado por fork/clonagem de um upstream. Não representa versão oficial ou endosso de GitHub, DeepSeek, Anthropic, OpenAI ou dos autores referenciados.

## Referências aproveitadas

| Fonte | Contribuição conceitual | Material redistribuído neste kit |
|---|---|---|
| [Spec Kit](https://github.com/github/spec-kit) | SDD, divisão por mudança, precondições, consistência e convergência | Não contém CLI, scripts ou templates upstream |
| [Contrarian](https://github.com/aaddrick/contrarian) e [Idea Validator](https://github.com/averychernin/idea-validator) | Confronto de premissas, demanda, execução e distribuição | Não contém seus agentes/bundles |
| [DeepSeek Harness](https://github.com/deepseek-ai/deepseek-harness) | Distinção entre objetivo, memória, rodadas e executor | Não contém runtime/plugins DeepSeek |
| [Ralph de Geoffrey Huntley](https://ghuntley.com/ralph/) e [snarktank/ralph](https://github.com/snarktank/ralph) | Passos pequenos, estado em arquivos e feedback iterativo | Não contém ralph.sh, prompts ou skills upstream |
| [Ralph Loop Anthropic](https://github.com/anthropics/claude-plugins-official/tree/main/plugins/ralph-loop) | Comparação de continuidade na mesma sessão | Não contém hooks Claude Code |
| [TDD](https://martinfowler.com/bliki/TestDrivenDevelopment.html), [Manifesto Ágil](https://agilemanifesto.org/iso/ptbr/manifesto.html) e [Gherkin](https://cucumber.io/docs/gherkin/reference/) | Métodos e critérios observáveis | Roteiros próprios; não reproduz textos integrais desses autores |
| [dzhng/skills](https://github.com/dzhng/skills), [BMad](https://github.com/bmad-code-org/BMAD-METHOD) e [BuilderOS](https://github.com/BuildGreatProducts/builder-os) | Revisão das escolhas do assistente, profundidade proporcional e passagem entre entregas | Não contém seus SKILL.md, agentes ou instaladores |
| [Superpowers](https://github.com/obra/superpowers) | Diagnóstico técnico antes de corrigir | Roteiro próprio; não inclui seus prompts, hooks ou ferramentas |
| [Humanizer](https://github.com/blader/humanizer) e [Ponytail](https://github.com/DietrichGebert/ponytail) | Preservação factual na escrita e simplificação com critérios | Não contém seus prompts, regras persistentes ou benchmarks |
| [Anthropic knowledge-work-plugins](https://github.com/anthropics/knowledge-work-plugins) e [OpenAI skills](https://github.com/openai/skills) | Referências de procedimentos e especialistas opcionais utilizados no ambiente de trabalho | O kit não redistribui as cópias/adaptações pessoais instaladas no ambiente do criador |

Outras referências efetivamente usadas — design, arquitetura, segurança e mudanças — estão em [referências](process/REFERENCES.md) e [métodos](process/METHODS.md), com contribuição e limite. Referência conceitual não transfere licença do fornecedor ao nosso projeto nem faz de nosso roteiro uma execução formal de seu método.

## Licença e futuras incorporações

Os arquivos autorais do framework usam [MIT](../../LICENSE): permite uso, alteração e distribuição, inclusive comercial, preservando avisos de licença/copyright. O texto padrão da licença é mantido em inglês; a documentação de leitura tem versões em inglês e português. A atribuição coletiva não determina a divisão de direitos entre futuros colaboradores; autores/titulares e contribuições devem permanecer identificáveis na manutenção do repositório.

Esta licença cobre o kit, não os dados, fontes externas, marcas nem o produto elaborado em uma instância. Uma instância recebe cópia da licença do framework em .kit/LICENSE, sem impor MIT ao produto inteiro. Créditos não substituem permissão para redistribuir material de terceiros.

Antes de incorporar código, template, prompt, imagem ou texto de outro projeto: registrar origem, versão/commit, licença, trecho/arquivos incorporados, alterações e avisos que precisam acompanhar a distribuição. Se não houver permissão suficiente, manter apenas referência ou escrever implementação própria. Um fork futuro deve identificar upstream, base e diferenças. Não reatribuir cópias de terceiros como autoria do kit.

## Revisão realizada e limite

Na preparação 0.1.0 foram inspecionados os onze SKILL.md, modelos e helpers locais e suas declarações de origem. Não foi identificado pacote upstream copiado/redistribuído ou conteúdo sem origem declarada nesta inspeção. Foram preservadas as referências existentes e acrescentadas as de ciclos/métodos. Esta é uma revisão do material incluído, sem comparação exaustiva com todos os textos públicos; não é prova absoluta de ausência de similaridade ou determinação jurídica de autoria.

Orientação primária: [GitHub sobre licença de repositórios](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository), [MIT](https://choosealicense.com/licenses/mit/). Publicar repositório e conceder direitos de reutilização são decisões relacionadas, mas distintas; publicar somente o pacote genérico, sem dados de projetos/credenciais.

Para continuidade, também foram usadas as distinções conceituais de [OpenSpec](https://github.com/Fission-AI/OpenSpec/blob/main/docs/overview.md) (vigente e mudanças), [ADRs](https://adr.github.io/) (razões e substituições), [arc42](https://arc42.org/overview/) (vistas pertinentes) e [Diátaxis](https://diataxis.fr/) (necessidades de leitores). Não foram incorporados seus templates, textos ou executores; a adaptação e seus limites estão em [conhecimento e evolução](KNOWLEDGE.md).

Para histórico/notas de entrega, [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) e [Towncrier](https://towncrier.readthedocs.io/en/stable/tutorial.html) foram referências conceituais. Sem templates, comandos ou runtime incorporados.

Para organização, a decomposição seletiva/recursiva do [arc42](https://docs.arc42.org/section-5/) e as abstrações técnicas do [C4](https://c4model.com/abstractions) foram referências conceituais. A cobertura de auditoria/consolidação também confrontou [contexto do BMad](https://docs.bmad-method.org/existing-codebases/set-and-maintain-project-context/) e [write-docs do dzhng](https://github.com/dzhng/skills/blob/main/skills/engineering/write-docs/SKILL.md). Sem reprodução de templates ou procedimentos desses autores; decisões próprias e limites estão na revisão de cobertura.

Pesquisa e leitura humana: [Docs as Code](https://www.writethedocs.org/guide/docs-as-code/) orienta arquivos revisáveis/versionáveis; [Diátaxis](https://diataxis.fr/) distingue necessidades de leitores, sem exigir quatro pastas vazias. O [Duplo Diamante](https://www.designcouncil.org.uk/resources/the-double-diamond/) separa exploração/convergência, com contato com pessoas e teste; pesquisa documental não equivale a isso. O [cognitive walkthrough](https://www.nngroup.com/articles/cognitive-walkthroughs/) inspirou a inspeção por tarefas/personas hipotéticas, sem participantes observados. Adaptações e limites em métodos/guia; sem cópia de textos, diagramas ou templates.

Para a leitura compartilhada por pessoas/IA, [AGENTS.md](https://agents.md/), [práticas do Kiro](https://kiro.dev/docs/specs/best-practices/), [rules do Cursor](https://cursor.com/docs/rules) e [Memory Bank do Cline](https://docs.cline.bot/best-practices/memory-bank) foram referências conceituais. Sem copiar seus textos, instruções ou executores; a documentação por funcionalidade explica contribuição e limites dessa adaptação.
