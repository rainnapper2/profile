autoload -U colors && colors

PROMPT=$'\n'
PROMPT+="%{$reset_color%}%{$fg[cyan]%}"
PROMPT+="(^%?) "
PROMPT+="%{$reset_color%}%{$fg[gray]%}"
PROMPT+="%U%D{%a %b %d %H:%M:%S}%u "
PROMPT+="%{$reset_color%}%{$fg[green]%}"
PROMPT+="%0~"
PROMPT+=$'\n'
PROMPT+="%{$reset_color%}%{$fg[magenta]%}# "
PROMPT+="%{$reset_color%}"
ZSH_ROOT=${ZDOTDIR:-$HOME}

function reload {
    if [ -f ${HOME}/.zshenv ]; then
      source $HOME/.zshenv
    fi
    if [ -f ${ZSH_ROOT}/.zshrc ]; then
      source ${ZSH_ROOT}/.zshrc
    fi
}

GIT_REPO_ROOT="${HOME}/playground"
function gitd {
  if [[ "${1}" == "--help" ]]; then
    echo "Usage: gitd <name_of_repo> to cd into that repo's root, and gitd <no args> to cd to git repo's root dir."
  elif [[ -z "${1}" ]]; then
    CURRENT_REPO_ROOT=$(git rev-parse --show-toplevel)
    if [[ -z "${CURRENT_REPO_ROOT}" ]]; then
      echo "Usage: gitd <name_of_repo> to cd into that repo's root, and gitd <no args> to cd to git repo's root dir."
    else
      cd $CURRENT_REPO_ROOT
    fi
  else
    cd ${GIT_REPO_ROOT}/${1}
  fi
}

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "("${ref#refs/heads/}")"
}

function print_symlink {
    wd="$(pwd)"
    linkdir="$(readlink -n $wd)";
    if readlink -n $wd >/dev/null; then
echo " -> $linkdir ";
    fi
}

alias ls='ls -GFh'
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias ..="cd .."
alias ~="cd ~"

# Vim mode
bindkey -v