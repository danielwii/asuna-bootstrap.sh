#!/usr/bin/env bash

space() {
  local result=""
  local n=$1
  local i=0
  while [[ "$i" != $n ]]
  do
    result="$result "
    ((i+=1))
  done
  echo $result
}

# -----------------------------------
# sh scripts
# -----------------------------------

sh_log() {
  local length=34
  local message=$1
  local message_length=${#message}
  local make_up_length=$((length - message_length))

  tput cup 1 0

  echo "--- $message $(space $make_up_length)---"
}
