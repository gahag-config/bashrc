function drive-pull {
  bashrc-require rclone || return 1
  
  for file in "$@"; do
    rclone --skip-links copy drive:/"$file" ./
  done
}

function drive-push {
  bashrc-require rclone || return 1
  
  for file in "$@"; do
    rclone --skip-links copy "$file" drive:/
  done
}
