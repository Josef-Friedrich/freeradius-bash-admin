#! /bin/bash

. /etc/freeradius-bash-admin.conf

_get_username() {
  _mysql_silent "
    SELECT username 
    FROM radcheck 
    WHERE username LIKE '$1%'
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

    radius-export)
      OPTS=""
      ;;

    radius-group)
      OPTS="add delete help prepopulate show update"
      ;;

    radius-guest)
      OPTS="add count delete-expired show-expired"
      ;;

    radius-import)
      OPTS=""
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

#  if [[ ${prev} == "show" ]]; then
 #   COMPREPLY=( $(compgen -W "$(_get_username ${cur})" ${cur}) )
#      return 0
#  fi
}

complete -F _radius_level1 radius-log radius-user radius-group

# vim: set ts=2 sw=2 sts=2 et :
