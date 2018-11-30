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

source $HOME/.paths.zsh
source $ZSH/oh-my-zsh.sh

# Agnoster theme tweak
# Remove user@host prompt
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default #"%(!.%{%F{yellow}%}.)$USER@%m"
  fi
}

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

# Good alias but no longer works. Reporting error with message:
# /home/oxore/.zshrc:fc:91: no such event: 0
# alias fuck="sudo $(fc -ln -1)"

alias flat="flatpak --user"
alias scrotclip= "scrot -s ~/foo.png && xclip ~/foo.png && rm ~/foo.png"
alias ls="ls --color=auto"
alias cd..="cd .."
alias glg2="git log --stat --graph --decorate --pretty=oneline --abbrev-commit"
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
bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search
bindkey -s '^o' 'ranger-cd\n'

# FZF autocomplete
source /usr/share/zsh/site-contrib/fzf.zsh

unset _JAVA_OPTIONS
