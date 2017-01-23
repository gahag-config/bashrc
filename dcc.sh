readonly dccdir="/mnt/dcc"

function dcc-sshfs {
  if [ "$#" -ne 1 ]; then
    echo "Missing user name."
    return
  fi
  
  sshfs $@@login.dcc.ufmg.br: $dccdir
}

alias dcc-umount='fusermount -u $dccdir'
