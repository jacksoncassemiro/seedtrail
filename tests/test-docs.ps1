#Requires -Version 7.2
[CmdletBinding()]
param([string]$ReportPath)
$ErrorActionPreference='Stop'
$kit=[IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
$tempParent=[IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$fixture=[IO.Path]::GetFullPath((Join-Path $tempParent ('seedtrail-docs-'+[guid]::NewGuid().ToString('N'))))
$results=@()
function Run-Check([string[]]$Projects=@()){
    $arguments=@('-NoProfile','-File',(Join-Path $fixture 'kit/scripts/check-docs.ps1'),'-KitPath',(Join-Path $fixture 'kit'))
    if($Projects.Count){$arguments+=@('-Projects')+$Projects}
    $raw=& (Get-Process -Id $PID).Path @arguments 2>&1 | Out-String
    $code=$LASTEXITCODE
    if($code -notin @(0,1)){throw "Falha de execução: $raw"}
    $value=$raw | ConvertFrom-Json
    return @{code=$code;value=$value}
}
function Assert-Detected([string]$Name,[string]$Message,[string[]]$Projects=@()){
    $check=Run-Check $Projects
    if($check.code -ne 1 -or -not (@($check.value.errors) -match $Message)){throw "Fixture não detectada: $Name"}
    $script:results+=[pscustomobject]@{test=$Name;result='passed'}
}
try{
    New-Item -ItemType Directory -Path $fixture | Out-Null
    Copy-Item -LiteralPath $kit -Destination (Join-Path $fixture 'kit') -Recurse -Force
    $baseline=Run-Check
    if($baseline.code -ne 0){throw "Base inválida: $($baseline.value.errors -join ', ')"}
    $results+=[pscustomobject]@{test='Base distribuída passa antes das mutações';result='passed'}
    $cycles=Join-Path $fixture 'kit/docs/en/process/WORK_CYCLES.md'
    $cyclesBytes=[IO.File]::ReadAllBytes($cycles)
    Add-Content -LiteralPath $cycles -Value 'Example evidence: docs/product/work/inspect-registration/research.md' -Encoding utf8
    $descriptive=Run-Check
    if($descriptive.code -ne 0){throw 'ID descritivo em exemplo do método foi rejeitado'}
    $results+=[pscustomobject]@{test='ID descritivo em exemplo resolve modelo do trabalho';result='passed'}
    Add-Content -LiteralPath $cycles -Value 'Invalid artifact: docs/product/work/inspect-registration/missing-artifact.md' -Encoding utf8
    Assert-Detected 'Artefato inexistente em exemplo continua detectado' 'Destino citado sem arquivo/modelo'
    [IO.File]::WriteAllBytes($cycles,$cyclesBytes)
    $english=Join-Path $fixture 'kit/docs/en/KNOWLEDGE.md'
    $original=[IO.File]::ReadAllBytes($english)
    Add-Content -LiteralPath $english -Value '[Broken fixture](missing-fixture.md)' -Encoding utf8
    Assert-Detected 'Link quebrado é detectado' 'Link ausente'
    [IO.File]::WriteAllBytes($english,$original)
    Add-Content -LiteralPath $english -Value '[Wrong-language fixture](../pt-BR/KNOWLEDGE.md)' -Encoding utf8
    Assert-Detected 'Mudança de idioma fora do seletor é detectada' 'Troca de idioma fora'
    [IO.File]::WriteAllBytes($english,$original)
    $portuguese=Join-Path $fixture 'kit/docs/pt-BR/process/INSTRUCTIONS.md'
    $originalPt=[IO.File]::ReadAllBytes($portuguese)
    Add-Content -LiteralPath $portuguese -Value 'Divergência introduzida só na cópia de leitura.' -Encoding utf8
    Assert-Detected 'Cópia portuguesa divergente é detectada' 'diverge da fonte'
    [IO.File]::WriteAllBytes($portuguese,$originalPt)
    $operational=Join-Path $fixture 'kit/templates/.kit/INSTRUCTIONS.md'
    $sourceBytes=[IO.File]::ReadAllBytes($operational)
    Add-Content -LiteralPath $operational -Value 'Fixture obsoleta: execution.stage' -Encoding utf8
    Assert-Detected 'Nome antigo em arquivo oculto é detectado' 'Nome/campo antigo'
    Assert-Detected 'Fonte alterada exige revisar referência' 'Fonte mudou'
    [IO.File]::WriteAllBytes($operational,$sourceBytes)
    $project=Join-Path $fixture 'project'
    New-Item -ItemType Directory -Path (Join-Path $project '.kit') | Out-Null
    '{"current_phase":"discovery","active_work":"docs/product/work/WRK-missing"}' | Set-Content -LiteralPath (Join-Path $project '.kit/project.json') -Encoding utf8
    '{"artifacts":[]}' | Set-Content -LiteralPath (Join-Path $project '.kit/catalog.json') -Encoding utf8
    Assert-Detected 'Trabalho selecionado ausente no JSON é detectado' 'Referência JSON ausente' @($project)
    '{"current_phase":"discovery","active_work":null}' | Set-Content -LiteralPath (Join-Path $project '.kit/project.json') -Encoding utf8
    New-Item -ItemType Directory -Path (Join-Path $project '.kit/templates/work') -Force | Out-Null
    'A model is not an authored result.' | Set-Content -LiteralPath (Join-Path $project '.kit/templates/work/research.md') -Encoding utf8
    New-Item -ItemType Directory -Path (Join-Path $project 'docs/product') -Force | Out-Null
    'Current source: docs/product/work/missing-change/research.md' | Set-Content -LiteralPath (Join-Path $project 'docs/product/README.md') -Encoding utf8
    Assert-Detected 'Referência real ausente não é substituída por modelo' 'Destino citado sem arquivo/modelo' @($project)
    'Current product map.' | Set-Content -LiteralPath (Join-Path $project 'docs/product/README.md') -Encoding utf8
    $archiveRelative='docs/product/sources/original.md'
    $archivePath=Join-Path $project $archiveRelative
    New-Item -ItemType Directory -Path (Split-Path -Parent $archivePath) -Force | Out-Null
    'Historical execution.stage [old reference](removed-original.md)' | Set-Content -LiteralPath $archivePath -Encoding utf8
    $archiveBytes=[IO.File]::ReadAllBytes($archivePath)
    $archiveConfig=[ordered]@{current_phase='discovery';active_work=$null;historical_sources=@($archiveRelative);historical_source_hashes=@{$archiveRelative=(Get-FileHash -LiteralPath $archivePath).Hash}}
    $archiveConfig | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath (Join-Path $project '.kit/project.json') -Encoding utf8
    $archived=Run-Check @($project)
    if($archived.code -ne 0 -or $archived.value.historical_sources_checked -ne 1){throw 'Fonte histórica preservada foi tratada como instrução vigente'}
    $results+=[pscustomobject]@{test='Fonte histórica declarada e íntegra preserva nomes/links de época';result='passed'}
    Add-Content -LiteralPath $archivePath -Value 'Changed source.' -Encoding utf8
    Assert-Detected 'Alteração de fonte histórica é detectada' 'Hash de fonte histórica' @($project)
    [IO.File]::WriteAllBytes($archivePath,$archiveBytes)
    Add-Content -LiteralPath (Join-Path $project 'docs/product/README.md') -Value '[Missing current link](missing-current.md)' -Encoding utf8
    Assert-Detected 'Arquivo histórico não dispensa conferir documentos atuais' 'Link ausente' @($project)
    'Current product map.' | Set-Content -LiteralPath (Join-Path $project 'docs/product/README.md') -Encoding utf8
    $archiveConfig.historical_sources=@('docs/product/README.md')
    $archiveConfig | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath (Join-Path $project '.kit/project.json') -Encoding utf8
    Assert-Detected 'Documento atual não pode ser ocultado como fonte histórica' 'Fonte histórica fora' @($project)
    'Fixture de cópia redundante' | Set-Content -LiteralPath (Join-Path $fixture 'kit/CREDITS.md') -Encoding utf8
    Assert-Detected 'Atalho documental redundante na raiz é detectado' 'Destino documental redundante'
    Remove-Item -LiteralPath (Join-Path $fixture 'kit/CREDITS.md') -Force
    $report=[ordered]@{status='passed';tests=$results;limit='Fixtures exercitam detecção estrutural; não verificam semântica de traduções ou produto.'}
}catch{
    $report=[ordered]@{status='failed';tests=$results;error=$_.Exception.Message}
}finally{
    if($ReportPath){$report | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $ReportPath -Encoding utf8}
    $report | ConvertTo-Json -Depth 8
    $resolved=[IO.Path]::GetFullPath($fixture)
    if($resolved -ne $fixture -or -not $resolved.StartsWith($tempParent.TrimEnd('\','/')+[IO.Path]::DirectorySeparatorChar,[StringComparison]::OrdinalIgnoreCase)){throw 'Limpeza fora do temporário recusada.'}
    if(Test-Path -LiteralPath $resolved){Remove-Item -LiteralPath $resolved -Recurse -Force}
}
if($report.status -ne 'passed'){exit 1}
