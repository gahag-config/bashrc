function youtube-dlm {
  bashrc-require youtube-dl || return 1
  
  youtube-dl --format bestaudio --extract-audio --audio-format mp3 --audio-quality 320k "$@"
}

function youtube-dlv {
  bashrc-require youtube-dl || return 1
  
  youtube-dl -f 22 "$@"
}
