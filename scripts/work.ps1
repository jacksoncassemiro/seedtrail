[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][string]$Project,
    [Parameter(Mandatory=$true)][ValidateSet('start','select','set-criteria','record-round','record-convergence','check','complete','preserve-evidence','pause','resume','cancel','advance-stage')][string]$Action,
    [string]$Id,
    [string]$Title,
    [ValidateSet('idea','research','feature','fix','design','architecture','business','brand','operations','review')][string]$Type='research',
    [string]$Origin,
    [string]$Objective,
    [string]$Base,
    [string[]]$Criteria,
    [string[]]$MetCriteria,
    [string[]]$Evidence,
    [ValidateRange(0,1000)][int]$MaxRounds=0,
    [string]$Result,
    [string]$Summary,
    [string]$NextStep,
    [string]$Reason,
    [ValidateSet('plan','execute','complete')][string]$Phase='execute',
    [ValidateSet('stage','delivery')][string]$StopAfter='stage',
    [ValidateSet('context','research','product','business','experience','brand','engineering','quality','delivery','operations','evolution','review')][string]$Stage='context',
    [ValidateSet('context','research','product','business','experience','brand','engineering','quality','delivery','operations','evolution','review')][string[]]$AllowedStages=@('context')
)
. (Join-Path $PSScriptRoot 'common.ps1')
$localProject = Get-LocalProject $Project

function New-WorkCriteria([string[]]$Descriptions) {
    $items = @(); $n=1
    foreach ($description in $Descriptions) {
        if ([string]::IsNullOrWhiteSpace($description)) { throw 'Critério vazio.' }
        $items += [pscustomobject]@{id=('C{0:000}' -f $n);description=$description;state='pending';evidence=@()}; $n++
    }
    return $items
}
function Test-WorkEvidence($Criteria) {
    $missing = @()
    foreach ($criterion in @($Criteria)) {
        foreach ($proof in @($criterion.evidence)) {
            $path = Get-LocalPath $localProject.Root $proof.path
            if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { $missing += $proof.path; continue }
            if ((Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash -ne $proof.sha256) { $missing += "Evidência alterada: $($proof.path)" }
        }
    }
    return $missing
}

function Preserve-WorkEvidence($Work) {
    # Keep mutable product sources separate from the version checked at closure.
    # Active evidence is checked BEFORE capture; this never replaces a stale digest.
    $changes=@{}
    $proofs=@($Work.State.criteria | ForEach-Object {$_.evidence})+@($Work.State.convergence.evidence)
    foreach($proof in $proofs) {
        if($proof.path.StartsWith($Work.Relative+'/',[StringComparison]::OrdinalIgnoreCase)){continue}
        $key=$proof.path+':'+$proof.sha256
        if($changes.ContainsKey($key)){continue}
        $source=Get-LocalPath $localProject.Root $proof.path
        $relative=$Work.Relative+'/evidence/baselines/'+$proof.sha256+'/'+[IO.Path]::GetFileName($proof.path)+'.txt'
        $target=Get-LocalPath $localProject.Root $relative
        if(Test-Path -LiteralPath $target) {
            if((Get-FileHash -LiteralPath $target).Hash -ne $proof.sha256){throw 'Snapshot existente divergente; nada foi sobrescrito.'}
        } else {
            New-Item -ItemType Directory -Path (Split-Path -Parent $target) -Force | Out-Null
            Copy-Item -LiteralPath $source -Destination $target
            if((Get-FileHash -LiteralPath $target).Hash -ne $proof.sha256){throw 'Fonte mudou durante captura; não concluir.'}
        }
        $changes[$key]=[pscustomobject]@{original_path=$proof.path;snapshot_path=$relative;sha256=$proof.sha256;date=[DateTimeOffset]::UtcNow.ToString('o');reason='Preserve examined version of a mutable source; not a new verification.'}
    }
    $entries=@($Work.State.criteria | ForEach-Object {$_.evidence})+@($Work.State.convergence.evidence)+@($Work.State.rounds | ForEach-Object {$_.evidence})+@($Work.State.execution.transitions | ForEach-Object {$_.evidence})
    foreach($proof in $entries) {
        $key=$proof.path+':'+$proof.sha256
        if($changes.ContainsKey($key)) {
            $proof | Add-Member -NotePropertyName original_path -NotePropertyValue $proof.path -Force
            $proof.path=$changes[$key].snapshot_path
        }
    }
    if($changes.Count) {
        $previous=if($Work.State.PSObject.Properties.Name -contains 'evidence_relocations'){@($Work.State.evidence_relocations)}else{@()}
        $Work.State | Add-Member -NotePropertyName evidence_relocations -NotePropertyValue ($previous+@($changes.Values)) -Force
    }
}

if ($Action -eq 'start') {
    if ($Id -notmatch '^[A-Za-z][A-Za-z0-9-]{2,79}$') { throw 'Informe -Id estável com letras, números e hífens.' }
    foreach ($value in @($Title,$Origin,$Objective,$Base)) { if ([string]::IsNullOrWhiteSpace($value)) { throw 'Iniciar requer Titulo, Origem, Objetivo e Base.' } }
    $relative = "docs/product/work/$Id"
    $root = Get-LocalPath $localProject.Root $relative
    if (Test-Path -LiteralPath $root) { throw 'Trabalho já existe; nada foi sobrescrito.' }
    $workCriteria = @(New-WorkCriteria $Criteria)
    if ($Stage -notin $AllowedStages) { throw 'Stage inicial deve estar em AllowedStages.' }
    if ($StopAfter -eq 'stage' -and $AllowedStages.Count -ne 1) { throw 'Escopo de uma etapa requer exatamente uma etapa permitida.' }
    $state = [ordered]@{
        schema=1;id=$Id;title=$Title;type=$Type;origin=$Origin;objective=$Objective;base=$Base
        status='in_progress';max_rounds=$(if ($MaxRounds -gt 0) {$MaxRounds} else {3})
        criteria=$workCriteria;artifacts=[pscustomobject]@{};rounds=@();convergence=$null
        revision=0;updated_at=[DateTimeOffset]::UtcNow.ToString('o');resumptions=@();pauses=@();closure=$null
        execution=[pscustomobject]@{mode=$localProject.Config.execution_mode;stop_after=$StopAfter;current_stage=$Stage;allowed_stages=@($AllowedStages);transitions=@()}
    }
    Write-LocalCheckedJson (Join-Path $root 'state.json') $state $null | Out-Null
    $brief = if ($localProject.Config.output_language -like 'pt*') {
        "# $Title`n`nObjetivo: $Objective`n`nOrigem: $Origin`n`nBase: $Base`n`n## Alcance e não objetivos`n`nA delimitar antes da execução. Critérios e evidências ficam em [state.json](state.json); não duplicar seus estados neste brief.`n`n## Decisões e arquivos responsáveis`n`nRegistrar fonte e consumidores; implementação somente no escopo solicitado.`n"
    } else {
        "# $Title`n`nObjective: $Objective`n`nOrigin: $Origin`n`nBaseline: $Base`n`n## Scope and non-goals`n`nDefine before execution. Criteria and evidence live in [state.json](state.json); do not duplicate their state here.`n`n## Decisions and responsible artifacts`n`nRecord sources and consumers; implementation stays within the requested scope.`n"
    }
    Write-LocalText (Join-Path $root 'brief.md') $brief
    $work = Get-LocalWork $localProject $Id
    Update-LocalHandoff $work
    # Criar não troca silenciosamente outro trabalho ativo.
    if (-not $localProject.Config.active_work) {
        $localProject.Config | Add-Member -MemberType NoteProperty -Name active_work -Value $relative -Force
        Save-LocalProject $localProject
    }
    [pscustomobject]@{id=$Id;path=$relative;active=($localProject.Config.active_work -eq $relative);criteria=$workCriteria.Count} | ConvertTo-Json
    exit
}

$work = Get-LocalWork $localProject $Id
$state = $work.State
switch ($Action) {
    'advance-stage' {
        if ($state.status -ne 'in_progress') { throw 'Avanço requer trabalho em andamento.' }
        if ($Stage -notin $state.execution.allowed_stages) { throw 'Etapa fora do alcance declarado.' }
        if ($Stage -eq $state.execution.current_stage) { throw 'Já está nesta etapa.' }
        if (-not $Summary) { throw 'Registrar por que há informação suficiente para esta passagem.' }
        $proofs=@(Get-LocalEvidence $localProject $Evidence)
        if (@($proofs | Where-Object {$_.path -match '^\.kit/' -or $_.path -match '/(state\.json|handoff\.md)$'}).Count -gt 0) { throw 'Passagem requer evidência da entrega, não modelo/estado.' }
        $state.execution.transitions=@($state.execution.transitions)+[pscustomobject]@{from=$state.execution.current_stage;to=$Stage;summary=$Summary;evidence=$proofs;date=[DateTimeOffset]::UtcNow.ToString('o')}
        $state.execution.current_stage=$Stage
        Save-LocalWork $work;Update-LocalHandoff $work
    }
    'select' {
        $localProject.Config | Add-Member -MemberType NoteProperty -Name active_work -Value $work.Relative -Force
        Save-LocalProject $localProject
    }
    'set-criteria' {
        if ($state.status -in @('completed','canceled')) { throw 'Trabalho encerrado; criar outro vinculado, preservando critérios anteriores.' }
        if (@($state.rounds).Count -gt 0) { throw 'Há rodadas registradas. Mudança material de critérios requer novo trabalho vinculado à base anterior, preservando resultados.' }
        if (-not $Criteria) { throw 'Informe critérios observáveis.' }
        $state.criteria = @(New-WorkCriteria $Criteria)
        $state.convergence = $null
        Save-LocalWork $work
    }
    'record-round' {
        if ($state.status -ne 'in_progress') { throw 'Trabalho não está em andamento; retomar exige motivo e limite explícito.' }
        if (@($state.rounds).Count -ge $state.max_rounds) { throw 'Limite de rodadas atingido.' }
        if (@($state.criteria).Count -eq 0) { throw 'Defina critérios antes de registrar execução de rodadas.' }
        if ($Result -notin @('progress','no_progress','blocked','failed')) { throw 'Result: progress, no_progress, blocked ou failed.' }
        if (-not $Summary) { throw 'Registre o resultado real da rodada.' }
        if ($Result -eq 'progress' -and -not $NextStep -and -not $MetCriteria) { throw 'Progresso requer próximo passo concreto ou critério atendido.' }
        if ($Result -ne 'progress' -and -not $Reason) { throw 'Registre a causa da interrupção ou falha.' }
        $proofs = @(Get-LocalEvidence $localProject $Evidence)
        foreach ($proof in $proofs) {
            if ($proof.path -match '^\.kit/' -or $proof.path -match '/(state\.json|handoff\.md)$') { throw 'Modelo/estado/resumo de retomada não é evidência da entrega.' }
        }
        foreach ($key in $MetCriteria) {
            if ($key -notin @($state.criteria | ForEach-Object {$_.id})) { throw "Critério desconhecido: $key" }
        }
        $previous = @($state.rounds) | Select-Object -Last 1
        $newCriteria = @($state.criteria | Where-Object {$_.id -in $MetCriteria -and $_.state -ne 'met'})
        if ($Result -eq 'progress' -and $previous -and $newCriteria.Count -eq 0) {
            $oldProofs = @($previous.evidence | ForEach-Object {"$($_.path):$($_.sha256)"} | Sort-Object) -join '|'
            $newProofs = @($proofs | ForEach-Object {"$($_.path):$($_.sha256)"} | Sort-Object) -join '|'
            if ($oldProofs -eq $newProofs) { $Result='no_progress'; $Reason='Evidências e critérios não mudaram desde a rodada anterior.' }
        }
        foreach ($criterion in $state.criteria) {
            if ($criterion.id -in $MetCriteria) { $criterion.state='met'; $criterion.evidence=$proofs }
        }
        $state.rounds = @($state.rounds) + [pscustomobject]@{
            number=(@($state.rounds).Count+1);date=[DateTimeOffset]::UtcNow.ToString('o')
            result=$Result;summary=$Summary;next_step=$NextStep;reason=$Reason
            met_criteria=@($MetCriteria);evidence=$proofs
        }
        $state.convergence=$null
        if ($Result -in @('blocked','failed','no_progress')) { $state.status=$Result }
        elseif (@($state.rounds).Count -ge $state.max_rounds -and @($state.criteria | Where-Object {$_.state -ne 'met'}).Count -gt 0) { $state.status='limit_reached' }
        Save-LocalWork $work
        Update-LocalHandoff $work
    }
    'record-convergence' {
        if ($state.status -in @('completed','canceled')) { throw 'Trabalho encerrado; não substituir sua convergência.' }
        if ($Result -notin @('clear','gaps')) { throw 'Convergência requer Result clear ou gaps.' }
        if (-not $Summary) { throw 'Registre o confronto feito e os limites.' }
        $proofs = @(Get-LocalEvidence $localProject $Evidence)
        if (@($proofs | Where-Object {$_.path -match '^\.kit/' -or $_.path -match '/(state\.json|handoff\.md)$'}).Count -gt 0) { throw 'Convergência requer relatório/resultado, não modelo ou estado.' }
        $state.convergence=[pscustomobject]@{result=$Result;summary=$Summary;evidence=$proofs;date=[DateTimeOffset]::UtcNow.ToString('o')}
        Save-LocalWork $work
    }
    'check' {
        $missing = @()
        if (@($state.criteria).Count -eq 0) { $missing += 'Critérios observáveis não definidos.' }
        if ($Phase -in @('plan','execute')) {
            # Formato proporcional: examinar o que foi declarado/materializado,
            # sem exigir spec/plan/tasks separados para toda correção ou pesquisa.
            $candidates=@((Join-Path $work.Root 'brief.md'))
            foreach($artifact in $state.artifacts.PSObject.Properties){
                $candidate=Get-LocalPath $localProject.Root ([string]$artifact.Value)
                if(-not(Test-Path -LiteralPath $candidate -PathType Leaf)){$missing += "Artefato declarado ausente: $($artifact.Name)"}
                else{$candidates+=$candidate}
            }
            foreach($file in @('spec.md','plan.md','tasks.md')){
                $candidate=Join-Path $work.Root $file
                if(Test-Path -LiteralPath $candidate -PathType Leaf){$candidates+=$candidate}
            }
            foreach($candidate in @($candidates | Select-Object -Unique)){
                if(-not(Test-Path -LiteralPath $candidate -PathType Leaf)){$missing += 'Intenção/brief ausente.'}
                elseif((Get-Content -LiteralPath $candidate -Raw -Encoding utf8) -match '(?m)^Status: (modelo|template)'){$missing += "Artefato ainda modelo: $(Split-Path -Leaf $candidate)"}
            }
        }
        if ($Phase -eq 'complete') {
            foreach ($criterion in $state.criteria) { if ($criterion.state -ne 'met' -or @($criterion.evidence).Count -eq 0) { $missing += "Critério sem evidência de atendimento: $($criterion.id)" } }
            $missing += @(Test-WorkEvidence $state.criteria)
            if (-not $state.convergence -or $state.convergence.result -ne 'clear') { $missing += 'Convergência sem lacunas não registrada.' }
            elseif ($state.convergence) { $missing += @(Test-WorkEvidence @($state.convergence)) }
        }
        [pscustomobject]@{id=$state.id;phase=$Phase;check='structural';ready=($missing.Count -eq 0);pending=$missing;limit='Presença, estado e hash não provam qualidade, autorização, comportamento ou veracidade. Revisão do conteúdo e verificações pertinentes continuam necessárias.'} | ConvertTo-Json -Depth 6
        if ($missing.Count -gt 0) { exit 2 }; exit
    }
    'complete' {
        if (@($state.criteria).Count -eq 0 -or @($state.criteria | Where-Object {$_.state -ne 'met' -or @($_.evidence).Count -eq 0}).Count -gt 0) { throw 'Critérios não atendidos com evidência.' }
        if (-not $state.convergence -or $state.convergence.result -ne 'clear') { throw 'Registre convergência sem lacunas antes de concluir.' }
        $stale = @(Test-WorkEvidence (@($state.criteria) + @($state.convergence)))
        if ($stale.Count -gt 0) { throw ($stale -join '; ') }
        if ($state.status -ne 'in_progress') { throw 'Retome o trabalho explicitamente antes de concluir.' }
        Preserve-WorkEvidence $work
        $state.status='completed'
        $state.closure=[pscustomobject]@{result='completed';date=[DateTimeOffset]::UtcNow.ToString('o');reason='Criteria and current convergence recorded.'}
        Save-LocalWork $work
        Update-LocalHandoff $work
    }
    'preserve-evidence' {
        if($state.status -ne 'completed'){throw 'Preservação de legado requer trabalho concluído; a conclusão nova já captura fontes mutáveis.'}
        $stale=@(Test-WorkEvidence (@($state.criteria)+@($state.convergence)))
        if($stale.Count){throw ($stale -join '; ')}
        Preserve-WorkEvidence $work
        Save-LocalWork $work
    }
    'resume' {
        if ($state.status -in @('completed','canceled')) { throw 'Trabalho encerrado; crie outro vinculado para novo escopo.' }
        if (-not $Reason -or $MaxRounds -le @($state.rounds).Count) { throw 'Retomar requer motivo e teto de rodadas maior que o consumo atual.' }
        $state.resumptions=@($state.resumptions)+[pscustomobject]@{reason=$Reason;previous_limit=$state.max_rounds;new_limit=$MaxRounds;date=[DateTimeOffset]::UtcNow.ToString('o')}
        $state.max_rounds=$MaxRounds;$state.status='in_progress';$state.convergence=$null
        Save-LocalWork $work;Update-LocalHandoff $work
    }
    'pause' {
        if ($state.status -ne 'in_progress' -or -not $Reason) { throw 'Pausa requer trabalho em andamento e Reason.' }
        $state.pauses=@($state.pauses)+[pscustomobject]@{reason=$Reason;date=[DateTimeOffset]::UtcNow.ToString('o')}
        $state.status='paused'
        Save-LocalWork $work;Update-LocalHandoff $work
    }
    'cancel' {
        if ($state.status -in @('completed','canceled')) { throw 'Trabalho já encerrado; preservar registro anterior.' }
        if (-not $Reason) { throw 'Registre o motivo do cancelamento.' }
        $state.status='canceled';$state.closure=[pscustomobject]@{result='canceled';date=[DateTimeOffset]::UtcNow.ToString('o');reason=$Reason}
        Save-LocalWork $work;Update-LocalHandoff $work
    }
}
[pscustomobject]@{id=$state.id;status=$state.status;rounds=@($state.rounds).Count;active=$localProject.Config.active_work;revision=$state.revision} | ConvertTo-Json
