alias ls='ls --color=auto'

function partbkp { # $1 : Partition ID (sdXY) ; $2 : Output file
  sudo dd if="/dev/$1" conv=sync,noerror bs=64K "of=$2"
}
