function bashrc-require {
  if ! pacman -Qi "$@" &> /dev/null; then
    (>&2
      echo Package "$@" not installed!
      echo Type password to install, or C-c to quit.
    )
    sudo pacman -S "$@"
  fi
}
