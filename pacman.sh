function pacaur { # $1 : File downloaded from AUR
  readonly AURDir="/home/gahag/AUR/"

  for package in "$@" ; do
    local packageFileName="$(basename "$package")"
    local packageName="${packageFileName%%.*}"
    local packageDirectory="$AURDir$packageName/"
    
    if [ -d "$packageDirectory" ]; then
      echo -e "Error: directory '$packageDirectory' already exists.\nAborting."
      return -1;
    fi
    
    mkdir "$packageDirectory"
    mv "$package" "$packageDirectory"
    cd "$packageDirectory"
    tar xvzf "$packageFileName"
    cd "$packageName"
    makepkg -s
    sudo pacman -U *.pkg.tar.xz
  done
}
