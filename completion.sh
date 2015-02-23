#! /bin/bash

. /etc/freeradius-bash-admin.conf

_get_username() {
  _mysql_silent "
    SELECT 
      username 
    FROM radcheck 
    WHERE username LIKE '$1%'
  "
}

_get_groupname() {
  _mysql_silent "
    SELECT 
      groupname 
    FROM radgroupcheck 
    WHERE groupname LIKE '$1%'
  "
}

_get_nas_shortname() {
  _mysql_silent "
    SELECT 
      shortname 
    FROM nas 
    WHERE shortname LIKE '$1%'
  "
}

_radius_group() {
  local CUR PREV OPTS
  COMPREPLY=()
  CUR="${COMP_WORDS[COMP_CWORD]}"
  PREV="${COMP_WORDS[COMP_CWORD-1]}"

  case "$PREV" in
    radius-group)
      OPTS="add delete help prepopulate show update"
      COMPREPLY=( $(compgen -W "$OPTS" $CUR) )
      return 0
      ;;

    show|update|delete)
      COMPREPLY=( $(compgen -W "$(_get_groupname $CUR)" $CUR) )
      return 0
      ;;

  esac
}

complete -F _radius_group radius-group

_radius_guest() {
  local CUR PREV OPTS
  COMPREPLY=()
  CUR="${COMP_WORDS[COMP_CWORD]}"
  PREV="${COMP_WORDS[COMP_CWORD-1]}"

  case "$PREV" in
    radius-guest)
      OPTS="add count delete-expired show-expired"
      COMPREPLY=( $(compgen -W "$OPTS" $CUR) )
      return 0
      ;;

  esac
}

complete -F _radius_guest radius-guest

_radius_nas() {
  local CUR PREV OPTS
  COMPREPLY=()
  CUR="${COMP_WORDS[COMP_CWORD]}"
  PREV="${COMP_WORDS[COMP_CWORD-1]}"

  case "$PREV" in
    radius-nas)
      OPTS="add show update delete help"
      COMPREPLY=( $(compgen -W "$OPTS" $CUR) )
      return 0
      ;;

    show|update|delete)
      COMPREPLY=( $(compgen -W "$(_get_nas_shortname $CUR)" $CUR) )
      return 0
      ;;

  esac
}

complete -F _radius_nas radius-nas

_radius_clean() {
  local CUR PREV OPTS
  COMPREPLY=()
  CUR="${COMP_WORDS[COMP_CWORD]}"
  PREV="${COMP_WORDS[COMP_CWORD-1]}"

  case "$PREV" in
    radius-clean)
      OPTS="radpostauth"
      COMPREPLY=( $(compgen -W "$OPTS" $CUR) )
      return 0
      ;;

  esac
}

complete -F _radius_clean radius-clean

_radius_install_uninstall() {
  local CUR PREV OPTS
  COMPREPLY=()
  CUR="${COMP_WORDS[COMP_CWORD]}"
  PREV="${COMP_WORDS[COMP_CWORD-1]}"

  case "$PREV" in
    radius-install|radius-uninstall)
      OPTS="all common infouser infogroup nas radacct radcheck radgroupcheck radgroupreply radreply radusergroup radpostauth cui ippool wimax"
      COMPREPLY=( $(compgen -W "$OPTS" $CUR) )
      return 0
      ;;

  esac
}

complete -F _radius_install_uninstall radius-install radius-uninstall

_radius_log() {
  local CUR PREV OPTS
  COMPREPLY=()
  CUR="${COMP_WORDS[COMP_CWORD]}"
  PREV="${COMP_WORDS[COMP_CWORD-1]}"

  case "$PREV" in
    radius-log)
      OPTS="last-logins user-count user-log nas-count db-values db-layout log-file"
      COMPREPLY=( $(compgen -W "$OPTS" $CUR) )
      return 0
      ;;

  esac
}

complete -F _radius_log radius-log

_radius_user() {
  local CUR PREV OPTS
  COMPREPLY=()
  CUR="${COMP_WORDS[COMP_CWORD]}"
  PREV="${COMP_WORDS[COMP_CWORD-1]}"

  case "$PREV" in
    radius-user)
      OPTS="add delete help password show update"
      COMPREPLY=( $(compgen -W "$OPTS" $CUR) )
      return 0
      ;;

    show|update|delete)
      COMPREPLY=( $(compgen -W "$(_get_username $CUR)" $CUR) )
      return 0
      ;;

  esac
}

complete -F _radius_user radius-user

# vim: set ts=2 sw=2 sts=2 et :
