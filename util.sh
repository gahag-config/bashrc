function clipboard {
  bashrc-require xclip || return 1
  
  xclip -selection c "$@"
}

function tolower {
  echo "${@,,}"
}

function toupper {
  echo "${@^^}"
}

function pick {
  sed -n "$@ p"
}
