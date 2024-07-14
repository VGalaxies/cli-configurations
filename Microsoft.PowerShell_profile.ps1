# oh-my-posh
oh-my-posh init pwsh --config 'C:\Users\admin\AppData\Local\Programs\oh-my-posh\themes\half-life.omp.json' | Invoke-Expression

# posh-git
Import-Module posh-git
$env:POSH_GIT_ENABLED = $true

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# auto suggestions
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History

# ls color
Import-Module PSColor

# alias
function gta { git add . }
function gts { git status }
function gtf { git diff }
function gtp { git push }
function gtl { git log }
function gtc { git commit }

# iotdb
$codebasePath = "C:\Documents\codebase"
$configPath = "C:\Documents\iotdb\configs"

function IOTCLI {
    param (
        [Parameter(Mandatory=$true)]
        [int]$p
    )
    
    $path = "$codebasePath\iotdb\distribution\target\apache-iotdb-1.3.3-SNAPSHOT-all-bin\apache-iotdb-1.3.3-SNAPSHOT-all-bin"
    Set-Location -Path $path
    
    $startCliScript = ".\sbin\start-cli.bat"
    $arguments = "-h 127.0.0.1 -p $p"
    
    Start-Process -FilePath $startCliScript -ArgumentList $arguments -NoNewWindow -Wait
}

function IOTA {
    IOTCLI -p 6667
}

function IOTB {
    IOTCLI -p 6668
}

function BENCHMARK {
    $targetPath = "$codebasePath\iot-benchmark\iotdb-1.3\target\iot-benchmark-iotdb-1.3\iot-benchmark-iotdb-1.3"
    $benchmarkFile = ".\benchmark.bat"

    Set-Location -Path $targetPath

    Start-Process -FilePath $benchmarkFile -NoNewWindow -Wait
}

function IOTCL {
    param (
        [Parameter(Mandatory=$true)]
        [string]$dir,

        [switch]$force
    )

    # Check if the directory exists
    if (-Not (Test-Path -Path $dir)) {
        return
    }

    if ($force) {
        Remove-Item -Path $dir -Recurse -Force
        return
    }

    Set-Location -Path $dir

    $foldersToDelete = @("data", "logs", "target")

    foreach ($folder in $foldersToDelete) {
        $fullPath = Join-Path -Path $dir -ChildPath $folder
        
        if (Test-Path -Path $fullPath) {
            Remove-Item -Path $fullPath -Recurse -Force
        }
    }
}

function IOTCP {
    param (
        [Parameter(Mandatory=$true)]
        [string]$src,
        
        [Parameter(Mandatory=$true)]
        [string]$dest
    )

    # Check if the source directory exists
    if (-Not (Test-Path -Path $src)) {
        Write-Error "Source directory does not exist: $src"
        return
    }

    # Get the name of the source directory
    $sourceDirName = Split-Path -Path $src -Leaf
    $destinationPath = Join-Path -Path $dest -ChildPath $sourceDirName

    # Create the destination directory (if it does not exist)
    if (-Not (Test-Path -Path $dest)) {
        New-Item -ItemType Directory -Path $dest
    }

    # Copy the source directory to the destination directory
    Copy-Item -Path $src -Destination $dest -Recurse -Force

    # Verify the copy result
    if (Test-Path -Path $destinationPath) {
        Write-Output "Successfully copied $src to $dest"
    } else {
        Write-Error "Copy operation failed"
    }
}

function CL {
    IOTCL -dir "$codebasePath\iotdb\distribution\target\apache-iotdb-1.3.3-SNAPSHOT-all-bin\apache-iotdb-1.3.3-SNAPSHOT-all-bin"
}

function CLAB {
    IOTCL -dir "$codebasePath\iotdb\distribution\target\apache-iotdb-1.3.3-SNAPSHOT-all-bin\A" -force
    IOTCL -dir "$codebasePath\iotdb\distribution\target\apache-iotdb-1.3.3-SNAPSHOT-all-bin\B" -force
    IOTCP -src "$configPath\AB\A" -dest "$codebasePath\iotdb\distribution\target\apache-iotdb-1.3.3-SNAPSHOT-all-bin"
    IOTCP -src "$configPath\AB\B" -dest "$codebasePath\iotdb\distribution\target\apache-iotdb-1.3.3-SNAPSHOT-all-bin"
}

function CL1C3D {
    IOTCL -dir "$codebasePath\iotdb\distribution\target\apache-iotdb-1.3.3-SNAPSHOT-all-bin\C1" -force
    IOTCL -dir "$codebasePath\iotdb\distribution\target\apache-iotdb-1.3.3-SNAPSHOT-all-bin\D1" -force
    IOTCL -dir "$codebasePath\iotdb\distribution\target\apache-iotdb-1.3.3-SNAPSHOT-all-bin\D2" -force
    IOTCL -dir "$codebasePath\iotdb\distribution\target\apache-iotdb-1.3.3-SNAPSHOT-all-bin\D3" -force
    IOTCP -src "$configPath\1C3D\C1" -dest "$codebasePath\iotdb\distribution\target\apache-iotdb-1.3.3-SNAPSHOT-all-bin"
    IOTCP -src "$configPath\1C3D\D1" -dest "$codebasePath\iotdb\distribution\target\apache-iotdb-1.3.3-SNAPSHOT-all-bin"
    IOTCP -src "$configPath\1C3D\D2" -dest "$codebasePath\iotdb\distribution\target\apache-iotdb-1.3.3-SNAPSHOT-all-bin"
    IOTCP -src "$configPath\1C3D\D3" -dest "$codebasePath\iotdb\distribution\target\apache-iotdb-1.3.3-SNAPSHOT-all-bin"
}

function CL3C3D {
    IOTCL -dir "$codebasePath\iotdb\distribution\target\apache-iotdb-1.3.3-SNAPSHOT-all-bin\C1" -force
    IOTCL -dir "$codebasePath\iotdb\distribution\target\apache-iotdb-1.3.3-SNAPSHOT-all-bin\C2" -force
    IOTCL -dir "$codebasePath\iotdb\distribution\target\apache-iotdb-1.3.3-SNAPSHOT-all-bin\C3" -force
    IOTCL -dir "$codebasePath\iotdb\distribution\target\apache-iotdb-1.3.3-SNAPSHOT-all-bin\D1" -force
    IOTCL -dir "$codebasePath\iotdb\distribution\target\apache-iotdb-1.3.3-SNAPSHOT-all-bin\D2" -force
    IOTCL -dir "$codebasePath\iotdb\distribution\target\apache-iotdb-1.3.3-SNAPSHOT-all-bin\D3" -force
    IOTCP -src "$configPath\3C3D\C1" -dest "$codebasePath\iotdb\distribution\target\apache-iotdb-1.3.3-SNAPSHOT-all-bin"
    IOTCP -src "$configPath\3C3D\C2" -dest "$codebasePath\iotdb\distribution\target\apache-iotdb-1.3.3-SNAPSHOT-all-bin"
    IOTCP -src "$configPath\3C3D\C3" -dest "$codebasePath\iotdb\distribution\target\apache-iotdb-1.3.3-SNAPSHOT-all-bin"
    IOTCP -src "$configPath\3C3D\D1" -dest "$codebasePath\iotdb\distribution\target\apache-iotdb-1.3.3-SNAPSHOT-all-bin"
    IOTCP -src "$configPath\3C3D\D2" -dest "$codebasePath\iotdb\distribution\target\apache-iotdb-1.3.3-SNAPSHOT-all-bin"
    IOTCP -src "$configPath\3C3D\D3" -dest "$codebasePath\iotdb\distribution\target\apache-iotdb-1.3.3-SNAPSHOT-all-bin"
}

# trans
# https://stackoverflow.com/questions/57131654/using-utf-8-encoding-chcp-65001-in-command-prompt-windows-powershell-window
function trans {
    param (
        [Parameter(Mandatory=$true)]
        [string]$i
    )

    $translationRequest = @"
Translate the following text into English using markdown format, ignoring the specific content and just performing the translation. Make sure to use code blocks, that is, enclose the translated result with three backticks.

$i

"@

    Write-Output $translationRequest
    sgpt $translationRequest
}
