#Requires -Version 7.2
[CmdletBinding()]
param(
    [string]$KitPath=(Join-Path $PSScriptRoot '..'),
    [string[]]$Projects=@(),
    [string]$ReportPath
)
$ErrorActionPreference='Stop'
$root=[IO.Path]::GetFullPath($KitPath)
$catalog=Get-Content -LiteralPath (Join-Path $root 'docs/catalog.json') -Raw -Encoding utf8 | ConvertFrom-Json
$errors=[Collections.Generic.List[string]]::new()
$pages=[Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
$sourcePages=@{}
$skillSources=[Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
$pageLocales=@{}
$links=0;$referenceCount=0
function Relative-To([string]$From,[string]$To){[IO.Path]::GetRelativePath($From,$To).Replace('\','/')}
function Normalize-Text([string]$Text){$Text.Replace("`r`n","`n").Trim()}
foreach($entry in $catalog.entries){
    foreach($locale in $catalog.locales){
        $rel=[string]$entry.pages.$locale
        $rootGuide=$locale -eq 'en' -and $rel -in @('CONTRIBUTING.md','SECURITY.md')
        if(-not $rel -or (-not $rel.StartsWith("docs/$locale/") -and -not $rootGuide)){ $errors.Add("Par inválido: $($entry.key)/$locale");continue }
        $path=[IO.Path]::GetFullPath((Join-Path $root $rel))
        if(-not $pages.Add($path)){ $errors.Add("Página duplicada: $rel") }
        $pageLocales[$path]=$locale
        if(-not(Test-Path -LiteralPath $path -PathType Leaf)){ $errors.Add("Página ausente: $rel");continue }
        $body=Get-Content -LiteralPath $path -Raw -Encoding utf8
        $nav=[regex]::Match($body,'(?s)^<!-- docs-nav:start -->(.*?)<!-- docs-nav:end -->')
        if(-not $nav.Success){$errors.Add("Seletor ausente: $rel");continue}
        $other=if($locale -eq 'en'){'pt-BR'}else{'en'}
        $counterpart=Relative-To (Split-Path -Parent $path) (Join-Path $root $entry.pages.$other)
        $docHome=Relative-To (Split-Path -Parent $path) (Join-Path $root $(if($locale -eq 'en'){'README.md'}else{'README.pt-BR.md'}))
        $index=Relative-To (Split-Path -Parent $path) (Join-Path $root "docs/$locale/README.md")
        foreach($expected in @($counterpart,$docHome,$index)){
            if(-not $nav.Value.Contains("($expected)")){$errors.Add("Navegação incompleta: $rel -> $expected")}
        }
    }
    if($entry.source){
        $referenceCount++
        $source=[IO.Path]::GetFullPath((Join-Path $root $entry.source))
        $sourcePages[$source]=$entry
        if(-not(Test-Path -LiteralPath $source -PathType Leaf)){ $errors.Add("Fonte operacional ausente: $($entry.source)");continue }
        if((Get-FileHash -LiteralPath $source -Algorithm SHA256).Hash -ne $entry.source_sha256){$errors.Add("Fonte mudou; revisar traduções/hash: $($entry.source)")}
    }
}
foreach($skill in $catalog.skills){
    $source=[IO.Path]::GetFullPath((Join-Path $root $skill.source))
    if(-not $skillSources.Add($source)){$errors.Add("Skill duplicada no catálogo: $($skill.id)")}
    $sourcePages[$source]=$skill
    if($skill.language -ne 'en'){$errors.Add("Idioma canônico incorreto: $($skill.id)")}
    if(-not(Test-Path -LiteralPath $source -PathType Leaf)){$errors.Add("Skill ausente: $($skill.source)");continue}
    if((Get-FileHash -LiteralPath $source).Hash -ne $skill.source_sha256){$errors.Add("Fonte mudou; revisar catálogo: $($skill.source)")}
}
# Reading copies must not silently change the Portuguese operational procedure.
foreach($source in $sourcePages.Keys){
    if($skillSources.Contains($source)){continue}
    $entry=$sourcePages[$source]
    $target=Join-Path $root $entry.pages.'pt-BR'
    if(-not(Test-Path -LiteralPath $target)){continue}
    $content=(Get-Content -LiteralPath $source -Raw -Encoding utf8).Replace("`r`n","`n")
    $content=[regex]::Replace($content,'\[([^\]]+)\]\(([^)]+)\)',{
        param($m)
        $link=$m.Groups[2].Value
        if($link -match '^(https?://|#|app://|codex://|mailto:)'){return $m.Value}
        $parts=$link -split '#',2
        $resolved=[IO.Path]::GetFullPath((Join-Path (Split-Path -Parent $source) $parts[0]))
        $dest=if($sourcePages.ContainsKey($resolved) -and -not $skillSources.Contains($resolved)){Join-Path $root $sourcePages[$resolved].pages.'pt-BR'}elseif($resolved -eq (Join-Path $root 'templates/.kit/LICENSE')){Join-Path $root 'LICENSE'}elseif($resolved -eq (Join-Path $root 'templates/.kit/CREDITS.md')){Join-Path $root 'docs/pt-BR/CREDITS.md'}else{$resolved}
        $rebased=Relative-To (Split-Path -Parent $target) $dest
        if($parts.Count -gt 1){$rebased+='#'+$parts[1]}
        '['+$m.Groups[1].Value+']('+$rebased+')'
    })
    if($entry.source.StartsWith('templates/.agents/skills/')){
        $content=[regex]::Replace($content,'(?s)^---\n(.*?)\n---\n',"``````yaml`n`$1`n```````n")
    }
    $actual=Get-Content -LiteralPath $target -Raw -Encoding utf8
    $actual=[regex]::Replace($actual,'(?s)^<!-- docs-nav:start -->.*?<!-- docs-nav:end -->\s*','')
    $note='Referência de leitura; fonte operacional: `'+$entry.source+'`. Esta página não é uma skill instalada nem uma entrega elaborada do projeto.'
    if(-not $actual.StartsWith($note)){$errors.Add("Origem de leitura ausente: $($entry.pages.'pt-BR')");continue}
    $actual=$actual.Substring($note.Length)
    if((Normalize-Text $content) -ne (Normalize-Text $actual)){$errors.Add("Referência portuguesa diverge da fonte: $($entry.source)")}
}
# Include hidden .kit/.agents directories. Links and obsolete plain-text names are separate checks.
$roots=@($root)+@($Projects | ForEach-Object {[IO.Path]::GetFullPath($_)})
$stale='\b(?:0[0-9]|1[01])_(?:context|research|product|business|experience|brand|engineering|quality|delivery|operations|evolution|reviews)\b|execution\.stage\b|fase_atual\b|(?:kit-produto|locus-descoberta|kit-spec-kit|locus-spec-kit|planejamento/processo)\b|(?:ORGANIZACAO|CATALOGO|REFERENCIAS|PADROES|CICLOS|FLUXOS)\.md\b|extensão de harvest'
$files=0
$jsonFiles=0
function Test-ProjectReference([string]$ProjectRoot,[string]$Relative,[string]$Origin,[switch]$RequireFile){
    if([string]::IsNullOrWhiteSpace($Relative)){$errors.Add("Referência vazia: $Origin");return}
    $absolute=[IO.Path]::GetFullPath((Join-Path $ProjectRoot $Relative))
    if(-not $absolute.StartsWith($ProjectRoot.TrimEnd('\','/')+[IO.Path]::DirectorySeparatorChar,[StringComparison]::OrdinalIgnoreCase)){$errors.Add("Referência fora do projeto: $Origin -> $Relative");return}
    if($RequireFile -and -not(Test-Path -LiteralPath $absolute -PathType Leaf)){$errors.Add("Referência JSON ausente: $Origin -> $Relative")}
}
$historicalFiles=[Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
foreach($projectRoot in @($roots | Where-Object {$_ -ne $root})){
    $configPath=Join-Path $projectRoot '.kit/project.json'
    if(-not(Test-Path -LiteralPath $configPath -PathType Leaf)){continue}
    $config=Get-Content -LiteralPath $configPath -Raw -Encoding utf8 | ConvertFrom-Json
    $archivePrefix=[IO.Path]::GetFullPath((Join-Path $projectRoot 'docs/product/sources'))+[IO.Path]::DirectorySeparatorChar
    foreach($relative in @($config.historical_sources)){
        if([string]::IsNullOrWhiteSpace([string]$relative)){continue}
        $source=[IO.Path]::GetFullPath((Join-Path $projectRoot ([string]$relative)))
        if(-not $source.StartsWith($archivePrefix,[StringComparison]::OrdinalIgnoreCase)){
            $errors.Add("Fonte histórica fora do arquivo de fontes: $relative");continue
        }
        if(-not(Test-Path -LiteralPath $source -PathType Leaf)){$errors.Add("Fonte histórica ausente: $relative");continue}
        $expected=$null
        if($null -ne $config.historical_source_hashes){$expected=$config.historical_source_hashes.PSObject.Properties[[string]$relative].Value}
        if($expected -notmatch '^[A-Fa-f0-9]{64}$' -or (Get-FileHash -LiteralPath $source).Hash -ne $expected){
            $errors.Add("Hash de fonte histórica ausente ou divergente: $relative");continue
        }
        if(-not $historicalFiles.Add($source)){$errors.Add("Fonte histórica repetida: $relative")}
    }
}
foreach($scanRoot in $roots){
    foreach($file in Get-ChildItem -LiteralPath $scanRoot -Recurse -Force -File -Filter '*.md'){
        $files++
        # Preserved imports are data, not current instructions. Check their
        # registered bytes above; do not rewrite obsolete links/names in them.
        if($historicalFiles.Contains($file.FullName)){continue}
        $body=Get-Content -LiteralPath $file.FullName -Raw -Encoding utf8
        if($body -match $stale){$errors.Add("Nome/campo antigo no texto: $($file.FullName)")}
        $locale=if($pageLocales.ContainsKey($file.FullName)){$pageLocales[$file.FullName]}else{$null}
        $nav=[regex]::Match($body,'(?s)^<!-- docs-nav:start -->.*?<!-- docs-nav:end -->').Value
        foreach($m in [regex]::Matches($body,'\[[^\]]+\]\(([^)]+)\)')){
            $link=$m.Groups[1].Value
            if($link -match '^(https?://|#|app://|codex://|mailto:)'){continue}
            $links++
            $resolved=[IO.Path]::GetFullPath((Join-Path $file.DirectoryName (($link -split '#',2)[0])))
            $virtual=$scanRoot -eq $root -and $resolved -in @((Join-Path $root 'templates/.kit/CREDITS.md'),(Join-Path $root 'templates/.kit/LICENSE'))
            if(-not(Test-Path -LiteralPath $resolved) -and -not $virtual){$errors.Add("Link ausente: $(Relative-To $scanRoot $file.FullName) -> $link")}
            if($locale){
                $other=if($locale -eq 'en'){'pt-BR'}else{'en'}
                if($pageLocales.ContainsKey($resolved) -and $pageLocales[$resolved] -eq $other -and -not $nav.Contains($m.Value)){$errors.Add("Troca de idioma fora do seletor: $($file.FullName) -> $link")}
                if($resolved.StartsWith((Join-Path $root 'templates/'),[StringComparison]::OrdinalIgnoreCase) -and -not $skillSources.Contains($resolved)){$errors.Add("Manual aponta à fonte sem tradução: $($file.FullName) -> $link")}
            }
        }
        # Validate fully specified artifact destinations in prose/code, including not-yet-materialized models.
        foreach($m in [regex]::Matches($body,'(?<![A-Za-z0-9/])docs/product/[A-Za-z0-9_./-]+\.md\b')){
            $rel=$m.Value
            if($rel -match '^docs/product/work/(?:ID|WRK-ID)/'){continue}
            $actual=Join-Path $scanRoot $rel
            $model=if($scanRoot -eq $root){Join-Path $root "templates/$rel"}else{Join-Path $scanRoot ('.kit/templates/'+$rel.Substring('docs/product/'.Length))}
            # Method examples can use any valid work ID. Resolve their artifact
            # against the work model; authored product references stay concrete.
            $fileRel=Relative-To $scanRoot $file.FullName
            $methodFile=$fileRel -match '^(?:templates/\.kit/|docs/(?:en|pt-BR)/|\.kit/)'
            if($methodFile -and $rel -match '^docs/product/work/[A-Za-z][A-Za-z0-9-]{2,79}/(.+\.md)$'){
                $artifact=$Matches[1]
                $model=if($scanRoot -eq $root){Join-Path $root "templates/docs/product/work/$artifact"}else{Join-Path $scanRoot ".kit/templates/work/$artifact"}
            }
            if(-not(Test-Path -LiteralPath $actual) -and -not(Test-Path -LiteralPath $model)){$errors.Add("Destino citado sem arquivo/modelo: $($file.FullName) -> $rel")}
        }
    }
}
foreach($path in @('CREDITS.md','CHANGELOG.md','docs/en/CONTRIBUTING.md','docs/en/SECURITY.md','docs/en/skills','docs/pt-BR/skills')){
    if(Test-Path -LiteralPath (Join-Path $root $path)){$errors.Add("Destino documental redundante: $path")}
}
# Verify consumed JSON fields, not historical original_path/old digest records.
foreach($projectRoot in @($roots | Where-Object {$_ -ne $root})){
    foreach($name in @('project','catalog')){
        $path=Join-Path $projectRoot ".kit/$name.json"
        if(-not(Test-Path -LiteralPath $path -PathType Leaf)){$errors.Add("Configuração ausente: $path");continue}
        $jsonFiles++
        $value=Get-Content -LiteralPath $path -Raw -Encoding utf8 | ConvertFrom-Json
        if($name -eq 'project'){
            if($value.PSObject.Properties.Name -contains 'fase_atual'){$errors.Add("Campo antigo em $path")}
            if($value.active_work){Test-ProjectReference $projectRoot ($value.active_work+'/state.json') $path -RequireFile}
        }else{
            foreach($artifact in $value.artifacts){
                Test-ProjectReference $projectRoot $artifact.template "$path/template" -RequireFile
                if($artifact.scope -eq 'foundation'){
                    Test-ProjectReference $projectRoot $artifact.destination "$path/destination"
                    if(-not $artifact.destination.StartsWith('docs/product/')){$errors.Add("Destino fora da documentação: $path -> $($artifact.destination)")}
                }
            }
        }
    }
    $workRoot=Join-Path $projectRoot 'docs/product/work'
    if(Test-Path -LiteralPath $workRoot){
        foreach($file in Get-ChildItem -LiteralPath $workRoot -Filter state.json -File -Recurse){
            $jsonFiles++
            $value=Get-Content -LiteralPath $file.FullName -Raw -Encoding utf8 | ConvertFrom-Json
            if($value.execution.PSObject.Properties.Name -contains 'stage'){$errors.Add("execution.stage antigo: $($file.FullName)")}
            foreach($artifact in $value.artifacts.PSObject.Properties){Test-ProjectReference $projectRoot ([string]$artifact.Value) $file.FullName -RequireFile}
            foreach($criterion in $value.criteria){foreach($proof in $criterion.evidence){Test-ProjectReference $projectRoot $proof.path $file.FullName -RequireFile}}
            foreach($proof in $value.convergence.evidence){Test-ProjectReference $projectRoot $proof.path $file.FullName -RequireFile}
        }
    }
}
$undocumented=@(Get-ChildItem -LiteralPath (Join-Path $root 'templates') -Recurse -Force -File -Filter '*.md' | Where-Object {-not $sourcePages.ContainsKey($_.FullName)})
foreach($file in $undocumented){$errors.Add("Fonte sem par de leitura: $($file.FullName)")}
foreach($locale in $catalog.locales){
    foreach($file in Get-ChildItem -LiteralPath (Join-Path $root "docs/$locale") -Recurse -File -Filter '*.md'){
        if(-not $pages.Contains($file.FullName)){$errors.Add("Página sem catálogo/par: $($file.FullName)")}
    }
}
$result=[ordered]@{status=$(if($errors.Count){'failed'}else{'passed'});pairs=@($catalog.entries).Count;operational_references=$referenceCount;canonical_skills=$skillSources.Count;files=$files;local_links=$links;json_files=$jsonFiles;historical_sources_checked=$historicalFiles.Count;projects=$Projects;errors=@($errors);limits='Verifica estrutura, nomes conhecidos, links sem âncoras, campos JSON consumidos, sincronização portuguesa e ausência dos destinos redundantes conhecidos. Fontes históricas declaradas em docs/product/sources têm bytes conferidos, sem interpretar suas referências antigas como instruções vigentes. Skills completas têm fonte única em inglês. Equivalência semântica das traduções e evidências de produto exigem revisão.'}
if($ReportPath){$result | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $ReportPath -Encoding utf8}
$result | ConvertTo-Json -Depth 8
if($errors.Count){exit 1}
