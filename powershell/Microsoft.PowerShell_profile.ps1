Import-Module PSColor

oh-my-posh init pwsh --config ~/.config/posh/ys.omp.json | Invoke-Expression

Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

function touch {
    param(
        [Parameter(Mandatory=$true)]
        [String]$path
    )

    if(Test-Path -LiteralPath $path) {
        (Get-Item -Path $path).LastWriteTime = Get-Date
    } else {
        New-Item -Force -Type File -Path $path
    }
}

function video_get_chunk {
    param(
        [Parameter(Mandatory=$true)] [String]$video,
        [Parameter(Mandatory=$true)] [String]$ss,
        [String]$t = "00:00:00"
    )

    $file_type = [System.IO.Path]::GetExtension($video)

    switch($t) {
        "00:00:00" {
            Invoke-Expression "ffmpeg -ss $ss -i $video -acodec copy -vcodec copy output$file_type"
        }

        default {
            Invoke-Expression "ffmpeg -ss $ss -t $t -i $video -acodec copy -vcodec copy output$file_type"
        }
    }
}

function video_concat {
    $concat_opt = "concat:"
    $count = 1;

    foreach($arg in $args) {
        Invoke-Expression "ffmpeg -i $arg -c copy -bsf:v h264_mp4toannexb -f mpegts temp$count.ts"
        $concat_opt = $concat_opt + "temp$count.ts|"

        $count = $count + 1;
    }

    $concat_opt = $concat_opt.Trim('|')

    Invoke-Expression "ffmpeg -i `"$concat_opt`" -c copy -bsf:a aac_adtstoasc output.mp4"
}
