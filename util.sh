alias open='xdg-open'

function tolower {
  echo "${@,,}"
}

function toupper {
  echo "${@^^}"
}

function pick {
  sed -n "$@ p"
}
