function drive-pull {
  bashrc-require rclone || return 1
  
  for file in "$@"; do
    rclone sync drive:/$file ./
  done
}

function drive-push {
  bashrc-require rclone || return 1
  
  rclone sync "$@" drive:/
}
