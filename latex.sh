function latex-spellcheck {
  bashrc-require aspell || return 1
  
  aspell -c -d pt_BR -t "$@"
}
