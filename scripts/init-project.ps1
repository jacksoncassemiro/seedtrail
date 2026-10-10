#Requires -Version 7.2
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)][string]$Destination,
    [Parameter(Mandatory=$true)][ValidateNotNullOrEmpty()][string]$Name,
    [ValidatePattern('^[a-z]{2,3}(-[A-Za-z0-9]{2,8})*$')][string]$Language='pt-BR',
    [ValidateSet('desk','mixed')][string]$ResearchMode='desk',
    [ValidateSet('idea','feature','fix','design','architecture','research')][string]$WorkType='idea',
    [ValidateSet('lean','complete')][string]$Structure='lean',
    [ValidateSet('guided','continuous')][string]$ExecutionMode='guided'
)
. (Join-Path $PSScriptRoot 'common.ps1')
$kitRoot=[IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
$modelRoot=Join-Path $kitRoot 'templates'
$destination=[IO.Path]::GetFullPath($ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Destination))
if ($destination -eq $kitRoot -or $destination.StartsWith($kitRoot+[IO.Path]::DirectorySeparatorChar,[StringComparison]::OrdinalIgnoreCase)) { throw 'Escolha destino fora do kit.' }
if (Test-Path -LiteralPath $destination) { throw 'Destino existente; nada foi sobrescrito.' }
$modelFiles=@(Get-ChildItem -LiteralPath $modelRoot -File -Recurse -Force)
$aliases=@{context='context';research='research';definition='product';business='business';experience='experience';brand='brand';engineering='engineering';quality='quality';delivery='delivery';operations='operations';evolution='evolution';reviews='reviews'}
$catalog=@();$copies=@()
foreach ($file in $modelFiles) {
    $relative=[IO.Path]::GetRelativePath($modelRoot,$file.FullName).Replace('\','/')
    if ($relative.StartsWith('docs/product/')) {
        $artifactRelative=$relative.Substring('docs/product/'.Length)
        $isProductIndex=$artifactRelative -eq 'README.md'
        $group=if($isProductIndex){'context'}else{($artifactRelative -split '/')[0]}
        if (-not $aliases.ContainsKey($group) -and $group -ne 'work') { throw "Grupo de artefato desconhecido: $group" }
        $scope=if($group -eq 'work'){'work'}else{'foundation'}
        $stage=if($group -eq 'work'){
            if($file.BaseName -eq 'research'){'research'}elseif($file.BaseName -eq 'decision'){'reviews'}else{'slice'}
        }else{$aliases[$group]}
        $id=if($isProductIndex){'product-guide'}elseif($file.BaseName -eq 'README'){"$stage-guide"}else{$file.BaseName.Replace('_','-')}
        $output=if($scope -eq 'work'){$artifactRelative.Substring('work/'.Length)}else{$relative}
        $catalog += [ordered]@{id=$id;stage=$stage;scope=$scope;template=".kit/templates/$artifactRelative";destination=$output}
        $copies += [pscustomobject]@{Source=$file.FullName;Relative=".kit/templates/$artifactRelative"}
        $initialContext = $group -eq 'context' -and $file.BaseName -ne 'artifact-register'
        if ($initialContext -or ($Structure -eq 'complete' -and $scope -eq 'foundation')) { $copies += [pscustomobject]@{Source=$file.FullName;Relative=$relative} }
    } else { $copies += [pscustomobject]@{Source=$file.FullName;Relative=$relative} }
}
# Copiar todos os destinos antes de resolver links.
foreach ($copy in $copies) {
    $target=Join-Path $destination $copy.Relative
    New-Item -ItemType Directory -Path (Split-Path -Parent $target) -Force | Out-Null
    Copy-Item -LiteralPath $copy.Source -Destination $target
}
foreach ($scriptName in @('common.ps1','materialize.ps1','work.ps1')) {
    $target=Join-Path $destination ".kit/scripts/$scriptName"
    New-Item -ItemType Directory -Path (Split-Path -Parent $target) -Force | Out-Null
    Copy-Item -LiteralPath (Join-Path $PSScriptRoot $scriptName) -Destination $target
}
Copy-Item -LiteralPath (Join-Path $kitRoot 'LICENSE') -Destination (Join-Path $destination '.kit/LICENSE')
$credits=Get-Content -LiteralPath (Join-Path $kitRoot 'docs/pt-BR/CREDITS.md') -Raw -Encoding utf8
$credits=[regex]::Replace($credits,'(?s)<!-- docs-nav:start -->.*?<!-- docs-nav:end -->\s*','')
$credits=$credits.Replace('(process/REFERENCES.md)','(REFERENCES.md)').Replace('(process/METHODS.md)','(METHODS.md)').Replace('(../../LICENSE)','(LICENSE)').Replace('(KNOWLEDGE.md)','(ORGANIZATION.md)')
Write-LocalText (Join-Path $destination '.kit/CREDITS.md') $credits
foreach ($copy in $copies | Where-Object {$_.Source.EndsWith('.md')}) {
    $target=Join-Path $destination $copy.Relative
    $content=Get-Content -LiteralPath $copy.Source -Raw -Encoding utf8
    $content=[regex]::Replace($content,'\[([^\]]+)\]\(([^\)]+)\)',{
        param($match)
        $link=$match.Groups[2].Value
        if($link -match '^(https?://|#|app://|codex://)'){return $match.Value}
        $parts=$link -split '#',2
        $resolved=[IO.Path]::GetFullPath((Join-Path (Split-Path -Parent $copy.Source) $parts[0]))
        $prefix=$modelRoot+[IO.Path]::DirectorySeparatorChar
        if($resolved.StartsWith($prefix,[StringComparison]::OrdinalIgnoreCase)){
            $relative=[IO.Path]::GetRelativePath($modelRoot,$resolved)
            $actual=Join-Path $destination $relative
            $resolved=if($relative.Replace('\','/').StartsWith('docs/product/') -and -not (Test-Path -LiteralPath $actual)) { Join-Path $destination ('.kit/templates/'+$relative.Substring('docs/product/'.Length)) } else { $actual }
        }
        $rebased=[IO.Path]::GetRelativePath((Split-Path -Parent $target),$resolved).Replace('\','/')
        if($parts.Count -gt 1){$rebased+='#'+$parts[1]}
        return '['+$match.Groups[1].Value+']('+$rebased+')'
    })
    Write-LocalText $target $content
}
$stages=@{idea='discovery';feature='impact-analysis';fix='assessment';design='experience';architecture='technical-analysis';research='research'}
Write-LocalJson (Join-Path $destination '.kit/project.json') ([ordered]@{
    name=$Name;kit_version='0.1.0';output_language=$Language;template_language='pt-BR';research_mode=$ResearchMode
    work_type=$WorkType;current_phase=$stages[$WorkType];mode='local-independent';structure=$Structure
    active_work=$null;historical_sources=@();naming_language='en';execution_mode=$ExecutionMode
    note=$(if($Language -like 'pt*'){'Modelos são preparação; entregas são elaboradas sob demanda no idioma configurado. Helpers não executam o assistente nem certificam evidências.'}else{'Templates are preparation; deliverables are authored on demand in output_language. Helpers do not execute the assistant or certify evidence.'})
})
Write-LocalJson (Join-Path $destination '.kit/catalog.json') ([ordered]@{kit_version='0.1.0';artifacts=$catalog})
Write-Output "Instância local 0.1.0 ($Structure) criada em $destination. Leia AGENTS.md, .kit/ORGANIZATION.md e .kit/CATALOG.md."
