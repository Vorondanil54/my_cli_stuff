#=============== PowerToys — Command Not Found ===============

#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58

#=============== Folders Quick Access ===============

# Here I place functions to do "Set-Location" commands for quick access of my work and other important and cool folders/directories

#=============== Personal Commands ===============

# === Text Editor — Nano ===
function clear-nano-backup { Remove-Item -Path "~/.nano/backup/*" -Recurse -Force }
function check-nano-backup { Get-ChildItem -Path "~/.nano/backup" }

#=============== Utils Batch Commands ===============

function ezals { eza -l -F=always --color=always --color-scale=all --icons=always -a --group-directories-first -h --loc=lines -m --git --git-repos --no-user }

function matrix { rusty-rain --shade --group large-letters }

#=============== Info Fetching ===============

# === Fastfetch ===
fastfetch

# === Oh My Posh ===
oh-my-posh init pwsh --config ~/.mytheme.omp.json | Invoke-Expression

# === Onefetch ===
# git repository greeter

# Set the console output encoding to UTF-8, so that special characters are displayed correctly when piping to Write-Host
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$global:lastRepository = $null

function Check-DirectoryForNewRepository {
    $currentRepository = git rev-parse --show-toplevel 2>$null
    if ($currentRepository -and ($currentRepository -ne $global:lastRepository)) {
        onefetch --nerd-fonts --true-color always | Write-Host
    }
    $global:lastRepository = $currentRepository
}

function Set-Location {
    Microsoft.PowerShell.Management\Set-Location @args
    Check-DirectoryForNewRepository
}

# Optional: Check the repository also when opening a shell directly in a repository directory
# Uncomment the following line if desired
Check-DirectoryForNewRepository
