alias fm=musics-find
alias sdl='slizzy dl'

musicdir="/gahag/media/musics/"

function musics-find {
  find $musicdir -iregex ".*$*.*"
}


function musics-ffprobe {
  bashrc-require ffmpeg || return 1
  
  ffprobe -hide_banner "$@"
}


function musics-ffprobe-bitrate { # $@ : Input files
  bashrc-require ffmpeg || return 1
  
  for f in "$@" ; do
    echo $f $(ffprobe-music "$f" 2>&1 | grep "Hz,.*kb/s")
  done
}


function musics-nfs-start {
  bashrc-require nfs-utils || return 1
  
  sudo systemctl start nfs-server.service
}

function musics-nfs-stop {
  bashrc-require nfs-utils || return 1
  
  sudo systemctl stop nfs-server.service
}
