#!/usr/bin/env bash

# Useful functions

# Custom functions for specific environments
# shellcheck source=/dev/null
. "$HOME"/.bash.d/functions/*.sh

mk_gh_repo() {
  if [[ $# -ne 1 ]]; then
    echo "Need to specify the name of the repo to create."
    return
  fi
  curl -i -H "Authorization: token ${GITHUB_TOKEN}" \
    -d "{ \
        \"name\": \"$1\", \
        \"auto_init\": true, \
        \"private\": true
      }" \
    https://api.github.com/user/repos
}

mkcd() {
  mkdir -p "$1"
  cd "$1" || return
}
