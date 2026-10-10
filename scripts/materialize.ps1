[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][string]$Project,
    [string]$Stage,
    [string]$Document,
    [string]$Work,
    [switch]$All
)
. (Join-Path $PSScriptRoot 'common.ps1')
$localProject = Get-LocalProject $Project
$catalog = Get-Content -LiteralPath (Join-Path $localProject.Root '.kit/catalog.json') -Raw -Encoding utf8 | ConvertFrom-Json
$scope = if ($Work) { 'work' } else { 'foundation' }
if (-not $All -and -not $Stage -and -not $Document) { throw 'Selecione -Stage, -Document ou -All.' }
if ($All -and $Work) { throw 'Materialize apenas os documentos pertinentes ao trabalho, sem -All.' }
$entries = @($catalog.artifacts | Where-Object {
    $_.scope -eq $scope -and ($All -or ((-not $Stage -or $_.stage -eq $Stage) -and (-not $Document -or $_.id -eq $Document)))
})
if ($entries.Count -eq 0) { throw 'Seleção não encontrada no catálogo.' }
$localWork = if ($Work) { Get-LocalWork $localProject $Work } else { $null }
$results = @()
foreach ($entry in $entries) {
    $source = Get-LocalPath $localProject.Root $entry.template
    $relative = if ($localWork) { "$($localWork.Relative)/$($entry.destination)" } else { [string]$entry.destination }
    $target = Get-LocalPath $localProject.Root $relative
    if (Test-Path -LiteralPath $target) { $results += [pscustomobject]@{id=$entry.id;path=$relative;result='preserved'}; continue }
    $content = Get-Content -LiteralPath $source -Raw -Encoding utf8
    # Rebasear links: usar resultado existente; caso ausente, apontar ao modelo,
    # sem materializar recursivamente etapas que ainda não são necessárias.
    $content = [regex]::Replace($content, '\[([^\]]+)\]\(([^\)]+)\)', {
        param($match)
        $link = $match.Groups[2].Value
        if ($link -match '^(https?://|#|app://|codex://)') { return $match.Value }
        $parts = $link -split '#', 2
        $resolved = [IO.Path]::GetFullPath((Join-Path (Split-Path -Parent $source) $parts[0]))
        $modelPrefix = (Join-Path $localProject.Root '.kit/templates').TrimEnd('\','/') + [IO.Path]::DirectorySeparatorChar
        if ($resolved.StartsWith($modelPrefix, [StringComparison]::OrdinalIgnoreCase)) {
            $modelRelative = $resolved.Substring($modelPrefix.Length).Replace('\','/')
            $candidate = if ($localWork -and $modelRelative.StartsWith('work/')) { Join-Path $localWork.Root $modelRelative.Substring('work/'.Length) } else { Join-Path $localProject.Root "docs/product/$modelRelative" }
            if (Test-Path -LiteralPath $candidate -PathType Leaf) { $resolved = $candidate }
        }
        $relativeLink = [IO.Path]::GetRelativePath((Split-Path -Parent $target), $resolved).Replace('\','/')
        if ($parts.Count -gt 1) { $relativeLink += '#' + $parts[1] }
        return '[' + $match.Groups[1].Value + '](' + $relativeLink + ')'
    })
    Write-LocalText $target $content
    $results += [pscustomobject]@{id=$entry.id;path=$relative;result='template_materialized'}
}
if ($localWork) {
    foreach ($entry in $entries) {
        $localWork.State.artifacts | Add-Member -MemberType NoteProperty -Name $entry.id -Value "$($localWork.Relative)/$($entry.destination)" -Force
    }
    Save-LocalWork $localWork
}
$results | ConvertTo-Json -Depth 5
