# AbhishekJ <abhishekjaiswal.kol@gmail.com>
# Variables
$stopwatch =  [system.diagnostics.stopwatch]::StartNew()
$CheckMark = "✅"
$Timer = "⏱️"

# Show PS version
Write-Host "Loading PowerShell $($PSVersionTable.PSVersion)...`t$CheckMark"

# Import modules
Write-Host "Loading oh-my-posh...`t`t$CheckMark"
Import-Module -Name oh-my-posh
Write-Host "Loading Terminal-Icons...`t$CheckMark"
Import-Module -Name Terminal-Icons
Write-Host "Loading PSReadLine...`t`t$CheckMark"
Import-Module -Name PSReadLine

# Aliases and functions
Set-Alias grep findstr
New-Alias -Name cal -Value Show-Calendar -Force


# PSReadLine options
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -EditMode Windows

# Install-Module defaults
$PSDefaultParameterValues["Install-Module:Scope"] = "CurrentUser"
$PSDefaultParameterValues["Install-Module:Repository"] = "PSGallery"
$PSDefaultParameterValues["Install-Module:SkipDependencies"] = $true
$PSDefaultParameterValues["Install-Module:SkipPublisherCheck"] = $true
$PSDefaultParameterValues["Install-Module:Confirm"] = $false

# function repo { Set-Location "~\repos" }
function home { Set-Location "~" }
function open { explorer . }
function google { Start-Process "https://www.google.com/" }