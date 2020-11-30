#!/usr/bin/env bash
#set -x

for i in ~/.bashrc.d/*.sh; do
  . $i
done; unset i

