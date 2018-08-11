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
export PATH="$PATH:/home/oxore/MATLAB/R2017b/bin"
export PATH="$PATH:/home/oxore/.bin"
export PATH="$PATH:/home/oxore/altera_lite/16.0/quartus/bin"
export PATH="$PATH:/home/oxore/Documents/stm32-prog/openocd/prefix/bin"
export PATH="$PATH:/home/oxore/.gem/ruby/2.5.0/bin"
export PATH="$PATH:/home/oxore/.cargo/bin"

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
  prompt_segment black default '%2~'
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


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias scrotclip= "scrot -s ~/foo.png && xclip ~/foo.png && rm ~/foo.png"
alias ls="ls --color=auto"
alias cd..="cd .."

# Good alias but no longer works. Reporting error with message:
# /home/oxore/.zshrc:fc:91: no such event: 0
# alias fuck="sudo $(fc -ln -1)"

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

# FZF autocomplete
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
