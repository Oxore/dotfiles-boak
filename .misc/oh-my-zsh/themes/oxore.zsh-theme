PROMPT='$ '
RPROMPT=''

# purple username
username() {
  echo "%{$FG[012]%}%n%{$reset_color%}"
}

# current directory, two levels deep
directory() {
  echo " %2~"
}

prompt_status() {
  echo "%(1j.%(?.[%F{cyan}z%f].[%F{cyan}z%f:%F{red}%?%f]).%(?..[%F{red}%?%f]))"
}

# Git: branch/detached head, dirty status
prompt_git() {
  (( $+commands[git] )) || return
  if [[ "$(git config --get oh-my-zsh.hide-status 2>/dev/null)" = 1 ]]; then
    return
  fi
  local ref dirty mode repo_path

  if [[ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]]; then
    repo_path=$(git rev-parse --git-dir 2>/dev/null)
    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref=" #$(git rev-parse --short HEAD 2> /dev/null)"
    if [[ -n $dirty ]]; then
      local begin_color=%F{yellow}
    else
      local begin_color=%F{green}
    fi
    local end_color=%f

    if [[ -e "${repo_path}/BISECT_LOG" ]]; then
      mode="b"
    elif [[ -e "${repo_path}/MERGE_HEAD" ]]; then
      mode="%F{red}m%f"
    elif [[ -e "${repo_path}/rebase" || -e "${repo_path}/rebase-apply" || -e "${repo_path}/rebase-merge" || -e "${repo_path}/../.dotest" ]]; then
      mode="r"
    fi

    setopt promptsubst
    autoload -Uz vcs_info

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' get-revision true
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' stagedstr '+'
    zstyle ':vcs_info:*' unstagedstr '='
    zstyle ':vcs_info:*' formats '%u%c'
    zstyle ':vcs_info:*' actionformats '%u%c'
    vcs_info
    local flags=${vcs_info_msg_0_%%}${mode}
    echo -n "%B${begin_color}${${ref:gs/%/%%}/refs\/heads\// }${end_color}${flags:+"[${flags}]"}%b"
  fi
}

sigil() {
  [[ $UID -eq 0 ]] && echo " #" || echo " $"
}

RETVAL=$?
# putting it all together
PROMPT='$(prompt_status)$(directory)$(prompt_git)$(sigil) '
