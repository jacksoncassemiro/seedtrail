<!-- docs-nav:start -->
[English](../../../en/templates/engineering/constraints-and-quality.md) · Português (Brasil)

[Início](../../../../README.pt-BR.md) · [Índice da documentação](../../README.md)
<!-- docs-nav:end -->

Referência de leitura; fonte operacional: `templates/docs/product/engineering/constraints-and-quality.md`. Esta página não é uma skill instalada nem uma entrega elaborada do projeto.

# Requisitos de qualidade e restrições

Status: investigação técnica; sem metas numéricas inventadas.

Antes de escolher stack, levantar resultado funcional, dados/audiências, plataforma, necessidade offline/tempo real, volume provável, desempenho, disponibilidade, integridade, acessibilidade, privacidade/retenção e recuperação relevantes.

Levantar capacidade, experiência, orçamento, prazo, ferramentas já disponíveis e custo de operação. Distinguir requisito real de preferência tecnológica. Estimativas de carga precisam de premissas e intervalo.

Saída: restrições priorizadas, qualidades observáveis, hipóteses a investigar e critérios que orientarão arquitetura/tecnologias/estrutura/testes.

Para qualidade decisiva, usar cenário concreto: origem/ator, evento, ambiente/condição, parte afetada, resposta esperada e medida/limite com fundamento. Exemplo sem meta inventada: perda de acesso de um membro durante uma consulta deve impedir exposição de conteúdo restrito na resposta e nos consumidores pertinentes. Relacionar cenário à decisão/contrato e teste/prova; números desconhecidos continuam pendentes. Não exigir vistas/ADRs que não respondem uma dúvida da fatia.
