function gitd {
  if [ "$1" == "--help" ]; then
    echo "Usage: gitd <name_of_repo> to cd into that repo's root, and gitd <no args> to cd to git repo's root dir."
  elif [ -z "$1" ]; then
    cd `git rev-parse --show-toplevel`
  else
    cd ~/code/$1
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

LIGHT_GRAY='\[\033[38;5;254m\]'
DARK_GRAY='\[\033[38;5;8m\]'
DARK_RED='\[\033[38;5;160m\]'
GREEN='\[\033[38;5;2m\]'
PINK='\[\033[38;5;201m\]'
CYAN='\[\033[38;5;14m\]'
RESET_FMT='\[$(tput sgr0)\]'

PS1=''
# Begin with newline to separate from last command
PS1+='\n'
PS1+=$CYAN
PS1+='(^ $?)'
PS1+=$RESET_FMT
PS1+=' '
# Date + time
PS1+=$DARK_GRAY
PS1+='[\d \t]'
PS1+=$RESET_FMT
# Space
PS1+=' '
# Directory
PS1+=$GREEN
PS1+='\w'
PS1+=$RESET_FMT
# Symlink if applicable
PS1+=$DARK_RED
PS1+='$(print_symlink)'
PS1+=$RESET_FMT
# Space
PS1+=' '
# git branch if present
PS1+=$LIGHT_GRAY
PS1+='$(parse_git_branch)'
PS1+=$RESET_FMT
# New line
PS1+='\n'
# Dollar sign
PS1+=$PINK
PS1+='\\$'
PS1+=$RESET_FMT
# Space
PS1+=' '
# Clear formatting
PS1+=$RESET_FMT
export PS1=$PS1

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
#export NODE_PATH=/usr/local/lib/node_modules
export PATH=/usr/local/bin:$PATH
export PATH=/Users/mmark/bin:$PATH
export PATH=/Users/mmark/bin/bento4-1-6-0-634/bin:$PATH
export ANDROID_HOME=/Users/mmark/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

FIGNORE=\.DS_Store

# some more ls aliases
alias ls='ls -GFh'
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias ..="cd .."
alias rebash='source ~/.bash_profile'

#alias python3='/usr/local/bin/python3'
#alias python2='/usr/bin/python2.7'
# Use python 3 by default
#alias python=python3

# vim highlighting with less
VLESS=$(find /usr/share/vim -name 'less.sh')
if [ ! -z $VLESS ]; then
          alias less=$VLESS
      fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

complete -W "`ls ~/code | grep /`" gitd
