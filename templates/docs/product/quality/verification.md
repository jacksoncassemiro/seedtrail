# Plano e resultados de verificação

Status: não executado.

Conectar requisito/decisão → UX/contrato → tarefa → verificação → resultado → documento afetado. Escolher testes funcionais, contratos, acesso, persistência, falha/recuperação, visual/acessibilidade ou usabilidade conforme risco/escopo.

Separar análise documental, prova técnica, teste automatizado, inspeção manual e observação com pessoas. Sem usuários, revisão heurística e documentação podem avançar, mas não substituem evidência de usabilidade.

Registrar ambiente/versão, procedimento, esperado/observado, limites e decisão de aceite. Não marcar “passou” quando não executado. Não concluir implementação apenas porque compila.

Saída: evidência pertinente, falhas remanescentes e condições de disponibilização.

Em UI, consumir [revisão de design e acessibilidade](../experience/design-and-accessibility-review.md): critérios aplicáveis, percurso manual, verificações automatizadas e limites. Registrar separadamente planejado, inspecionado, testado e não testado, com versão/ambiente e evidência recuperável.

Em trabalho por ID, relacionar requisito/critério → tarefa/contrato → resultado/limite. Antes da execução, conferir conflitos e cobertura. Nos casos TDD pertinentes, guardar falha inicial pela causa prevista e aprovação; testes posteriores não demonstram TDD. No fechamento confrontar faltante, parcial, contraditório e adição sem requisito, com evidência e correção/decisão. Ver [ciclos](../../../.kit/WORK_CYCLES.md).
