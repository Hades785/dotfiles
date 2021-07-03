prompt_escape () {
  print -n "${@//\%/%%}"
}

prompt_preexec_hook () {
  typeset -gF _PROMPT_START_TIME="$EPOCHREALTIME"
}

prompt_precmd_hook () {
  if [[ -v _PROMPT_START_TIME ]]; then
    local -F duration="$((EPOCHREALTIME - _PROMPT_START_TIME))"
    unset _PROMPT_START_TIME

    if (( duration > 1 )); then
      local -i t="${duration}" d h m s
      typeset -g _PROMPT_EXEC_TIME=""
      d="$((t/60/60/24))"
      h="$((t/60/60%24))"
      m="$((t/60%60))"
      s="$((t%60))"
      (( d > 0 )) && _PROMPT_EXEC_TIME+="${d}d"
      (( h > 0 )) && _PROMPT_EXEC_TIME+="${h}h"
      (( m > 0 )) && _PROMPT_EXEC_TIME+="${m}m"
      _PROMPT_EXEC_TIME+="${s}s"
    else
      unset _PROMPT_EXEC_TIME
    fi
  fi
}

prompt_vcs_info () {
  if [[ "$(command git rev-parse --is-inside-work-tree)" != true ]]; then
    return
  fi

  local branch line
  command git branch | while IFS= read -r line; do
    if [[ "${line}" == "* "* ]]; then
      branch="${line#\* }"
      break
    fi
  done
  branch=${branch:-"no branches"}

  print -n ' %F{blue}git:%F{magenta}'"$(prompt_escape "${branch}")"'%f'
}

setopt prompt_cr prompt_sp prompt_subst

zmodload zsh/datetime
autoload -Uz add-zsh-hook

add-zsh-hook preexec prompt_preexec_hook
add-zsh-hook precmd  prompt_precmd_hook



# base
PROMPT='%F{8}┌─%f%B'

# user
PROMPT+='%F{%(!.red.yellow)}%n%f'

# hostname
PROMPT+='@%F{'
[[ -v SSH_CONNECTION ]] && PROMPT+='blue' || PROMPT+='green'
PROMPT+='}%m%f'

# working dir
PROMPT+=':%F{cyan}%~%f'

# git info
PROMPT+='$(prompt_vcs_info 2>/dev/null)'

# python virtualenv
# PROMPT+='${VIRTUAL_ENV:+" %F{blue}venv:%F{magenta}${VIRTUAL_ENV:t}%f"}'
# VIRTUAL_ENV_DISABLE_PROMPT=true

# pyenv
# PROMPT+='${PYENV_VERSION:+" %F{blue}pyenv:%F{magenta}${PYENV_VERSION:t}%f"}'
# PYENV_VIRTUAL_ENV_DISABLE_PROMPT=true

# spacer
PROMPT+=' '

# cmd exec time
PROMPT+='${_PROMPT_EXEC_TIME:+" %F{yellow}$(prompt_escape "${_PROMPT_EXEC_TIME}")%f"}'

# exit code
PROMPT+='%(?.. %F{red}EXIT:%?%f)'

# background jobs
PROMPT+='%1(j. %F{blue}JOBS:%j%f.)'

# newline
PROMPT+=$'\n'

PROMPT+='%b%F{8}└─%f'

PROMPT+='%F{%(?.green.red)}%(!.#.\$)%f '


PROMPT2=' %_> '
