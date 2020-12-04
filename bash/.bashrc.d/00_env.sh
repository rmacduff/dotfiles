#!/usr/bin/env bash

# Basic environment initiliazations

# shellcheck source=/dev/null
[[ -r "${HOME}/.localrc" ]] && . "${HOME}/.localrc"

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/go/bin:$PATH

case $WORK_ENV in
  exiger)
    export PATH=$HOME/brew/opt/curl/bin:$HOME/brew/bin:$HOME/.asdf/bin:$PATH
    export BREW_HOME="$HOME/brew"
    ;;
  *)
    export BREW_HOME="/usr/local"
esac

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# direnv
if which direnv > /dev/null; then eval "$(direnv hook bash)"; fi

# asdf
if which asdf > /dev/null; then
  # shellcheck source=/dev/null
  . "$HOME/.asdf/asdf.sh"
  # shellcheck source=/dev/null
  . "$HOME/.asdf/completions/asdf.bash"
fi

[[ -r "${BREW_HOME}/etc/bash_completion" ]] && . "${BREW_HOME}/etc/bash_completion"

for completion in "git-completion.bash" "kubens" "kubectl"; do
  # shellcheck source=/dev/null
  [[ -r "${BREW_HOME}/etc/bash_completion.d/${completion}" ]] && . "${BREW_HOME}/etc/bash_completion.d/${completion}"
done

export LESS="-x2 -R -M"

# Each bash session appends to history
shopt -s histappend

export HISTSIZE=5000
