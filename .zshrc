# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"
# Use colors for less, man, etc.
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

plugins=(git)

# User configuration
LANG=en_US.UTF-8
ZSH_THEME="agnoster"

export VISUAL=nvim
export EDITOR="$VISUAL"
export MENUCONFIG_COLOR="blackbg"
export MAKEFLAGS="--no-print-directory --silent"

source $HOME/.paths.zsh
source $ZSH/oh-my-zsh.sh

cat $HOME/todo.txt 2>/dev/null | sed -r '/^\s*$/d'

# Show up to level 2 dir name
prompt_dir() {
  prompt_segment 8 default '%2~'
}

# No "prompt_context"
build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_virtualenv
  prompt_dir
  prompt_git
  prompt_bzr
  prompt_hg
  prompt_end
}

# remove /etc/hosts content from autocompetion
zstyle -e ':completion:*:hosts' hosts 'reply=(
  ${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) 2>/dev/null)"}%%[#| ]*}//,/ }
  ${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2>/dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
)'

# cheat.sh alias
function cht() {
  curl cheat.sh/$1 | less
}

# Prevent nested ranger sessions
ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
        /usr/bin/ranger "$@"
    else
        exit
    fi
}

function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

function fuzzy-kill {
    ps -eo "%p %u %c" --no-headers | fzf -m | awk '{print $1}' | xargs kill -9
}

function sudo-fuzzy-kill {
    ps -eo "%p %u %c" --no-headers | fzf -m | awk '{print $1}' | xargs sudo kill -9
}

function grep-fzf {
    OUTPUT=$(grep -rn . | fzf -m | grep -Po "^[^:]+:[^:]+")
    if [ ! -z $OUTPUT ]
    then
      nvim $OUTPUT
    fi
}

function gdd {
    git diff ${1}^ ${1}
}

function catbox {
  curl -X POST -F 'reqtype=fileupload' -F "fileToUpload=@$1" https://catbox.moe/user/api.php
  echo
}
# Good alias but no longer works. Reporting error with message:
# /home/oxore/.zshrc:fc:91: no such event: 0
# alias fuck="sudo $(fc -ln -1)"

alias ya="yadm add"
alias yc="yadm commit --verbose"
alias yd="yadm diff --histogram"
alias ydca="yadm diff --cached"
alias ylg="yadm log --stat"
alias yst="yadm status"
alias yp="yadm push"

alias gd="git diff --histogram"
alias gdca="git diff --histogram --cached"

alias hello='echo -n "#include <stdio.h>\n\nint main()\n{\n    printf(\"hello\\\n\");\n}" >main.c && vim main.c'
alias kl="fuzzy-kill"
alias skl="sudo-fuzzy-kill"
alias ix="curl -F 'f:1=<-' ix.io"
alias flat="flatpak --user"
alias scrotclip= "scrot -s ~/foo.png && xclip ~/foo.png && rm ~/foo.png"
alias ls="ls --color=auto"
alias cd..="cd .."
alias glg2="git log --graph --decorate --oneline"
alias sys="sudo systemctl"
alias cdf='cd $(dirname $(fzf))'
alias doduc="duc index / && duc gui /"
alias vim="nvim"
alias vi="nvim"
alias dush="du -sh"
alias gdb="gdb -q"
alias ап="fg"
alias ьфлу="make"
alias bt='coredumpctl gdb -q $(coredumpctl -r -1 | sed -E -e "s/ +/\n/g" | sed -n "12p")'
alias sudo="sudo " # Enables all user alises under sudo
bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search
bindkey -s '^[o' 'ranger-cd\n'
bindkey -s '^x^o' 'ranger-cd\n'
bindkey -s '^x^f' 'grep-fzf\n'

# FZF autocomplete
source /usr/share/zsh/site-contrib/fzf.zsh

unset _JAVA_OPTIONS
