readonly dccdir="/mnt/dcc"


function dcc-mount {
  bashrc-require sshfs || return 1
  
  if [ "$#" -ne 1 ]; then
    echo "Missing user name."
    return
  fi
  
  sshfs "$@"@login.dcc.ufmg.br: $dccdir
}


function dcc-umount {
  bashrc-require fuse2 || return 1
  
  fusermount -u $dccdir
}
