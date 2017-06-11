PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs

__prompt_command() {
  local EXIT="$?" # This needs to be first
  
  local RCol='\[\e[0m\]'
  
  local Red='\[\e[0;91m\]'
  local Gre='\[\e[0;32m\]'
  local Yel='\[\e[0;93m\]'
  local BBlu='\[\e[1;34m\]'
  local Pur='\[\e[0;35m\]'
  
  PS1="${BBlu}[${RCol}\u "
  
  if [ $EXIT != 0 ]; then
    PS1+="${Red}$EXIT "
  fi

  PS1+="${Yel}\W${BBlu}]>${RCol} "
}
