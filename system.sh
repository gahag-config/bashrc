alias ls='ls --color=auto -lh --time-style long-iso'

alias mv="mv -i"
alias cp="cp -i"
alias ln="ln -i"
alias mkdir='mkdir -p'

function partbkp { # $1 : Partition ID (sdXY) ; $2 : Output file
  sudo dd if="/dev/$1" conv=sync,noerror bs=64K "of=$2"
}
