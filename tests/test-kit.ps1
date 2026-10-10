#Requires -Version 7.2
[CmdletBinding()]
param([Alias('Report')][string]$ReportPath)
$ErrorActionPreference='Stop'
$taskKit=[IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
$taskTempParent=[IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$taskTemp=[IO.Path]::GetFullPath((Join-Path $taskTempParent ('seedtrail-'+[guid]::NewGuid().ToString('N'))))
if (-not $taskTemp.StartsWith($taskTempParent.TrimEnd('\','/')+[IO.Path]::DirectorySeparatorChar,[StringComparison]::OrdinalIgnoreCase)) { throw 'Pasta de teste fora do temporário.' }
New-Item -ItemType Directory -Path $taskTemp | Out-Null
$taskRunner=Join-Path $taskTemp 'runner.ps1'
@'
param([string]$Pedido)
$ErrorActionPreference='Stop'
$r=Get-Content -LiteralPath $Pedido -Raw -Encoding utf8 | ConvertFrom-Json -AsHashtable
try { $global:LASTEXITCODE=0; & $r.script @($r.parameters); exit $LASTEXITCODE } catch { Write-Error $_ -ErrorAction Continue; exit 1 }
'@ | Set-Content -LiteralPath $taskRunner -Encoding utf8
# Splat do hashtable requer variável, não expressão.
(Get-Content -LiteralPath $taskRunner -Raw).Replace('& $r.script @($r.parameters)',' $p=$r.parameters; & $r.script @p') | Set-Content -LiteralPath $taskRunner -Encoding utf8
$taskResults=@();$taskCall=0
function Invoke-Helper([string]$Script,[hashtable]$Params,[int]$Expected=0) {
    $script:taskCall++
    $request=Join-Path $taskTemp "pedido-$taskCall.json"
    @{script=$Script;parameters=$Params} | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $request -Encoding utf8
    $output=& (Get-Process -Id $PID).Path -NoProfile -File $taskRunner -Pedido $request 2>&1 | Out-String
    if ($LASTEXITCODE -ne $Expected) { throw "Retorno $LASTEXITCODE; esperado $Expected. $output" }
    return $output
}
function Assert-Test([bool]$Condition,[string]$Name) {
    if (-not $Condition) { throw $Name }
    $script:taskResults += [pscustomobject]@{test=$Name;result='passed'}
}
try {
    $lean=Join-Path $taskTemp 'enxuto'
    Invoke-Helper (Join-Path $taskKit 'scripts/init-project.ps1') @{Destination=$lean;Name='Teste genérico'} | Out-Null
    Assert-Test ((Test-Path -LiteralPath "$lean/.kit/templates/engineering/architecture.md") -and -not (Test-Path -LiteralPath "$lean/docs/product/engineering")) 'Inicialização enxuta distingue biblioteca de resultados'
    $catalog=Get-Content -LiteralPath "$lean/.kit/catalog.json" -Raw | ConvertFrom-Json
    Assert-Test ((Test-Path -LiteralPath "$lean/docs/product/README.md") -and @($catalog.artifacts | Where-Object {$_.id -eq 'product-guide' -and $_.destination -eq 'docs/product/README.md'}).Count -eq 1) 'Mapa da solução nasce uma vez e fica no catálogo'
    Assert-Test (-not (Test-Path -LiteralPath "$lean/docs/product/context/artifact-register.md") -and (Test-Path -LiteralPath "$lean/.kit/templates/context/artifact-register.md")) 'Registro auxiliar de autoridade permanece sob demanda na inicialização enxuta'
    Assert-Test ((Test-Path -LiteralPath "$lean/.kit/templates/definition/product-behavior.md") -and -not (Test-Path -LiteralPath "$lean/docs/product/definition/product-behavior.md")) 'Referência de comportamento permanece sob demanda'
    Assert-Test (@(Get-ChildItem -LiteralPath "$lean/.agents/skills" -Directory).Count -eq 11) 'Onze procedimentos estão distribuídos com a instância'
    $rootFiles=@(Get-ChildItem -LiteralPath $lean -File | Select-Object -ExpandProperty Name | Sort-Object)
    Assert-Test (($rootFiles -join ',') -eq 'AGENTS.md,README.md') 'Raiz enxuta contém somente entrada e encaminhamento'
    Assert-Test ((Test-Path -LiteralPath "$lean/.kit/STAGE_INFORMATION.md") -and (Get-Content -LiteralPath "$lean/.kit/project.json" -Raw) -match 'Modelos são preparação' -and @(Get-ChildItem -LiteralPath "$lean/docs/product" -Directory | Where-Object Name -Match '^\d{2}_').Count -eq 0) 'Guias ficam em .kit; saídas usam português e pastas sem números'
    $before=(Get-FileHash -LiteralPath "$lean/.kit/project.json").Hash
    Invoke-Helper (Join-Path $taskKit 'scripts/init-project.ps1') @{Destination=$lean;Name='Outro'} 1 | Out-Null
    Assert-Test ((Get-FileHash -LiteralPath "$lean/.kit/project.json").Hash -eq $before) 'Destino existente recusado sem sobrescrita'
    $refused=Join-Path $taskTemp 'invalid-option'
    Invoke-Helper (Join-Path $taskKit 'scripts/init-project.ps1') @{Destination=$refused;Name='Outro';UnsupportedOption='unused'} 1 | Out-Null
    Assert-Test (-not (Test-Path -LiteralPath $refused)) 'Argumento desconhecido recusado antes de criar destino'
    $complete=Join-Path $taskTemp 'completo'
    Invoke-Helper (Join-Path $taskKit 'scripts/init-project.ps1') @{Destination=$complete;Name='Teste';Structure='complete'} | Out-Null
    Assert-Test (Test-Path -LiteralPath "$complete/docs/product/engineering/architecture.md") 'Visão completa continua opcional'
    $material="$lean/.kit/scripts/materialize.ps1";$worker="$lean/.kit/scripts/work.ps1"
    Invoke-Helper $material @{Project=$lean;Document='product-behavior'} | Out-Null
    'R01: capacidade definida, implementação não demonstrada.' | Set-Content -LiteralPath "$lean/docs/product/definition/product-behavior.md" -Encoding utf8
    $behaviorHash=(Get-FileHash -LiteralPath "$lean/docs/product/definition/product-behavior.md").Hash
    Invoke-Helper $material @{Project=$lean;Document='product-behavior'} | Out-Null
    Assert-Test ((Get-FileHash -LiteralPath "$lean/docs/product/definition/product-behavior.md").Hash -eq $behaviorHash) 'Materialização não sobrescreve conhecimento vigente da capacidade'
    Invoke-Helper $material @{Project=$lean;Document='architecture'} | Out-Null
    'Decisão específica que precisa ser preservada.' | Set-Content -LiteralPath "$lean/docs/product/engineering/architecture.md" -Encoding utf8
    $decision=(Get-FileHash -LiteralPath "$lean/docs/product/engineering/architecture.md").Hash
    Invoke-Helper $material @{Project=$lean;Document='architecture'} | Out-Null
    Assert-Test ((Get-FileHash -LiteralPath "$lean/docs/product/engineering/architecture.md").Hash -eq $decision) 'Materialização preserva conteúdo existente'
    Invoke-Helper $worker @{Project=$lean;Action='start';Id='WRK-001-teste';Title='Ciclo';Origin='Fixture';Base='Fixture v1';Objective='Conferir o helper';Criteria=@('Critério A','Critério B');MaxRounds=1} | Out-Null
    Invoke-Helper $worker @{Project=$lean;Action='start';Id='WRK-002-teste';Title='Outro';Origin='Fixture';Base='v1';Objective='Outro teste';Criteria=@('Critério observável')} | Out-Null
    $config=Get-Content -LiteralPath "$lean/.kit/project.json" -Raw | ConvertFrom-Json
    Assert-Test ($config.active_work -eq 'docs/product/work/WRK-001-teste') 'Criar trabalho não troca seleção existente'
    Invoke-Helper $worker @{Project=$lean;Action='select';Id='WRK-002-teste'} | Out-Null
    $config=Get-Content -LiteralPath "$lean/.kit/project.json" -Raw | ConvertFrom-Json
    Assert-Test ($config.active_work -eq 'docs/product/work/WRK-002-teste') 'Seleção usa identidade explícita'
    Invoke-Helper $material @{Project=$lean;Work='WRK-002-teste';Document='spec'} | Out-Null
    Assert-Test (Test-Path -LiteralPath "$lean/docs/product/work/WRK-002-teste/spec.md") 'Artefato materializado no pacote responsável'
    Invoke-Helper $worker @{Project=$lean;Action='check';Id='WRK-002-teste';Phase='complete'} 2 | Out-Null
    Assert-Test $true 'Fechamento identifica ausência de evidência e convergência'
    $proof='docs/product/work/WRK-001-teste/resultado.txt'
    'Fixture de resultado A; não é validação de produto.' | Set-Content -LiteralPath (Join-Path $lean $proof) -Encoding utf8
    Invoke-Helper $worker @{Project=$lean;Action='record-round';Id='WRK-001-teste';Result='progress';Summary='Fixture A';Evidence=@($proof);MetCriteria=@('C001');NextStep='Conferir B'} | Out-Null
    $state=Get-Content -LiteralPath "$lean/docs/product/work/WRK-001-teste/state.json" -Raw | ConvertFrom-Json
    Assert-Test ($state.status -eq 'limit_reached') 'Limite mantém resultado parcial sem declarar conclusão'
    Invoke-Helper $worker @{Project=$lean;Action='record-round';Id='WRK-001-teste';Result='progress';Summary='Repetição';Evidence=@($proof)} 1 | Out-Null
    Assert-Test $true 'Registro além do teto é recusado'
    Invoke-Helper $worker @{Project=$lean;Action='resume';Id='WRK-001-teste';Reason='Fixture de retomada';MaxRounds=3} | Out-Null
    Invoke-Helper $worker @{Project=$lean;Action='record-round';Id='WRK-001-teste';Result='progress';Summary='Repetição';Evidence=@($proof);NextStep='Repetir'} | Out-Null
    $state=Get-Content -LiteralPath "$lean/docs/product/work/WRK-001-teste/state.json" -Raw | ConvertFrom-Json
    Assert-Test ($state.status -eq 'no_progress') 'Evidência repetida sem novo critério interrompe continuação'
    Invoke-Helper $worker @{Project=$lean;Action='resume';Id='WRK-001-teste';Reason='Nova fixture B';MaxRounds=4} | Out-Null
    'Fixture A e B conferidos.' | Set-Content -LiteralPath (Join-Path $lean $proof) -Encoding utf8
    Invoke-Helper $worker @{Project=$lean;Action='record-round';Id='WRK-001-teste';Result='progress';Summary='Fixture B';Evidence=@($proof);MetCriteria=@('C001','C002')} | Out-Null
    $final='docs/product/work/WRK-001-teste/convergence.md'
    'Fixture: critérios A e B confrontados; não é um resultado de mercado.' | Set-Content -LiteralPath (Join-Path $lean $final) -Encoding utf8
    Invoke-Helper $worker @{Project=$lean;Action='record-convergence';Id='WRK-001-teste';Result='clear';Summary='Fixture de confronto';Evidence=@($final)} | Out-Null
    'Mudança posterior da evidência.' | Add-Content -LiteralPath (Join-Path $lean $proof)
    Invoke-Helper $worker @{Project=$lean;Action='complete';Id='WRK-001-teste'} 1 | Out-Null
    Assert-Test $true 'Evidência alterada invalida fechamento'
    Invoke-Helper $worker @{Project=$lean;Action='record-round';Id='WRK-001-teste';Result='progress';Summary='Fixture reavaliada';Evidence=@($proof);MetCriteria=@('C001','C002')} | Out-Null
    Invoke-Helper $worker @{Project=$lean;Action='record-convergence';Id='WRK-001-teste';Result='clear';Summary='Fixture atual conferida';Evidence=@($final)} | Out-Null
    Invoke-Helper $worker @{Project=$lean;Action='complete';Id='WRK-001-teste'} | Out-Null
    $state=Get-Content -LiteralPath "$lean/docs/product/work/WRK-001-teste/state.json" -Raw | ConvertFrom-Json
    Assert-Test ($state.status -eq 'completed' -and $state.rounds.Count -eq 4) 'Conclusão preserva histórico e exige evidências atuais'
    Assert-Test ((Get-Content -LiteralPath "$lean/docs/product/work/WRK-001-teste/handoff.md" -Raw) -match 'Trabalho encerrado' -and (Get-Content -LiteralPath "$lean/docs/product/work/WRK-001-teste/handoff.md" -Raw) -match 'Estado: concluído') 'Retomada de trabalho concluído não propõe continuar execução antiga'
    Invoke-Helper $worker @{Project=$lean;Action='select';Id='../fora'} 1 | Out-Null
    Invoke-Helper $worker @{Project=$lean;Action='record-round';Id='WRK-002-teste';Result='progress';Summary='Tentativa';Evidence=@('../fora.txt');NextStep='Outro'} 1 | Out-Null
    Assert-Test $true 'IDs/caminhos que escapam ao projeto são recusados'
    Invoke-Helper $worker @{Project=$lean;Action='cancel';Id='WRK-002-teste';Reason='Encerrado apenas para testar preservação'} | Out-Null
    $canceled=Get-Content -LiteralPath "$lean/docs/product/work/WRK-002-teste/state.json" -Raw | ConvertFrom-Json
    Assert-Test ($canceled.status -eq 'canceled' -and $canceled.closure.reason -eq 'Encerrado apenas para testar preservação') 'Cancelamento preserva motivo no estado'
    Invoke-Helper $worker @{Project=$lean;Action='set-criteria';Id='WRK-002-teste';Criteria=@('Outro')} 1 | Out-Null
    Invoke-Helper $worker @{Project=$lean;Action='record-convergence';Id='WRK-001-teste';Result='clear';Summary='Tentativa';Evidence=@($final)} 1 | Out-Null
    Assert-Test $true 'Trabalhos encerrados preservam critérios e convergência'
    $currentPath='docs/product/definition/product-behavior.md'
    Invoke-Helper $worker @{Project=$lean;Action='start';Id='WRK-005-current';Title='Current knowledge';Origin='Fixture';Base='v1';Objective='Preserve examined source';Criteria=@('Current rule examined')} | Out-Null
    Invoke-Helper $worker @{Project=$lean;Action='preserve-evidence';Id='WRK-005-current'} 1 | Out-Null
    Assert-Test $true 'Preservação de legado não congela trabalho em andamento'
    Invoke-Helper $worker @{Project=$lean;Action='record-round';Id='WRK-005-current';Result='progress';Summary='Rule examined';Evidence=@($currentPath);MetCriteria=@('C001')} | Out-Null
    'Fixture convergence for current rule.' | Set-Content -LiteralPath "$lean/docs/product/work/WRK-005-current/convergence.md" -Encoding utf8
    Invoke-Helper $worker @{Project=$lean;Action='record-convergence';Id='WRK-005-current';Result='clear';Summary='Rule compared';Evidence=@('docs/product/work/WRK-005-current/convergence.md')} | Out-Null
    Invoke-Helper $worker @{Project=$lean;Action='complete';Id='WRK-005-current'} | Out-Null
    $currentState=Get-Content -LiteralPath "$lean/docs/product/work/WRK-005-current/state.json" -Raw | ConvertFrom-Json
    $saved=$currentState.criteria[0].evidence[0]
    Assert-Test ($saved.original_path -eq $currentPath -and $saved.path -match '/evidence/baselines/' -and (Get-FileHash -LiteralPath (Join-Path $lean $saved.path)).Hash -eq $behaviorHash) 'Fechamento preserva bytes, hash e origem do conhecimento mutável'
    $savedBytes=[IO.File]::ReadAllBytes((Join-Path $lean $saved.path))
    'R01: evolução posterior.' | Set-Content -LiteralPath (Join-Path $lean $currentPath) -Encoding utf8
    Invoke-Helper $worker @{Project=$lean;Action='check';Id='WRK-005-current';Phase='complete'} | Out-Null
    Assert-Test $true 'Evolução posterior do vigente não invalida prova da versão encerrada'
    Add-Content -LiteralPath (Join-Path $lean $saved.path) -Value 'Corrupted snapshot'
    Invoke-Helper $worker @{Project=$lean;Action='check';Id='WRK-005-current';Phase='complete'} 2 | Out-Null
    Assert-Test $true 'Alteração da prova preservada é detectada'
    [IO.File]::WriteAllBytes((Join-Path $lean $saved.path),$savedBytes)
    $english=Join-Path $taskTemp 'english'
    Invoke-Helper (Join-Path $taskKit 'scripts/init-project.ps1') @{Destination=$english;Name='Feature fixture';Language='en-US';WorkType='feature'} | Out-Null
    $lang=Get-Content -LiteralPath "$english/.kit/project.json" -Raw | ConvertFrom-Json
    Assert-Test ($lang.output_language -eq 'en-US' -and $lang.naming_language -eq 'en' -and $lang.current_phase -eq 'impact-analysis') 'Idioma e entrada usam configuração independente dos nomes'
    Invoke-Helper "$english/.kit/scripts/work.ps1" @{Project=$english;Action='start';Id='WRK-003-feature';Title='Feature fixture';Type='feature';Origin='Fixture';Base='v1';Objective='Check prerequisites'} | Out-Null
    Invoke-Helper "$english/.kit/scripts/work.ps1" @{Project=$english;Action='set-criteria';Criteria=@('Observable fixture')} | Out-Null
    Assert-Test ((Get-Content -LiteralPath "$english/docs/product/work/WRK-003-feature/brief.md" -Raw) -match '## Scope and non-goals') 'Brief auxiliar usa inglês quando solicitado'
    Invoke-Helper "$english/.kit/scripts/work.ps1" @{Project=$english;Action='check';Phase='plan'} | Out-Null
    Assert-Test $true 'Trabalho proporcional com intenção e critérios não exige três arquivos separados'
    Invoke-Helper "$english/.kit/scripts/materialize.ps1" @{Project=$english;Work='WRK-003-feature';Document='spec'} | Out-Null
    Invoke-Helper "$english/.kit/scripts/work.ps1" @{Project=$english;Action='check';Phase='execute'} 2 | Out-Null
    Assert-Test $true 'Pré-condições detectam artefato ausente e ainda modelo'
    . (Join-Path $taskKit 'scripts/common.ps1')
    $raceProject=Get-LocalProject $english
    $sessionA=Get-LocalWork $raceProject 'WRK-003-feature'
    $sessionB=Get-LocalWork $raceProject 'WRK-003-feature'
    $sessionA.State.criteria[0].state='met'
    Save-LocalWork $sessionA
    $sessionB.State.artifacts | Add-Member -NotePropertyName research -NotePropertyValue 'docs/product/work/WRK-003-feature/research.md'
    $conflict=$false
    try{Save-LocalWork $sessionB}catch{$conflict=$_.Exception.Message -match 'Conflito de gravação'}
    $persisted=Get-LocalWork $raceProject 'WRK-003-feature'
    Assert-Test ($conflict -and $persisted.State.criteria[0].state -eq 'met' -and $persisted.State.revision -eq $sessionA.State.revision) 'Estado obsoleto é rejeitado sem perder critério de outra sessão'
    $configA=Get-LocalProject $english
    $configB=Get-LocalProject $english
    $configA.Config.output_language='pt-BR'
    Save-LocalProject $configA
    $configB.Config.active_work=$null
    $conflict=$false
    try{Save-LocalProject $configB}catch{$conflict=$_.Exception.Message -match 'Conflito de gravação'}
    $persistedConfig=Get-LocalProject $english
    Assert-Test ($conflict -and $persistedConfig.Config.output_language -eq 'pt-BR' -and $persistedConfig.Config.active_work) 'Seleção obsoleta não apaga mudança independente de configuração'
    $persisted.State.artifacts | Add-Member -NotePropertyName missing -NotePropertyValue 'docs/product/work/WRK-003-feature/missing.md'
    Save-LocalWork $persisted
    Invoke-Helper "$english/.kit/scripts/work.ps1" @{Project=$english;Action='check';Id='WRK-003-feature';Phase='execute'} 2 | Out-Null
    Assert-Test $true 'Registro declarado ausente continua impedindo execução estrutural'
    $flow=Join-Path $taskTemp 'flow'
    Invoke-Helper (Join-Path $taskKit 'scripts/init-project.ps1') @{Destination=$flow;Name='Flow fixture';ExecutionMode='continuous'} | Out-Null
    Invoke-Helper "$flow/.kit/scripts/work.ps1" @{Project=$flow;Action='start';Id='WRK-004-flow';Title='Flow';Origin='Fixture';Base='v1';Objective='Check transition';StopAfter='delivery';Stage='research';AllowedStages=@('research','product');Criteria=@('Criterion')} | Out-Null
    'Fixture: passagem registrada após resultado.' | Set-Content -LiteralPath "$flow/docs/product/work/WRK-004-flow/research.md"
    Invoke-Helper "$flow/.kit/scripts/work.ps1" @{Project=$flow;Action='advance-stage';Stage='product';Summary='Fixture reviewed';Evidence=@('docs/product/work/WRK-004-flow/research.md')} | Out-Null
    Invoke-Helper "$flow/.kit/scripts/work.ps1" @{Project=$flow;Action='advance-stage';Stage='engineering';Summary='Outside scope';Evidence=@('docs/product/work/WRK-004-flow/research.md')} 1 | Out-Null
    Invoke-Helper "$flow/.kit/scripts/work.ps1" @{Project=$flow;Action='pause';Reason='User pause fixture'} | Out-Null
    Invoke-Helper "$flow/.kit/scripts/work.ps1" @{Project=$flow;Action='advance-stage';Stage='research';Summary='Paused';Evidence=@('docs/product/work/WRK-004-flow/research.md')} 1 | Out-Null
    Invoke-Helper "$flow/.kit/scripts/work.ps1" @{Project=$flow;Action='resume';Reason='User resume fixture';MaxRounds=3} | Out-Null
    $flowState=Get-Content -LiteralPath "$flow/docs/product/work/WRK-004-flow/state.json" -Raw | ConvertFrom-Json
    Assert-Test ($flowState.execution.mode -eq 'continuous' -and $flowState.execution.transitions.Count -eq 1 -and $flowState.pauses.Count -eq 1 -and $flowState.resumptions.Count -eq 1) 'Modo contínuo preserva passagens/pausas e limita alcance'
    $copied=Join-Path $taskTemp 'copiado'
    Copy-Item -LiteralPath $lean -Destination $copied -Recurse -Force
    Invoke-Helper "$copied/.kit/scripts/materialize.ps1" @{Project=$copied;Document='brand'} | Out-Null
    Assert-Test (Test-Path -LiteralPath "$copied/docs/product/brand/brand.md") 'Instância copiada materializa sem depender do kit original'
    $broken=@()
    foreach($file in Get-ChildItem -LiteralPath $copied -Filter '*.md' -File -Recurse -Force) {
        foreach($m in [regex]::Matches((Get-Content -LiteralPath $file.FullName -Raw),'\[[^\]]+\]\(([^\)]+)\)')) {
            $link=$m.Groups[1].Value
            if($link -match '^(https?://|#)'){continue}
            $target=Join-Path (Split-Path -Parent $file.FullName) (($link -split '#')[0])
            if(-not(Test-Path -LiteralPath $target)){$broken+="$($file.Name):$link"}
        }
    }
    Assert-Test ($broken.Count -eq 0) ('Links da instância copiada: '+($broken -join ', '))
    $report=[ordered]@{version='0.1.0';status='passed';platform=[Environment]::OSVersion.Platform.ToString();powershell=$PSVersionTable.PSVersion.ToString();tests=$taskResults;limit='Fixtures verificam helpers/portabilidade, não decisões ou validação de produto.'}
} catch {
    $report=[ordered]@{version='0.1.0';status='failed';tests=$taskResults;error=$_.Exception.Message}
} finally {
    if($ReportPath){$report | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $ReportPath -Encoding utf8}
    $report | ConvertTo-Json -Depth 8
    $resolved=[IO.Path]::GetFullPath($taskTemp)
    if($resolved -ne $taskTemp -or -not $resolved.StartsWith($taskTempParent.TrimEnd('\','/')+[IO.Path]::DirectorySeparatorChar,[StringComparison]::OrdinalIgnoreCase)){throw 'Limpeza fora do temporário recusada.'}
    Remove-Item -LiteralPath $resolved -Recurse -Force
}
if($report.status -ne 'passed'){exit 1}
