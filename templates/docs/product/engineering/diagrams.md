# Diagramas que respondem perguntas

Status: guia; os exemplos abaixo são do processo, não arquitetura implementada de um produto.

| Pergunta | Representação adequada | Documento/consumidor |
|---|---|---|
| Quem usa e onde o sistema se relaciona com outros? | Contexto, referência C4 quando útil | Requisitos/arquitetura |
| Quais componentes guardam/processam informação? | Contêiner/componentes e fluxo | Arquitetura/plano |
| Como uma ação cruza partes e pode falhar? | Sequência, incluindo falha/reenvio relevante | Contratos/testes |
| Quais dados/relações/restrições existem? | Modelo conceitual/ER | Dados/migrações |
| Como pessoa navega e entende estados? | Jornada, fluxo/estados ou wireframe | UX/design/spec |
| Quais fronteiras e dados precisam de proteção? | Fluxo de dados com fronteiras de confiança | Segurança/revisão |
| Como disponibiliza e recupera? | Implantação/ambientes e recuperação | Infra/operação |
| Como tokens/componentes passam ao produto? | Mapa do design system e handoff | Design/engenharia/qualidade |

Cada diagrama informa pergunta, base/versão, legenda e hipóteses; usar nomes do domínio real quando elaborá-lo. Manter IDs/links pertinentes. Não gerar todos por obrigação; Mermaid ajuda na revisão de Markdown, mas não substitui inspeção de wireframes/interfaces quando essa é a pergunta.

## Conexão entre escolhas técnicas

```mermaid
flowchart LR
    R[Requisitos e capacidade] --> A[Arquitetura]
    R --> S[Riscos e acesso]
    A --> T[Tecnologias e dependências]
    S --> T
    T --> I[Hospedagem e operação]
    A --> C[Contratos e dados]
    C --> P[Plano e tarefas]
    T --> P
    S --> V[Verificações]
    P --> V
    I --> V
    V --> D[Decisões e documentação atualizadas]
```

## Conexão do sistema de design

```mermaid
flowchart LR
    E[Problema, público e evidências] --> B[Marca e voz]
    E --> U[UX e estados]
    B --> DS[Direção visual e tokens]
    U --> DS
    U --> SP[Spec e critérios de comportamento]
    DS --> CO[Componentes e interface]
    SP --> CO
    CO --> QA[Revisão funcional, visual e acessível]
    QA --> RE[Resultado e revisão das fontes]
```

Diagrama sem pergunta ou que apenas repete texto é dispensável. Diagramas desatualizados precisam ser revisados junto com o consumidor da decisão.
