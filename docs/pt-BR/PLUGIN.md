<!-- docs-nav:start -->
[English](../en/PLUGIN.md) · Português (Brasil)

[Início](../../README.pt-BR.md) · [Índice da documentação](README.md)
<!-- docs-nav:end -->

# Distribuição como plugin

Seedtrail tem duas formas de distribuição. O kit local continua funcionando sem plugin; o plugin torna seus onze procedimentos selecionáveis em um assistente compatível. Instalar um procedimento não executa um fluxo autônomo.

## Fonte e empacotamento

As únicas fontes autorais de skills continuam em templates/.agents/skills. [O empacotador](../../scripts/build-plugin.py) gera cópias portáteis, ajusta links internos e acrescenta orientação para o contexto do host. [O manifesto](../../plugin/plugin.json) descreve listagem e versão. [O ícone](../../assets/seedtrail-icon.png) é compartilhado com [o site](../../website/index.html).

Execute Python 3.9+ de qualquer pasta, escolhendo um destino fora deste repositório:

```text
python scripts/build-plugin.py --output ../seedtrail-distribution
```

O resultado contém a pasta seedtrail autossuficiente e um ZIP versionado. Inclui biblioteca MIT e avisos, sem histórico Git, instâncias de clientes, credenciais ou serviço MCP hospedado. O script verifica metadados das skills, referências contidas, limites da listagem, dimensões PNG e integridade do ZIP. Helpers locais exigem PowerShell 7.2+ somente quando utilizados.

## Site público e revisão do plugin

A fonte do site fica em website/. GitHub Pages publica essa pasta pelo workflow dedicado quando sua fonte ou o workflow muda em main. [O site](https://jacksoncassemiro.github.io/seedtrail/) documenta as duas formas, suporte, privacidade e termos.

O plugin é gratuito, sem pagamentos, doações, contas ou telemetria próprios. Jackson Cassemiro é o responsável pretendido; suporte: jacksoncassemiro@outlook.com.br. A seleção de países não tem restrições. As políticas do host e dos serviços conectados continuam aplicáveis a conversas, arquivos e ferramentas.

Estado no diretório público: pacote preparado; ainda não submetido, aprovado ou publicado. O desenvolvedor precisa selecionar a organização/projeto pretendido, verificar sua identidade, resolver os scans e concluir as declarações de política. [Instruções oficiais de submissão](https://developers.openai.com/plugins/deploy/submission). Distribuição só de skills não precisa de casos de revisão MCP nem vídeo de demonstração.

## Verificação e limites

A suíte original de helpers e os checks documentais passaram em Windows/PowerShell 7.6.5 durante a preparação. As referências portáteis e o arquivo gerado foram conferidos. Instalação/descoberta nativa e avaliação comportamental do plugin instalado ainda não foram observadas. Checks estruturais não comprovam decisões de produto, demanda de mercado ou cobertura de segurança. Mudanças da distribuição/ícone não alteram automaticamente a versão das instâncias do kit.
