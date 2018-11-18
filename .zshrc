# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export VISUAL=nvim
export EDITOR="$VISUAL"

# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"
# Use colors for less, man, etc.
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

LANG=en_US.UTF-8
ZSH_THEME="agnoster"
AWT_TOOLKIT="MToolkit"

plugins=(git)

# User configuration

export CUDA_BIN_PATH=/opt/cuda/bin
export PATH="/bin:/sbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/opt/android-sdk/platform-tools/"
export PATH="$PATH:/home/oxore/.bin"
export PATH="$PATH:/home/oxore/.local/bin"
export PATH="$PATH:/home/oxore/altera_lite/16.0/quartus/bin"
export PATH="$PATH:/home/oxore/Documents/stm32-prog/openocd/prefix/bin"
export PATH="$PATH:/home/oxore/.gem/ruby/2.5.0/bin"
export PATH="$PATH:/home/oxore/.cargo/bin"
export PATH="$PATH:/home/oxore/.scripts"
export PATH="$PATH:/home/oxore/altera_lite/16.0/quartus/bin/"
export PATH="$PATH:/home/oxore/altera_lite/16.0/University_Program/Monitor_Program/bin/"

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

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Good alias but no longer works. Reporting error with message:
# /home/oxore/.zshrc:fc:91: no such event: 0
# alias fuck="sudo $(fc -ln -1)"

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
