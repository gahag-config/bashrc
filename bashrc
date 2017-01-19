#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]> '


alias fm=findmusik

alias igrep='grep -i'

alias psgrep='ps aux | grep'

alias youtube-dlm='youtube-dl --format bestaudio --extract-audio --audio-format mp3 --audio-quality 320k'

alias youtube-dlv='youtube-dl -f 22 '

# partbkp ----------------------------------------------------------------------
function partbkp { # $1 : Partition ID (sdXY) ; $2 : Output file
  sudo dd if="/dev/$1" conv=sync,noerror bs=64K "of=$2"
}
# ------------------------------------------------------------------------------

# ffprobe ----------------------------------------------------------------------
alias ffprobem='ffprobe -hide_banner'

function fffprobem { # $@ : Input files
  for f in "$@" ; do
    echo $f
    ffprobem "$f" 2>&1 | grep "Hz,.*kb/s"
  done
  
  echo
}

function fbffprobem {
  local s="$1"
  shift
  fffprobem "$@" | grep -B1 "$s"
  echo
}
# ------------------------------------------------------------------------------

# pacman -----------------------------------------------------------------------
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
# ------------------------------------------------------------------------------

# grep -------------------------------------------------------------------------
function grepcode { # $1 : Pattern for input files ; $2 : regex to match
  egrep --include "$1" -lir "$2" *
}
# ------------------------------------------------------------------------------

# restart plasma 5 -------------------------------------------------------------
function restartplasma {
  killall plasmashell
  kstart plasmashell
}
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
function findmusik {
  find /gahag/musics/ -iregex ".*$*.*"
}
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
readonly dccdir="/mnt/dcc"

function dccsshfs {
  if [ "$#" -ne 1 ]; then
    echo "Missing user name."
    return
  fi
  
  sshfs $@@login.dcc.ufmg.br: $dccdir
}

alias dccumount='fusermount -u $dccdir'
# ------------------------------------------------------------------------------
