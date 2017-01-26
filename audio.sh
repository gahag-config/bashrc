alias fm=findmusik

musicdir="/gahag/media/music/"

function findmusik {
  find $musicdir -iregex ".*$*.*"
}


alias ffprobe-music='ffprobe -hide_banner'

function ffprobe-bitrate { # $@ : Input files
  for f in "$@" ; do
    echo $f $(ffprobe-music "$f" 2>&1 | grep "Hz,.*kb/s")
  done
}
