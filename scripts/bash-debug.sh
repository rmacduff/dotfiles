# https://www.shell-tips.com/bash/debug-script/
### Define Debug environment
### Filename: my-debug-env

PS4='+[$0:$LINENO] '

if [[ -v DEBUGGER ]]; then
  shopt -s extdebug
else
  set -o errtrace
  set -o functrace
fi

if [[ -v TRACE ]]; then
  echo "Run TRACE mode"
  exec 4>./xtrace.out
  BASH_XTRACEFD=4
  set -o xtrace # same as set -x
fi

if [[ -v NOOP ]]; then
  echo "Run NOOP mode"
  set -o noexec # same as set -n
fi

debug() {
 echo "[ DEBUG ]| BASH_COMMAND=${BASH_COMMAND}"
 echo "         | BASH_ARGC=${BASH_ARGC[@]} BASH_ARGV=${BASH_ARGV[@]}"
 echo "         | BASH_SOURCE: ${!BASH_SOURCE[@]} ${BASH_SOURCE[@]}"
 echo "         | BASH_LINENO: ${!BASH_LINENO[@]} ${BASH_LINENO[@]}"
 echo "         | FUNCNAME: ${!FUNCNAME[@]} ${FUNCNAME[@]}"
}

trap 'echo ERR trap from ${FUNCNAME:-MAIN} context. $BASH_COMMAND failed with error code $?' ERR
trap 'debug' DEBUG
