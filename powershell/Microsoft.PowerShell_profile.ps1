Import-Module PSColor

oh-my-posh init pwsh --config ~/.config/posh/ys.omp.json | Invoke-Expression

Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

function touch {
    Param(
       [Parameter(Mandatory=$true)]
       [string]$Path
    )

    if (Test-Path -LiteralPath $Path) {
        (Get-Item -Path $Path).LastWriteTime = Get-Date
    } else {
        New-Item -Force -Type File -Path $Path
    }
}