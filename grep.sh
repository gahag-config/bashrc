alias igrep='grep -i'

alias psgrep='ps aux | grep'

function grepcode { # $1 : Pattern for input files ; $2 : regex to match
  egrep --include "$1" -lir "$2" *
}
