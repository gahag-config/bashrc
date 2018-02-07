#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


function scriptdir {
  local bash_src="${BASH_SOURCE[0]}"
  
  while [ -h "$bash_src" ]; do # resolve $bash_src until the file is no longer a symlink
    local dir="$( cd -P "$( dirname "$bash_src" )" && pwd )"
    bash_src="$(readlink "$bash_src")"
    
    # if $bash_src was a relative symlink, we need to resolve it
    # relative to the path where the symlink file was located.
    [[ $bash_src != /* ]] && bash_src="$dir/$bash_src" 
  done
  
  echo "$( cd -P "$( dirname "$bash_src" )" && pwd )"
}


export BASHRC_DIR=$(scriptdir)

source $BASHRC_DIR/require.sh
source $BASHRC_DIR/audio.sh
source $BASHRC_DIR/dcc.sh
source $BASHRC_DIR/drive.sh
source $BASHRC_DIR/github.sh
source $BASHRC_DIR/grep.sh
source $BASHRC_DIR/kde.sh
source $BASHRC_DIR/latex.sh
source $BASHRC_DIR/ps1.sh
source $BASHRC_DIR/system.sh
source $BASHRC_DIR/util.sh
source $BASHRC_DIR/youtube.sh
