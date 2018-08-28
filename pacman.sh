function pacman-list-packages {
  # pacman -Qqe : list explicitly installed packages.
  # pacman -Qqm : list foreign installed packages (AUR).
  for p in $(pacman -Qqe; pacman -Qqm); do
    echo $p : $(pacman -Qi $p | grep -m1 Description | tr -s ' ' | cut -d ' ' -f 3-)
  done
}
