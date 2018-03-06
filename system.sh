alias ls='ls --color=auto -lh --time-style long-iso'

alias rm="rm -I"
alias mv="mv -i"
alias cp="cp -i"
alias ln="ln -i"
alias mkdir='mkdir -p'

man() {
  LESS_TERMCAP_md=$'\e[01;34m'    \
  LESS_TERMCAP_me=$'\e[0m'        \
  LESS_TERMCAP_se=$'\e[0m'        \
  LESS_TERMCAP_so=$'\e[01;44;37m' \
  LESS_TERMCAP_ue=$'\e[0m'        \
  LESS_TERMCAP_us=$'\e[01;32m'    \
  command man "$@"
}


# function partbkp { # $1 : Partition ID (sdXY) ; $2 : Output file
#   sudo dd if="/dev/$1" conv=sync,noerror bs=64K "of=$2"
# }

function gahag-backup {
  # add --delete flag to delete extraneous files from the
  # receiving side (ones that aren’t on the sending side).
  rsync -av /gahag "/run/media/gahag/gahag - portable/backup/" 2>&1 \
  | tee $(date '+%Y-%m-%d(%H:%M:%S)-rsync.log')
}

function pacman-list-packages {
  # pacman -Qqe : list explicitly installed packages.
  # pacman -Qqm : list foreign installed packages (AUR).
  for p in $(pacman -Qqe; pacman -Qqm); do
    echo $p : $(pacman -Qi $p | grep -m1 Description | tr -s ' ' | cut -d ' ' -f 3-)
  done
}
