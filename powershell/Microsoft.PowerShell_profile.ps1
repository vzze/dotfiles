oh-my-posh init pwsh --config D:\CB\Configs\powershell\ys.omp.json | Invoke-Expression

Set-Alias time Get-Date

function todo {
    Get-Content -Path "D:/CB/todo.md"
}

$TODO = "D:/CB/todo.md"

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
