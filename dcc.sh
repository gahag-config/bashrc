readonly dccdir="/mnt/dcc"

function dccsshfs {
  if [ "$#" -ne 1 ]; then
    echo "Missing user name."
    return
  fi
  
  sshfs $@@login.dcc.ufmg.br: $dccdir
}

alias dccumount='fusermount -u $dccdir'
