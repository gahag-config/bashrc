function github-mkrepo {
  bashrc-require nano || return 1
  bashrc-require curl || return 1
  
  local cfgfile=github-repo-data.json
  
  [ -e $cfgfile ] || cp $BASHRC_DIR/$cfgfile .
  
  trap "rm $cfgfile" SIGINT
  
  nano $cfgfile
  
  curl -u 'gahag' https://api.github.com/user/repos -d "$(cat "$cfgfile")"
  
  local result=$?
  if (($result == 0)); then
    rm $cfgfile
  fi
  
  return $result
}


function github-add-origin {  # $1: repo name
  bashrc-require git || return 1
  
  git remote add origin https://github.com/gahag/$1.git
  git push -u origin master
}


function github-mkorigin {
  bashrc-require nano || return 1
  bashrc-require curl || return 1
  bashrc-require git  || return 1
  
  local cfgfile=github-repo-data.json
  
  [ -e $cfgfile ] || cp $BASHRC_DIR/$cfgfile .
  
  trap "rm $cfgfile" SIGINT
  
  nano $cfgfile
  
  curl -u 'gahag' https://api.github.com/user/repos -d "$(cat "$cfgfile")"
  ((result = result || $?))
  
  github-add-origin $(cat $cfgfile | jq -r '.name')
  ((result = result || $?))
  
  if (($result == 0)); then
    rm $cfgfile
  fi
  
  return $result
}
