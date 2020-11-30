#!/usr/bin/env bash
#set -x

for i in ~/.bashrc.d/*.sh; do
  # shellcheck source=/dev/null
  . "$i"
done; unset i

