function youtube-dlm {
  bashrc-require yt-dlp || return 1

  yt-dlp --format bestaudio --extract-audio --audio-format mp3 --audio-quality 320k "$@"
}

function youtube-dlv {
  bashrc-require yt-dlp || return 1

  yt-dlp -f 22 "$@"
}
