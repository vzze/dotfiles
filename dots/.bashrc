vupgrade () {
    if command -v "pacman" > /dev/null; then
        echo $'\n--' $(date +"%T") $'-- pacman\n'
        sudo pacman -Syu
    fi
    if command -v "npm" > /dev/null; then
        echo $'\n--' $(date +"%T") $'-- npm\n'
        sudo npm update -g
    fi
    if command -v "python" > /dev/null; then
        echo $'\n--' $(date +"%T") $'-- python\n'
        python -m pip install --upgrade pip
    fi
    if command -v "pip" > /dev/null; then
        echo $'\n--' $(date +"%T") $'-- pip\n'
        pip list --format freeze | sed 's/=.*//g' | xargs -n1 pip install -U
    fi
    if command -v "rustup" > /dev/null; then
        echo $'\n--' $(date +"%T") $'-- rustup\n'
        rustup update
    fi
    if command -v "gh" > /dev/null; then
        echo $'\n--' $(date +"%T") $'-- gh\n'
        gh extension upgrade --all
    fi
    if command -v "nvim" > /dev/null; then
        echo $'\n--' $(date +"%T") $'-- nvim\n'
        nvim "+PlugUpdate | :q | :q"
    fi
}

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls="ls --color=never"

PS1='[\u@\h \W]\$ '
