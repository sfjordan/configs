# .bashrc
# Unlike earlier versions, Bash4 sources your bashrc on non-interactive shells.
# The line below prevents anything in this file from creating output that will
# break utilities that use ssh as a pipe, including git and mercurial.
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific aliases and functions for all shells
export EDITOR=vim


alias ll='ls -lh'
alias l='ll'
alias lla='ll -A'
alias la='lla'
alias vi='vim'

### History
# Unlimited history
export HISTFILESIZE=5000
export HISTSIZE=5000

# Tell the history builtin command to display history with a timestamp
export HISTTIMEFORMAT='%F %T  '

# But only keep a certain number of lines in memory
export HISTSIZE=10000

# Don't clutter the file with trivial one and two character commands 
export HISTIGNORE="?:??:history*:"

# Don't clutter the file with consecutively repeated commands 
export HISTCONTROL=ignoredups

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# vim keybindings
set -o vi

# set ctrl-s
stty -ixon

# you want to get colorful
WHITE='\[\e[1;37m\]'
BLACK='\[\e[0;30m\]'
BLUE='\[\e[0;34m\]'
LIGHT_BLUE='\[\e[1;34m\]'
GREEN='\[\e[0;32m\]'
LIGHT_GREEN='\[\e[1;32m\]'
CYAN='\[\e[0;36m\]'
LIGHT_CYAN='\[\e[1;36m\]'
RED='\[\e[0;31m\]'
LIGHT_RED='\[\e[1;31m\]'
PURPLE='\[\e[0;35m\]'
LIGHT_PURPLE='\[\e[1;35m\]'
BROWN='\[\e[0;33m\]'
YELLOW='\[\e[1;33m\]'
GRAY='\[\e[0;30m\]'
LIGHT_GRAY='\[\e[0;37m\]'
RESET_COLOR='\[\e[0m\]'

function set_prompt {
  if [[ $? -eq 0 ]]; then
    exit_status="$GREEN»"
  else
    exit_status="$RED»"
  fi

   USR=`echo $USER | cut -c 1-3`
   export PS1="\
$LIGHT_PURPLE$USR@$BLUE\h$GREEN\w\n$exit_status$RESET_COLOR "
}

PROMPT_DIRTRIM=3
PROMPT_COMMAND=set_prompt

