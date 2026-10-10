# Revisão de design, usabilidade e acessibilidade

Procedimento local; não exige serviço externo ou skill pessoal. Aplicar à jornada/material atual. Sem interface nesta etapa, revisar fluxos e critérios; não registrar inspeção visual ou conformidade que ainda não foi possível verificar.

## Método e evidência

Identificar versão, objetivo, público/contexto, telas/estados e ambiente. Para UI existente, capturar ou inspecionar a representação renderizada antes de concluir sobre layout; revisar os passos de uma tarefa, não só uma imagem bonita. Registrar por achado: localização/estado, observado vs esperado, consequência para o usuário, princípio/critério, gravidade justificada, correção e forma de conferir. Evitar críticas cosméticas sem efeito demonstrado.

Na fatia representada, variar conteúdo e largura nos componentes com risco material: preenchimento, texto longo, ausência/quantidade, erro e indisponibilidade quando pertinentes. Identificar exemplos reais ou sintéticos e a combinação inspecionada. Comparar o comportamento com o contrato em DESIGN; declarar o que não foi representado ou verificado. Não exigir todas as combinações nem concluir responsividade a partir de uma largura fixa.

Referência de heurísticas: [NN/g](https://www.nngroup.com/articles/ten-usability-heuristics/). Confrontar feedback, linguagem compreensível, consistência, controle/recuperação, prevenção e tratamento de erros, reconhecimento, esforço e ajuda conforme o fluxo. Registrar qual princípio sustenta o achado. Isso é inspeção especializada, não observação de usuário nem teste de acessibilidade.

## Acessibilidade por etapa

Para interface web nova, usar WCAG 2.2 AA como alvo inicial revisável conforme contexto; documentar versão, nível e escopo. Não presumir obrigação legal universal. Selecionar critérios aplicáveis pelo [W3C Quick Reference](https://www.w3.org/WAI/WCAG22/quickref/); esta lista é uma amostra de riscos comuns, não cobertura completa.

| Momento | Critérios/exemplos pertinentes | Evidência possível |
|---|---|---|
| Fluxo/wireframe | Alternativa ao arrastar (2.5.7), prevenção/recuperação de erros, acesso/autenticação | Percurso e regra; implementação ainda não verificada |
| Direção visual | Contraste de texto (1.4.3), contraste de UI (1.4.11), tamanho de alvos (2.5.8) | Valores e medidas; verificar exceções do critério |
| Protótipo funcional/código | Teclado (2.1.1), ordem de foco (2.4.3), foco visível (2.4.7) e não obscurecido (2.4.11) | Percurso manual e captura da falha/resultado |
| UI funcional | Semântica/nome/estado (4.1.2), mensagens de status (4.1.3), reflow (1.4.10) | DOM, leitor de tela pertinente, zoom/viewport e execução |
| Formulários/autenticação | Rótulos (3.3.2), entrada redundante (3.3.7), autenticação acessível (3.3.8) | Tarefa real e alternativas oferecidas |

Inspeção e ferramentas automatizadas se complementam. Um scan sem alertas não comprova conformidade; imagens não demonstram teclado ou leitor de tela. Registrar não testado/não aplicável com razão. Critérios completos e processos completos precisam ser considerados em eventual avaliação de conformidade; não emitir certificado a partir desta amostra.

## Protótipo, MVP e entrega

- No esboço: entender organização, linguagem e ações; anotar hipóteses.
- No protótipo navegável: testar a tarefa e seus estados com o conteúdo disponível. Se não há pessoas, produzir protocolo futuro e revisão heurística; não atribuir resultado a participantes inexistentes.
- No MVP implementado: executar tarefas, acesso, recuperação, responsividade e checagens de acessibilidade aplicáveis. Registrar limites e falhas remanescentes para decisão do piloto.

Arquivos responsáveis: [fluxos](flows-and-prototype.md), [DESIGN](../brand/DESIGN.md), requisitos da fatia e [verificação](../quality/verification.md). Corrigir a causa e consumidores, sem criar nova especificação visual concorrente. Novas mudanças revisam apenas os riscos/estados afetados.
