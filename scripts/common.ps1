# Funções internas do kit local 0.1.0. Não executam o assistente.
$ErrorActionPreference = 'Stop'

function Get-LocalProject([string]$Project) {
    $root = [IO.Path]::GetFullPath($Project)
    if (-not (Test-Path -LiteralPath (Join-Path $root '.kit/project.json') -PathType Leaf)) { throw 'Projeto local não encontrado.' }
    $configBytes = [IO.File]::ReadAllBytes((Join-Path $root '.kit/project.json'))
    $config = [Text.Encoding]::UTF8.GetString($configBytes) | ConvertFrom-Json
    if ($config.mode -ne 'local-independent') { throw 'Este helper atende somente ao kit local independente.' }
    return [pscustomobject]@{Root=$root;Config=$config;ConfigHash=[Convert]::ToHexString([Security.Cryptography.SHA256]::HashData($configBytes))}
}

function Get-LocalPath([string]$Root, [string]$Relative) {
    if ([IO.Path]::IsPathRooted($Relative) -or [string]::IsNullOrWhiteSpace($Relative)) { throw 'Informe um caminho relativo ao projeto.' }
    $path = [IO.Path]::GetFullPath((Join-Path $Root $Relative))
    $prefix = $Root.TrimEnd('\','/') + [IO.Path]::DirectorySeparatorChar
    if (-not $path.StartsWith($prefix, [StringComparison]::OrdinalIgnoreCase)) { throw 'Caminho fora do projeto.' }
    $cursor = $path
    while ($cursor.Length -ge $Root.Length) {
        if (Test-Path -LiteralPath $cursor) {
            if ((Get-Item -LiteralPath $cursor -Force).Attributes -band [IO.FileAttributes]::ReparsePoint) { throw 'Junction/symlink não permitido para gravação ou evidência pelo helper.' }
        }
        if ($cursor -eq $Root) { break }
        $cursor = Split-Path -Parent $cursor
    }
    return $path
}

function Write-LocalText([string]$Path, [string]$Text) {
    $parent = Split-Path -Parent $Path
    if (-not (Test-Path -LiteralPath $parent)) { New-Item -ItemType Directory -Path $parent -Force | Out-Null }
    $tmp = "$Path.$([guid]::NewGuid().ToString('N')).tmp"
    [IO.File]::WriteAllText($tmp, $Text, [Text.UTF8Encoding]::new($false))
    try { [IO.File]::Move($tmp,$Path,$true) }
    finally { if(Test-Path -LiteralPath $tmp){Remove-Item -LiteralPath $tmp} }
}

function Write-LocalJson([string]$Path, $Value) { Write-LocalText $Path (($Value | ConvertTo-Json -Depth 20) + "`n") }

# Curta proteção entre processos locais. Não coordena máquinas ou editores externos.
function Invoke-LocalWriteLock([string]$Path, [scriptblock]$Operation) {
    $identity=[IO.Path]::GetFullPath($Path)
    if([OperatingSystem]::IsWindows()){$identity=$identity.ToUpperInvariant()}
    $digest=[Convert]::ToHexString([Security.Cryptography.SHA256]::HashData([Text.Encoding]::UTF8.GetBytes($identity)))
    $mutex=[Threading.Mutex]::new($false,'Seedtrail-'+$digest)
    $held=$false
    try {
        try {$held=$mutex.WaitOne(5000)} catch [Threading.AbandonedMutexException] {$held=$true}
        if(-not $held){throw 'Arquivo ocupado por outro helper. Aguarde e recarregue o estado.'}
        & $Operation
    } finally {
        if($held){$mutex.ReleaseMutex()}
        $mutex.Dispose()
    }
}

function Write-LocalCheckedJson([string]$Path, $Value, [AllowNull()][string]$ExpectedHash) {
    $expected=if([string]::IsNullOrEmpty($ExpectedHash)){$null}else{$ExpectedHash}
    Invoke-LocalWriteLock $Path {
        $actual=if(Test-Path -LiteralPath $Path -PathType Leaf){(Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash}else{$null}
        if($actual -ne $expected){throw 'Conflito de gravação: o arquivo mudou desde a leitura. Recarregue e reconcilie; nada foi sobrescrito.'}
        Write-LocalJson $Path $Value
        (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash
    }
}

function Save-LocalProject($Project) {
    $Project.ConfigHash=Write-LocalCheckedJson (Get-LocalPath $Project.Root '.kit/project.json') $Project.Config $Project.ConfigHash
}

function Get-LocalWork($Project, [string]$Id) {
    if ($Id) {
        if ($Id -notmatch '^[A-Za-z][A-Za-z0-9-]{2,79}$') { throw 'ID inválido. Use letras, números e hífens, sem caminho.' }
        $relative = "docs/product/work/$Id"
    } else {
        $relative = [string]$Project.Config.active_work
        if (-not $relative) { throw 'Nenhum trabalho ativo. Informe -Id ou selecione um trabalho; não usar a pasta mais recente.' }
        if ($relative -notmatch '^docs/product/work/[A-Za-z][A-Za-z0-9-]{2,79}$') { throw 'Trabalho ativo inválido.' }
    }
    $root = Get-LocalPath $Project.Root $relative
    $statePath = Get-LocalPath $Project.Root "$relative/state.json"
    if (-not (Test-Path -LiteralPath $statePath -PathType Leaf)) { throw 'Estado do trabalho não encontrado.' }
    $stateBytes=[IO.File]::ReadAllBytes($statePath)
    $state = [Text.Encoding]::UTF8.GetString($stateBytes) | ConvertFrom-Json
    if ($state.id -ne (Split-Path -Leaf $root)) { throw 'ID e caminho do trabalho divergentes.' }
    return [pscustomobject]@{Root=$root;Relative=$relative;StatePath=$statePath;State=$state;Language=$Project.Config.output_language;ExpectedHash=[Convert]::ToHexString([Security.Cryptography.SHA256]::HashData($stateBytes))}
}

function Get-LocalEvidence($Project, [string[]]$Paths) {
    if (-not $Paths -or $Paths.Count -eq 0) { throw 'Informe evidências recuperáveis no projeto.' }
    $result = @()
    foreach ($item in $Paths) {
        $absolute = Get-LocalPath $Project.Root $item
        if (-not (Test-Path -LiteralPath $absolute -PathType Leaf) -or (Get-Item -LiteralPath $absolute).Length -eq 0) { throw "Evidência inexistente ou vazia: $item" }
        $result += [pscustomobject]@{path=$item.Replace('\','/');sha256=(Get-FileHash -LiteralPath $absolute -Algorithm SHA256).Hash}
    }
    return $result
}

function Save-LocalWork($Work) {
    $previousRevision=$Work.State.revision
    $previousDate=$Work.State.updated_at
    $Work.State.revision = [int]$previousRevision + 1
    $Work.State.updated_at = [DateTimeOffset]::UtcNow.ToString('o')
    try {$Work.ExpectedHash=Write-LocalCheckedJson $Work.StatePath $Work.State $Work.ExpectedHash}
    catch {$Work.State.revision=$previousRevision;$Work.State.updated_at=$previousDate;throw}
}

function Update-LocalHandoff($Work) {
    Invoke-LocalWriteLock $Work.StatePath {
    # Resumo derivado usa o estado mais recente, não uma sessão antiga.
    $Work.State=Get-Content -LiteralPath $Work.StatePath -Raw -Encoding utf8 | ConvertFrom-Json
    $last = @($Work.State.rounds) | Select-Object -Last 1
    $pt = $Work.Language -like 'pt*'
    $next = if ($last) { $last.next_step } elseif ($pt) { 'Elaborar critérios e executar o próximo passo pertinente.' } else { 'Define criteria and perform the relevant next step.' }
    if ($Work.State.status -eq 'completed') { $next=if($pt){'Trabalho encerrado. Consultar resultado, limites e pendências; criar trabalho vinculado se surgir novo escopo.'}else{'Work completed. Consult results, limits and open questions; create a linked work item for new scope.'} }
    elseif ($Work.State.status -eq 'canceled') { $next=if($pt){'Trabalho cancelado. Consultar motivo em closure; não retomar como se estivesse em execução.'}else{'Work canceled. Consult closure; do not resume as an active work item.'} }
    elseif ($Work.State.status -eq 'paused') { $pause=@($Work.State.pauses) | Select-Object -Last 1; $next=if($pt){"Resolver a causa da pausa: $($pause.reason). Consultar o próximo passo no último registro antes de retomar."}else{"Resolve the pause reason: $($pause.reason). Consult the last round before resuming."} }
    $labels=@{in_progress='em andamento';completed='concluído';canceled='cancelado';paused='pausado';no_progress='sem progresso';limit_reached='limite atingido';blocked='impedido';failed='falha'}
    $status=if($pt -and $labels.ContainsKey([string]$Work.State.status)){$labels[[string]$Work.State.status]}else{$Work.State.status}
    $text = if ($pt) {
        "# Retomada: $($Work.State.id)`n`nEstado: $status. Rodadas: $(@($Work.State.rounds).Count)/$($Work.State.max_rounds).`n`nObjetivo: $($Work.State.objective)`n`nOrigem: $($Work.State.origin)`n`nPróximo passo: $next`n`nLeia [estado e evidências](state.json) e [intenção](brief.md). Resumo derivado; decisões e resultados ficam nos arquivos responsáveis.`n"
    } else {
        "# Handoff: $($Work.State.id)`n`nStatus: $($Work.State.status). Rounds: $(@($Work.State.rounds).Count)/$($Work.State.max_rounds).`n`nObjective: $($Work.State.objective)`n`nOrigin: $($Work.State.origin)`n`nNext step: $next`n`nRead [state and evidence](state.json) and [intent](brief.md). Derived summary; decisions and results remain in their responsible artifacts.`n"
    }
    Write-LocalText (Join-Path $Work.Root 'handoff.md') $text
    }
}
