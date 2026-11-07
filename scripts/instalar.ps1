# Instala a skill para os agentes selecionados no Windows (PowerShell 5.1+).
[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [ValidateSet('opencode','claude','codex','gemini','cursor','copilot','cline','roo','qwen','kimi','portable','all')]
    [string]$Agent,
    [ValidateSet('user','project')]
    [string]$Scope = 'user',
    [string]$ProjectPath = (Get-Location).Path,
    [switch]$Replace
)
$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $PSScriptRoot
$Name = 'humanizar-natural-ptbr'
$Source = Join-Path $Root "skills\$Name"
if (-not (Test-Path (Join-Path $Source 'SKILL.md') -PathType Leaf)) { throw 'SKILL.md não encontrado.' }
if ($Scope -eq 'project') {
    if (-not (Test-Path $ProjectPath -PathType Container)) { throw "Projeto não encontrado: $ProjectPath" }
    $Base = (Resolve-Path $ProjectPath).Path
} else {
    $Base = $HOME
}
$UserPaths = @{
    opencode = '.config\opencode\skills'; claude = '.claude\skills'; codex = '.codex\skills'
    gemini = '.gemini\skills'; cursor = '.cursor\skills'; copilot = '.copilot\skills'
    cline = '.cline\skills'; roo = '.roo\skills'; qwen = '.qwen\skills'
    kimi = '.kimi-code\skills'; portable = '.agents\skills'
}
$ProjectPaths = @{
    opencode = '.opencode\skills'; claude = '.claude\skills'; codex = '.agents\skills'
    gemini = '.gemini\skills'; cursor = '.cursor\skills'; copilot = '.github\skills'
    cline = '.cline\skills'; roo = '.roo\skills'; qwen = '.qwen\skills'
    kimi = '.kimi-code\skills'; portable = '.agents\skills'
}
$Agents = if ($Agent -eq 'all') { @('opencode','claude','codex','gemini','cursor','copilot','cline','roo','qwen','kimi') } else { @($Agent) }
foreach ($Entry in $Agents) {
    $Relative = if ($Scope -eq 'project') { $ProjectPaths[$Entry] } else { $UserPaths[$Entry] }
    $Parent = Join-Path $Base $Relative
    $Target = Join-Path $Parent $Name
    New-Item -ItemType Directory -Path $Parent -Force | Out-Null
    if (Test-Path $Target) {
        $Item = Get-Item -LiteralPath $Target -Force
        if (($Item.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0) { throw "Link simbólico recusado: $Target" }
        if (-not $Replace) { Write-Host "Já existe (use -Replace): $Target"; continue }
        $Backup = "$Target.backup-$(Get-Date -Format 'yyyyMMdd-HHmmss')-$PID"
        Move-Item -LiteralPath $Target -Destination $Backup
        Write-Host "Backup anterior: $Backup"
    }
    Copy-Item -LiteralPath $Source -Destination $Target -Recurse
    Write-Host "Instalado [$Entry]: $Target"
}
Write-Host 'Confira o reconhecimento na interface do agente; instalar não garante ativação.'
