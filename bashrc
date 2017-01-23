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


dir=$(scriptdir)

source $dir/audio.sh
source $dir/dcc.sh
source $dir/grep.sh
source $dir/kde.sh
source $dir/pacman.sh
source $dir/ps1.sh
source $dir/system.sh
source $dir/util.sh
source $dir/youtube.sh

unset dir scriptdir
