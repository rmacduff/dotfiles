#!/usr/bin/env bash

# Set the prompt

# shellcheck source=/dev/null
source /usr/local/etc/bash_completion.d/git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE='y'
export GIT_PS1_SHOWCOLORHINTS='y'
export GIT_PS1_SHOWUNTRACKEDFILES='y'

# shellcheck source=/dev/null
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"

export PS1='\[\033[38;5;39m\]\d \[\033[38;5;39m\]\t\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;10m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;10m\]\h\[$(tput sgr0)\]:\w\[\033[38;5;9m\]$(__git_ps1 " (%s)")\[$(tput sgr0)\] $(kube_ps1)\n($?) \$ \[$(tput sgr0)\]'

