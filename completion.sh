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

_get_nasname() {
  _mysql_silent "
    SELECT 
      nasname 
    FROM nas 
    WHERE nasname LIKE '$1%'
  "
}

_radius_level1() {
  local CUR PREV OPTS
  COMPREPLY=()
  CUR="${COMP_WORDS[COMP_CWORD]}"
  PREV="${COMP_WORDS[COMP_CWORD-1]}"

  case "$PREV" in

    radius-clean)
      OPTS="radpostauth"
      ;;

    radius-group)
      OPTS="add delete help prepopulate show update"
      ;;

    radius-guest)
      OPTS="add count delete-expired show-expired"
      ;;

    radius-install)
      OPTS="all common infouser infogroup nas radacct radcheck radgroupcheck radgroupreply radreply radusergroup radpostauth cui ippool wimax"
      ;;

    radius-log)
      OPTS="last-logins user-count user-log nas-count db-values db-layout log-file"
      ;;

    radius-nas)
      OPTS="add show update delete help"
      ;;

    radius-uninstall)
      OPTS="all common infouser infogroup nas radacct radcheck radgroupcheck radgroupreply radreply radusergroup radpostauth cui ippool wimax"
      ;;

    radius-user)
      OPTS="add delete help password show update"
      ;;

  esac
  
  if [ -n "$OPTS" ]; then
    COMPREPLY=( $(compgen -W "$OPTS" $CUR) )
    return 0
  fi

}

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
