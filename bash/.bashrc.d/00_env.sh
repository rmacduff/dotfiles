#!/usr/bin/env bash

# Basic environment initiliazations

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/go/bin:$PATH

for completion in "git-completion.bash" "kubens"; do
  # shellcheck source=/dev/null
  [[ -r "/usr/local/etc/bash_completion.d/${completion}" ]] && . "/usr/local/etc/bash_completion.d/${completion}"
done
