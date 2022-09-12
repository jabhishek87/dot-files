function Get-Version {
    $VERSION="0.0.1"
    echo "script version $($VERSION)"
    echo "Powershell Version $($PSVersionTable.PSVersion)"
}

function Install-Choco {
    #
    # ----------
    # Chocolatey
    # ----------

    # Install
    Set-ExecutionPolicy Bypass -Scope Process -Force;[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

function Manage-Package {
    echo "Managing Package"
    # Show preinstalled apps
    Get-AppxPackage -AllUsers | Select-Object Name, PackageFullName, Version, NonRemovable, SignatureKind | Format-Table

    # Uninstall Edge stable channel
    $EdgeVersion = (Get-AppxPackage "Microsoft.MicrosoftEdge.Stable" -AllUsers).Version
    $EdgeSetupPath = [Environment]::GetEnvironmentVariable("ProgramFiles(x86)") + '\Microsoft\Edge\Application\' + $EdgeVersion + '\Installer\setup.exe'
    & $EdgeSetupPath --uninstall --system-level --verbose-logging --force-uninstall

    # Uninstall Windows Terminal, manage it through Chocolatey
    Get-AppxPackage Microsoft.WindowsTerminal | Remove-AppPackage
}

function Install-Package {
    # Uncheck only once
    # Manage-Package


    # Chocolatey packages
    $ChocoPackages = @(
        '7zip.install','advanced-ipscanner','bind-toolsonly',
        'choco-cleaner','chocolateygui','cpu-z','crystaldiskinfo',
        'curl','firefox','googlechrome','notepadplusplus.install',
        'docker-desktop','git','go','jdk8','golang','greenshot',
        'gsudo','microsoft-edge-insider-dev', 'nodejs','powershell-core',
        'microsoft-windows-terminal', 'powertoys','python3',
        'sysinternals','vlc','vscode','winget',
        'cascadia-code-nerd-font', 'windirstat'
    )

    # refershenv
    refreshenv

    # Show version
    choco info
    choco list -li

    # Confirm future prompts automatically
    choco feature enable -n allowGlobalConfirmation

    # Install choco packages
    $ChocoPackages | ForEach-Object { choco install $_ }

    # Show installed packages
    choco list -li

    # Install Package Management provider
    Install-PackageProvider -Name NuGet -Force;

}

function VsCode-Manage {
    # use settings sync in vs code to sync features

    # # VS Code extensions
    # $VsCodeThemes = @('GitHub.github-vscode-theme')

    # $VsCodeIcons = @( 'vscode-icons-team.vscode-icons')

    # # Theme
    # $VsCodeThemes | ForEach-Object { code --install-extension $_ }

    # # Icons
    # $VsCodeIcons | ForEach-Object { code --install-extension $_ }

    # List extensions
    code --list-extensions

    # Show status
    code --status
}


function Module-SetUP {
    # PowerShell modules
    $PwshModules = @('PSReadLine','Terminal-Icons','oh-my-posh','posh-git')

    # Install modules
    $PwshModules | ForEach-Object { Install-Module -Name $_ -Force -Verbose }

    # Import modules
    $PwshModules | ForEach-Object { Import-Module -Name $_  -Force -Verbose }

    # List installed modules
    Get-Module

    $OMPModuleDir = (Get-Module oh-my-posh).Path
    Write-Host "oh-my-posh Module location: $($OMPModuleDir)"

    # ------------------
    # PowerShell profile
    # ------------------
    $PSProfileDir = Split-Path -Path $PROFILE -Parent
    Write-Host "PowerShell PSPROFILE location: $($PSProfileDir)"

    $PSProfile = "Microsoft.PowerShell_profile.ps1"
    Copy-Item $PSProfile -Destination $PSProfileDir -Force -Verbose
}

function wsl-install {
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
    wsl --set-default-version 2
    wsl --list --verbose
    # wsl --install -d Ubuntu
}

#############################################
## Advised to Read ONCE before Running
## Some Important things are written in Comments
###########################################

Set-ExecutionPolicy Bypass -Scope Process -Force;
Get-Version
# Install-Choco
# Install-Package
# VsCode-Manage
# wsl-install
Module-SetUP

# disable adding folders to quick Access <search in gooogle>




