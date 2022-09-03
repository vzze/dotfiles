oh-my-posh init pwsh --config D:\CB\Configs\powershell\ys.omp.json | Invoke-Expression

Set-Alias time Get-Date

function _todo {
    Get-Content -Path "D:/CB/todo.md"
}

$TODO = "D:/CB/todo.md"

Set-Alias -Name todo -Value _todo