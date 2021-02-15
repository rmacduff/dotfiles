#!/usr/bin/env bash

# Set the prompt

# shellcheck source=/dev/null
source "${BREW_HOME}/etc/bash_completion.d/git-prompt.sh"

export GIT_PS1_SHOWDIRTYSTATE='y'
export GIT_PS1_SHOWCOLORHINTS='y'
export GIT_PS1_SHOWUNTRACKEDFILES='y'

function __prompt_command() {
  EXIT=${PIPESTATUS[-1]}

  # shellcheck source=/dev/null
  source "${BREW_HOME}/opt/kube-ps1/share/kube-ps1.sh"

  # Use names for colours
  local NoC='\[\e[0m\]' # Reset colour

  # Foreground
  local Bla='\[\e[0;30m\]';
  local Red='\[\e[0;31m\]';
  local Gre='\[\e[0;32m\]';
  local Yel='\[\e[0;33m\]';
  local Blu='\[\e[0;34m\]';
  local Pur='\[\e[0;35m\]';
  local Cya='\[\e[0;36m\]';
  local Whi='\[\e[0;37m\]';

  PS1="${Cya}\D{%Y-%m-%d %H:%M:%S} ${Gre}\u${NoC} @ ${Pur}\h${NoC}: \w $(__git_ps1 '(%s)')${NoC} $(kube_ps1)\n(${EXIT}) \$ ${NoC}"
}

export PROMPT_COMMAND=__prompt_command
