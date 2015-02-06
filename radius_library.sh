#! /bin/bash

_mysql() {
  mysql \
    --user=$MYSQL_USER \
    --password=$MYSQL_PASSWORD \
    $MYSQL_DATABASE \
    --execute "$@" # dev
#    --execute "$@" 2>/dev/null # production
}

_mysql_base() {
  mysql \
    --user=$MYSQL_USER \
    --password=$MYSQL_PASSWORD \
    --execute "$@" 2>/dev/null
}

_mysql_silent() {
  mysql \
    --user=$MYSQL_USER \
    --password=$MYSQL_PASSWORD \
    --silent \
    --skip-column-names \
    $MYSQL_DATABASE \
    --execute "$@" 2>/dev/null
}

_password_generator() {
  # -a algorithm
  #        use algorithm for password generation.
  #        0 - (default) pronounceable password generation
  #        1 - random character password generation
  #
  # -n num_of_pass
  #        generate num_of_pass number of passwords. Default is 6.
  #
  # -m min_pass_len
  #        generate  password  with  minimum  length   min_pass_len.    If
  #        min_pass_len  >  max_pass_len then max_pass_len = min_pass_len.
  #        Default minimum password length is 8.
  #
  # -x max_pass_len
  #        generate  password  with  maximum  length   max_pass_len.    If
  #        min_pass_len  >  max_pass_len then max_pass_len = min_pass_len.
  #        Default maximum password length is 10.
  #
  # -M mode
  #        Use symbolsets specified with  mode  for  password  generation.
  #        mode  is  a text string consisting of characters S, s, N, n, C,
  #        c, L, l. Where:
  #
  #        L      generator must use small letters symbol  set  for  every
  #               generated  password  (always  present  if  pronounceable
  #               password generation algorithm is used).

  WEAK="-m 6 -x 6 -M L"
  STRONG="-m 8 -x 8 -M CLN"

  APPEND="$STRONG"

  if [ "$1" == "weak" ]; then
    APPEND="$WEAK"
  fi

  apg -a 1 -n 1 $APPEND
}

function _label {
  local LABEL="$1"
  local SUGGESTION="$2"

  if [ -n "$SUGGESTION" ]; then
    local SUGGESTION_FORMATED=" [$SUGGESTION]"
  fi

  echo "$LABEL$SUGGESTION_FORMATED: "
}

function _prompt {
  local NAME="$1"
  local LABEL="$2"
  local SUGGESTION="$3"

  _label "$LABEL" "$SUGGESTION"
  read "$NAME"

  if [ -z "${!NAME}" ]; then
    eval "$NAME='$SUGGESTION'"
  fi

  export "$NAME"
}
