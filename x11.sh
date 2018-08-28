function x11-clip {
  bashrc-require xclip || return 1
  
  xclip -selection c "$@"
}
