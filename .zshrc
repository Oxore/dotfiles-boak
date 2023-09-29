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
export NNN_PLUG="p:preview-tui"
# block device (yellow)
#                    |
export NNN_FCOLORS="030304020707060805050501"
#                      | | | | | | | | | | |
# char device (yellow) + | | | | | | | | | |
# directory (blue) ------+ | | | | | | | | |
# executable (green) ------+ | | | | | | | |
# regular (white) -----------+ | | | | | | |
# hard link (white) -----------+ | | | | | |
# symbolic link (cyan) ----------+ | | | | |
# missing or file details (gray) --+ | | | |
# orphaned symbolic link (magenta) --+ | | |
# FIFO (magenta) ----------------------+ | |
# Socket (magenta) ----------------------+ |
# Unknown OR 0B regular/exe (red) ---------+
export NNN_PAGER="cat"

source $HOME/.paths.zsh
source $ZSH/oh-my-zsh.sh

cat $HOME/todo.txt 2>/dev/null | sed -r '/^\s*$/d'

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
  curl -F "=@$1" https://scheoble.xyz/filestore \
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

nnn-cd ()
{
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The command builtin allows one to alias nnn to n, if desired, without
    # making an infinitely recursive alias
    command nnn -adeA "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    }
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

function catboxpersist {
  curl -X POST -F 'reqtype=fileupload' -F "fileToUpload=@$1" https://catbox.moe/user/api.php
  echo
}

function catbox {
  local time=72h
  curl -X POST -F 'reqtype=fileupload' -F "time=$time" -F "fileToUpload=@$1" https://litterbox.catbox.moe/resources/internals/api.php
  echo
  echo "time=$time" >&2
}

function pass-fzf {
  prefix="$HOME/.password-store"
  name=$(find ${prefix} -name '*.gpg' | sed -E 's#'"${prefix}"'/(.*).gpg#\1#' | fzf) || return $?
  echo "$name"
  pass show $@ "$name"
}

function datef {
  date $@ | sed s/:/-/g
}

# Good alias but no longer works. Reporting error with message:
# /home/oxore/.zshrc:fc:91: no such event: 0
# alias fuck="sudo $(fc -ln -1)"

alias ya="yadm add"
alias yc="yadm commit --verbose"
alias yc!="yadm commit --amend --verbose"
alias ycn!="yadm commit --amend --verbose --no-edit"
alias yco="yadm checkout"
alias yd="yadm diff --histogram"
alias ydca="yadm diff --cached"
alias ylg="yadm log --stat"
alias yst="yadm status"
alias yp="yadm push"
alias yrst="yadm restore --staged"

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
alias nnn="nnn -adeA"
alias ru="trans en:ru"
alias ут="trans ru:en"
alias en="trans ru:en"
alias ен="trans ru:en"
alias тр="trans ru:en"
bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search
bindkey -s '^[o' 'nnn-cd\n'
bindkey -s '^x^o' 'nnn-cd\n'
bindkey -s '^x^f' 'grep-fzf\n'
bindkey -s '^x^p' 'pass-fzf -c\n'
bindkey -s '^xp' 'pass-fzf\n'
bindkey -s '^z' 'fg\n'
# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# FZF autocomplete
source /usr/share/fzf/key-bindings.zsh

unset _JAVA_OPTIONS
