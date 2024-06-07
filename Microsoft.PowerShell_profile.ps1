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
function IOTCLI {
    param (
        [Parameter(Mandatory=$true)]
        [int]$p
    )
    
    $path = "C:\Documents\codebase\iotdb\distribution\target\apache-iotdb-1.3.2-SNAPSHOT-all-bin\apache-iotdb-1.3.2-SNAPSHOT-all-bin"
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
    $targetPath = "C:\Documents\codebase\iot-benchmark\iotdb-1.3\target\iot-benchmark-iotdb-1.3\iot-benchmark-iotdb-1.3"
    $benchmarkFile = ".\benchmark.bat"

    Set-Location -Path $targetPath

    Start-Process -FilePath $benchmarkFile -NoNewWindow -Wait
}

function IOTCL {
    param (
        [Parameter(Mandatory=$true)]
        [string]$dir
    )

    Set-Location -Path $dir

    $foldersToDelete = @("data", "logs", "target")

    foreach ($folder in $foldersToDelete) {
        $fullPath = Join-Path -Path $dir -ChildPath $folder
        
        if (Test-Path -Path $fullPath) {
            Remove-Item -Path $fullPath -Recurse -Force
        }
    }
}

function CL {
    IOTCL -dir 'C:\Documents\codebase\iotdb\distribution\target\apache-iotdb-1.3.2-SNAPSHOT-all-bin\apache-iotdb-1.3.2-SNAPSHOT-all-bin' ;
}

function CLAB {
    IOTCL -dir 'C:\Documents\codebase\iotdb\distribution\target\apache-iotdb-1.3.2-SNAPSHOT-all-bin\A' ;
    IOTCL -dir 'C:\Documents\codebase\iotdb\distribution\target\apache-iotdb-1.3.2-SNAPSHOT-all-bin\B'
}

function CL1C3D {
    IOTCL -dir 'C:\Documents\codebase\iotdb\distribution\target\apache-iotdb-1.3.2-SNAPSHOT-all-bin\C1' ;
    IOTCL -dir 'C:\Documents\codebase\iotdb\distribution\target\apache-iotdb-1.3.2-SNAPSHOT-all-bin\D1' ;
    IOTCL -dir 'C:\Documents\codebase\iotdb\distribution\target\apache-iotdb-1.3.2-SNAPSHOT-all-bin\D2' ;
    IOTCL -dir 'C:\Documents\codebase\iotdb\distribution\target\apache-iotdb-1.3.2-SNAPSHOT-all-bin\D3'
}

function CPDIR {
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

function CPAB {
    CPDIR -src "C:\Documents\iotdb\configs\AB\A" -dest "C:\Documents\codebase\iotdb\distribution\target\apache-iotdb-1.3.2-SNAPSHOT-all-bin" ; 
    CPDIR -src "C:\Documents\iotdb\configs\AB\B" -dest "C:\Documents\codebase\iotdb\distribution\target\apache-iotdb-1.3.2-SNAPSHOT-all-bin"
}

function CP1C3D {
    CPDIR -src "C:\Documents\iotdb\configs\1C3D\C1" -dest "C:\Documents\codebase\iotdb\distribution\target\apache-iotdb-1.3.2-SNAPSHOT-all-bin" ; 
    CPDIR -src "C:\Documents\iotdb\configs\1C3D\D1" -dest "C:\Documents\codebase\iotdb\distribution\target\apache-iotdb-1.3.2-SNAPSHOT-all-bin" ;
    CPDIR -src "C:\Documents\iotdb\configs\1C3D\D2" -dest "C:\Documents\codebase\iotdb\distribution\target\apache-iotdb-1.3.2-SNAPSHOT-all-bin" ;
    CPDIR -src "C:\Documents\iotdb\configs\1C3D\D3" -dest "C:\Documents\codebase\iotdb\distribution\target\apache-iotdb-1.3.2-SNAPSHOT-all-bin"
}
