export ZSH_DIR="${HOME}/.zsh"
export ZSH_CACHE_DIR="${ZSH_DIR}/cache"

# Performance (taken from @dmitmel's dotfiles) {{{
zmodload zsh/datetime
typeset -A _perf_timers

_perf_timer_start() {
  local name="$1"
  if [[ -z "$name" ]]; then
    print >&2 "$0: usage: $0 <name>"
    return 1
  fi
  _perf_timers[$name]="$EPOCHREALTIME"
}

_perf_timer_stop() {
  # Record the stop time as precisely as possible even in the case of an error
  local stop_time="$EPOCHREALTIME"
  local name="$1"
  if [[ -z "$name" ]]; then
    print >&2 "$0: usage: $0 <name>"
    return 1
  fi
  local start_time="${_perf_timers[$name]}"
  unset "_perf_timers[${(qq)name}]"
  local -i duration="$(( (stop_time - start_time) * 1000 ))"
  print -r -- "$(print -P '%F{8}==>%f') ${name}: ${duration}ms"
}
# }}}

_perf_timer_start "total"

# Load base zsh config.
_perf_timer_start "init.zsh"
source "${ZSH_DIR}/init.zsh"
_perf_timer_stop "init.zsh"

# Load Dima's prompt.
_perf_timer_start "prompt.zsh"
source "${ZSH_DIR}/prompt.zsh"
_perf_timer_stop "prompt.zsh"

# Load program specific setups.
_perf_timer_start "setup.zsh"
source "${ZSH_DIR}/setup.zsh"
_perf_timer_stop "setup.zsh"

# Load Dima's zle setup.
_perf_timer_start "zle.zsh"
source "${ZSH_DIR}/zle.zsh"
_perf_timer_stop "zle.zsh"

# Load aliases.
_perf_timer_start "alias.zsh"
source "${ZSH_DIR}/alias.zsh"
_perf_timer_stop "alias.zsh"

_perf_timer_stop "total"

# Autoloads functions.
functionsDir="${ZSH_DIR}/functions"
fpath=( ${functionsDir} "${fpath[@]}" )
autoload -Uz $functionsDir/*(.:t)
