case "$TERM" in
  "tramp") # emacs tramp compatibility
    PS1="> "
    ;;
  *)
    PROMPT_COMMAND=__prompt_command # Func to gen PS1 after CMDs
    ;;
esac

declare -A PS1_EXTS

__prompt_command() {
  local EXIT="$?" # This needs to be first

  local Reset='\[\e[0m\]'

  local Red='\[\e[0;91m\]'
  local Gre='\[\e[0;32m\]'
  local Yel='\[\e[0;93m\]'
  local BBlu='\[\e[1;34m\]'
  local Pur='\[\e[0;35m\]'

  local Corner1='\342\224\214'
	local Corner2='\342\224\224'
	local Dash='\342\224\200'
	local Bar='\342\224\202'

  if [ -n "$PROMPT_INIT" ]; then
    PS1="\n"
  else
    PS1=""
    PROMPT_INIT=yes
  fi

  # [exit_status]
  PS1+="${Corner1}${BBlu}[${Reset}"

  if [ $EXIT != 0 ]; then
    PS1+="${Red}"
  else
    PS1+="${Gre}"
  fi

  PS1+="$EXIT${BBlu}]${Reset}${Dash}"

  if [ $EXIT -lt 10 ]; then
    PS1+="${Dash}"
  fi

  if [ $EXIT -lt 100 ]; then
    PS1+="${Dash}"
  fi

  # [user:host]
  PS1+="${BBlu}[${Reset}\u@\h${BBlu}]${Reset}"

  # extensions
  for key in "${!PS1_EXTS[@]}"; do  # [workdir]
    PS1+="${Dash}${Dash}${Dash}${BBlu}[${Pur}$key:${PS1_EXTS[$key]}${BBlu}]${Reset}"
  done

  # [workdir]
  PS1+="${Dash}${Dash}${Dash}${BBlu}[${Yel}\w${BBlu}]${Reset}"

  # prompt
  PS1+="\n${Corner2}${Dash}${BBlu}λ${Reset} "
}
