# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

setopt incappendhistory
setopt sharehistory

zstyle ':completion:*' menu select
zmodload zsh/complist

# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"
# Use colors for less, man, etc.
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

plugins=(git)

# User configuration
LANG=en_US.UTF-8
ZSH_THEME="oxore"

export VISUAL=nvim
export EDITOR="$VISUAL"
export MENUCONFIG_COLOR="blackbg"
export MAKEFLAGS="--no-print-directory"

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
  # I don't use hg and it is slows down every prompt
  #prompt_hg
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

function filestore() {
  curl -F "=@$1" http://filestore.scheoble.xyz \
    | jq -r "\"[![$2](\" + .thumbnail_file + \")](\" + .original_file + \")\""
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
    OUTPUT=$(grep -rnI . | fzf -m | grep -Po "^[^:]+:[^:]+")
    if [ ! -z $OUTPUT ]
    then
      $EDITOR $OUTPUT
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
alias yco="yadm checkout"
alias yd="yadm diff --histogram"
alias ydca="yadm diff --cached"
alias ylg="yadm log --stat"
alias yst="yadm status"
alias yp="yadm push"

alias gd="git diff --histogram"
alias gdca="git diff --histogram --cached"
alias glg2="git log --graph --decorate --oneline"
alias glgga="git log --graph --decorate --oneline --all"

alias hello='echo -n "#include <stdio.h>\n\nint main(int argc, char * const argv[])\n{\n    (void)argc;\n    (void)argv;\n}" >main.c && vim main.c'
alias kl="fuzzy-kill"
alias skl="sudo-fuzzy-kill"
alias ix="curl -F 'f:1=<-' ix.io"
alias flat="flatpak --user"
alias scrotclip= "scrot -s ~/foo.png && xclip ~/foo.png && rm ~/foo.png"
alias ls="ls --color=auto"
alias cd..="cd .."
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
alias emacs="env TERM=xterm-24bit emacs"
bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search
bindkey -s '^[o' 'ranger-cd\n'
bindkey -s '^x^o' 'ranger-cd\n'
bindkey -s '^x^f' 'grep-fzf\n'
bindkey -s '^z' 'fg\n'
# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# FZF autocomplete
source /usr/share/fzf/key-bindings.zsh

unset _JAVA_OPTIONS
