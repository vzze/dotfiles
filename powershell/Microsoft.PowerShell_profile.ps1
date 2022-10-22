oh-my-posh init pwsh --config D:/CB/Configs/powershell/ys.omp.json | Invoke-Expression

Set-Alias time Get-Date

function todo {
    Get-Content -Path "D:/CB/todo.md"
}

$TODO = "D:/CB/todo.md"

Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

function vupgrade {
    $TestCommandExists = {
        Param($command)
        try { if(Get-Command $command) { return 1 } }
        catch { return 0 }
    }
    $UTime = {
        Param ($name)
        Write-Output (
            "`n-- " + (Get-Date).Hour.toString() +
            ":" + (Get-Date).Minute.toString() +
            ":" + (Get-Date).Second.toString() +
            " -- " + $name + "`n"
        )
    }
    if($TestCommandExists.Invoke("scoop")) {
        $UTime.Invoke("scoop")
        scoop update *
    }
    if($TestCommandExists.Invoke("npm")) {
        $UTime.Invoke("npm")
        npm update -g
    }
    if($TestCommandExists.Invoke("python")) {
        $UTime.Invoke("python")
        python -m pip install --upgrade pip
    }
    if($TestCommandExists.Invoke("pip")) {
        $UTime.Invoke("pip")
        pip freeze | %{$_.split('==')[0]} | %{pip install --upgrade $_}
    }
    if($TestCommandExists.Invoke("rustup")) {
        $UTime.Invoke("rustup")
        rustup update
    }
    if($TestCommandExists.Invoke("gh")) {
        $UTime.Invoke("gh")
        gh extension upgrade --all
    }
    if($TestCommandExists.Invoke("nvim")) {
        $UTime.Invoke("nvim")
        nvim "+PlugUpdate | :q | :q"
    }
}

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
