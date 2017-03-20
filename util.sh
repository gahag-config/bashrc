alias clipboard='xclip -selection c'

function tolower {
  echo "${@,,}"
}

function toupper {
  echo "${@^^}"
}
