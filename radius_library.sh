#! /bin/bash

_mysql() {
  mysql \
    --user=$MYSQL_USER \
    --password=$MYSQL_PASSWORD \
    $MYSQL_DATABASE \
    --execute "$@"
}

_mysql_base() {
  mysql \
    --user=$MYSQL_USER \
    --password=$MYSQL_PASSWORD \
    --execute "$@"
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
  local WEAK="-m 6 -x 6 -M L"
  local STRONG="-m 10 -x 10 -M CLN"

  local APPEND="$STRONG"

  if [ "$1" == "weak" ]; then
    local APPEND="$WEAK"
  fi

  apg -a 1 -n 1 $APPEND
}

function _label {
  local LABEL="$1"
  local SUGGESTION="$2"

  if [ -n "$SUGGESTION" ]; then
    local SUGGESTION_FORMATED=" [$SUGGESTION]"
  fi

  echo -n "$LABEL$SUGGESTION_FORMATED: "
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

_prompt_yes() {
  echo -n "$@ (y|n): "
  read YES

  if [ "$YES" != "y" ]; then
    echo "exit"
  fi
}
