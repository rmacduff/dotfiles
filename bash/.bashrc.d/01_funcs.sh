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

ipinfo() {
  if [[ -z $1 ]]; then
    curl http://ipinfo.io/ && echo
  else
    for ip in "${@}"; do
      curl "http://ipinfo.io/${ip}" && echo
    done
  fi
}

digipinfo() {
  ipinfo "$( dig +short $1 | head -n 1 )"
}

# Analyze an IP address using DolanSoft IP Analyzer.
# Arguments:
#   $1  IP address
# Returns:
#   None
ipalyzer() {
  if [[ -z $1 ]]; then
    printf "ipalyzer: enter IP address\n" >&2
    return 1
  fi
  "$BROWSER" "https://www.ipalyzer.com/${1}"
}

# https://github.com/joncalhoun/algorithmswithgo.com/tree/master/module01#04---how-to-use-the-provided-materials
go_test() {
  go test $* | sed ''/PASS/s//$(printf "\033[32mPASS\033[0m")/'' | sed ''/SKIP/s//$(printf "\033[34mSKIP\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/'' | GREP_COLOR="01;33" egrep --color=always '\s*[a-zA-Z0-9\-_.]+[:][0-9]+[:]|^'
}
