alias fm=musics-find
alias sdl='rslizzy'

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


extensions=(
  -name '*.mp3' -o
  -name '*.flac' -o
  -name '*.wav' -o
  -name '*.aif' -o
  -name '*.aiff' -o
  -name '*.m4a'
)

function list-musics {
  find $musicdir -type f -print0 \( "${extensions[@]}" \)
}

function musics-stats {
  printf "Audio files: "
  list-musics | tr -cd '\0' | wc -c

  printf "Playback time: "
  duration_milis="$(
    list-musics \
      | xargs --null -- mediainfo --Output='Audio;%Duration%\n' \
      | awk NF \
      | paste -s -d + \
      | bc
  )"
  echo "$duration_milis / 1000" | bc
}
