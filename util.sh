alias open='xdg-open'

alias lsblk='lsblk --fs'


function tolower {
  echo "${@,,}"
}

function toupper {
  echo "${@^^}"
}

function pick {
  sed "$1q;d" ${@:2}
}
