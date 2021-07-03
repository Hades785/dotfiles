export ZSH_DIR="${HOME}/.zsh"

# Performance taken from [https://github.com/dmitmel/dotfiles/] {{{
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

echo "Loading base zsh options."
_perf_timer_start "init.zsh"
source "${ZSH_DIR}/init.zsh"
_perf_timer_stop "init.zsh"
echo

echo "Loading prompt."
_perf_timer_start "prompt.zsh"
source "${ZSH_DIR}/prompt.zsh"
_perf_timer_stop "prompt.zsh"
echo

echo "Program specific initialisation."
_perf_timer_start "setup.zsh"
source "${ZSH_DIR}/setup.zsh"
_perf_timer_stop "setup.zsh"
echo

echo "Loading custom functions."
_perf_timer_start "functions.zsh"
source "${ZSH_DIR}/functions.zsh"
_perf_timer_stop "functions.zsh"
echo

echo "Loading aliases."
_perf_timer_start "alias.zsh"
source "${ZSH_DIR}/alias.zsh"
_perf_timer_stop "alias.zsh"
echo

echo "Done loading shell."
_perf_timer_stop "total"

