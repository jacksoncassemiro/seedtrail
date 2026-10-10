<!-- docs-nav:start -->
[English](../../../en/templates/engineering/structure-and-development.md) · Português (Brasil)

[Início](../../../../README.pt-BR.md) · [Índice da documentação](../../README.md)
<!-- docs-nav:end -->

Referência de leitura; fonte operacional: `templates/docs/product/engineering/structure-and-development.md`. Esta página não é uma skill instalada nem uma entrega elaborada do projeto.

# Estrutura do projeto e trabalho de engenharia

Status: a elaborar depois de delimitar a aposta e stack.

Definir repositório(s), módulos/responsabilidades, organização de documentação/código/testes, convenções de configuração e dependências, ambientes local/teste/publicação e caminho de execução verificável.

Definir configuração/segredos sem guardar credenciais no guia; estratégia de migrations/dados quando aplicável; revisão de alterações, integração contínua, versionamento/release e atualização dos documentos. Não criar ferramentas/processos sem justificativa.

Explicar a diferença entre arquitetura (responsabilidades/contratos), pastas (organização do código) e gestão (ordem/pessoas/capacidade). Árvore de diretórios não comprova boa arquitetura.

## Colaboração e método já existente

Inspecionar e respeitar convenções da equipe antes de propor mudanças. [Scrum](https://scrumguides.org/scrum-guide.html) organiza responsabilidades/eventos de gestão; [Kanban](https://kanbanguides.org/) orienta fluxo. Não são estratégias de branches. [GitHub Flow](https://docs.github.com/en/get-started/using-github/github-flow), [Gitflow](https://nvie.com/posts/a-successful-git-branching-model/) e práticas de [trunk](https://dora.dev/capabilities/trunk-based-development/) tratam de integração/entrega com compromissos distintos; não impor uma delas pelo nome do projeto.

Quando pertinente à engenharia, recuperar cadência/versões suportadas, responsáveis concorrentes, revisão, CI, releases e isolamento de execução. Mesmo nome de branch em clones distintos não significa arquivos físicos compartilhados; push e integração ainda podem conflitar. [Worktrees](https://git-scm.com/docs/git-worktree) oferecem checkouts separados e normalmente branches distintas. Separar branches/checkouts reduz sobreposição, mas não elimina decisões incompatíveis ou conflitos ao integrar documentos/código. Evitar edições simultâneas da mesma fonte responsável; definir revisão e integração.

Declarar a topologia de cada teste: sessão/checkout compartilhado, worktrees, clones ou máquinas diferentes. active_work é seleção da instância, não distribuição de tarefas por pessoa; se versionado, pode ser propagado pelo Git. Trava/hash dos helpers protege somente gravações cooperantes locais, não merge distribuído nem edições manuais. Não criar branches, agentes ou processos novos sem necessidade/autorização.

Saída: estrutura concreta, guia de desenvolvimento, decisões e integração com o plan da fatia. Não gerar código nesta etapa apenas para preencher o modelo.

Confrontar organização frontend/backend, contratos e CI/CD conforme [decisões e revisão técnica](decisions-and-technical-review.md). Documentar caminho de mudança até entrega, verificações pertinentes, ambientes/permissões e recuperação; evidência de pipeline executado só existe com execução real.

## Processo e desenvolvimento locais

O kit pode conduzir planejamento e execução no repositório local, com assistente e ferramentas disponíveis: edição, análise de código, build, testes, previews/protótipos e provas técnicas delimitadas. Isso não exige hospedagem pública ou CI remoto. Nem o kit nem seus modelos são um runtime que executa tudo sozinho; tarefas são executadas pelo assistente/ferramentas no escopo autorizado, com comandos e resultados registrados.

Inspecionar ambiente, runtimes e dependências existentes antes de recomendar instalação. Definir comandos reproduzíveis de preparação, inicialização, verificação e encerramento pertinentes. Containers são uma opção, não exigência. Usar dados de teste apropriados, configuração local e exemplos sem segredos. Documentar limitações de mocks/serviços substitutos.

Uma prova/protótipo local pode ocorrer antes de uma stack definitiva se responder a uma incerteza específica. Para implementação do produto, usar tarefa, critérios e decisões suficientes àquela mudança; não exigir conclusão de todo o planejamento futuro. Distinguir proposta, execução e resultado verificado.

Separar três escolhas: onde o assistente trabalha, onde o desenvolvimento/testes rodam e onde o produto será usado. Desenvolver localmente não decide hospedagem final; um produto local/offline também é alternativa quando atende ao contexto, sem presumir que sirva a todo cenário de colaboração.

Registrar o que foi demonstrado localmente e o que depende de ambiente integrado/produção. Testes locais não comprovam deploy, capacidade de escala, integrações reais ou operação em produção. Custos, privacidade, dados e serviços externos continuam pertinentes mesmo que o código rode localmente.
