#!/bin/bash

este_intreg() {
  local arg=$1
  [[ $arg =~ ^-?[0-9]+$ ]] && return 0
  return 1
}

argument_valid() {
  local arg=$1
  if [[ "$arg" ]] && este_intreg $arg; then
    return 0
  fi
  echo "Argumentul $arg nu este valid"
  return 1
}

adauga() {
  local arg1=$1
  local arg2=$2

  if argument_valid $arg1 && argument_valid $arg2; then
    sum=$(($arg1+$arg2))
    echo $sum
    return 0
  fi
  return 1
}

usage() {
  echo "$(basename $0) ARGUMENT1 ARGUMENT2"
}

if [[ $# -ne 2 ]]; then
  usage
  exit 1
else
  adauga $1 $2
fi
