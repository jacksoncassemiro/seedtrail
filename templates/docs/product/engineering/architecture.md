# Arquitetura de software

Status: a elaborar; não representa implementação.

Entradas: requisitos da aposta, restrições, UX e decisões. Se serviço não exigir software, marcar não aplicável com razão.

Comparar solução simples e alternativas justificadas: fronteiras de componentes, responsabilidades, dados, fluxo de informação, contratos, acesso, falhas/reenvio, consistência e operação. Não impor microserviços, filas, cache ou escalabilidade distribuída por padrão.

Produzir diagrama Mermaid, modelo conceitual de dados, contratos essenciais e decisões com problema, alternativas, recomendação, consequência e condição de revisão. Explicar ao fundador por que essas escolhas atendem ao comportamento.

Saída: desenho proporcional ao estado declarado do produto, riscos/pendências, provas técnicas necessárias e referências para planos das mudanças. Separar proposta, decisão e implementação observada. Manter o desenho atual quando funcionalidades, dados, contratos ou operação evoluírem; o plano de uma mudança registra a abordagem/diferença e aponta à arquitetura responsável. Não restringir esta fonte à primeira entrega nem copiar cada plano histórico.

Aplicar [confronto técnico por cenários](decisions-and-technical-review.md) antes de consolidar decisões significativas. Considerar também a opção escolhida pelo usuário e a alternativa mais simples; registrar decisões e seus consumidores, sem equiparar desenho documental a comportamento verificado.
