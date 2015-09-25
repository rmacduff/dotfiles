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
  ipinfo $( dig +short $1 )
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
  $BROWSER "https://www.ipalyzer.com/${1}"
}
