export ZSH_DIR="${HOME}/.zsh"
export ZSH_CACHE_DIR="${ZSH_DIR}/cache"

# Create cache directory if it doesn't exist.
[[ ! -d "${ZSH_CACHE_DIR}" ]] && mkdir "${ZSH_CACHE_DIR}"

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

# Load ZPLG.
_perf_timer_start "zplg.zsh"
# Download fresh copy of ZPLG regularly (once every two weeks).
refresh_zplg=1
for match in "${ZSH_CACHE_DIR}/zplg.zsh"(N.m-14); do
  refresh_zplg=0
done; unset match
if [[ ! $refresh_zplg -eq 0 ]]; then
  echo "Downloading zplg"
  curl "https://raw.githubusercontent.com/dmitmel/dotfiles/master/zsh/zplg.zsh" > "${ZSH_CACHE_DIR}/zplg.zsh"
fi
unset refresh_zplg

source "${ZSH_CACHE_DIR}/zplg.zsh"
_perf_timer_stop "zplg.zsh"

# Load plugins.
_perf_timer_start "plugins.zsh"
source "${ZSH_DIR}/plugins.zsh"
_perf_timer_stop "plugins.zsh"

# Load program specific setups.
_perf_timer_start "setup.zsh"
source "${ZSH_DIR}/setup.zsh"
_perf_timer_stop "setup.zsh"

# Load aliases.
_perf_timer_start "alias.zsh"
source "${ZSH_DIR}/alias.zsh"
_perf_timer_stop "alias.zsh"

# Load completions.
_perf_timer_start "completion.zsh"
source "${ZSH_DIR}/completion.zsh"
_perf_timer_stop "completion.zsh"

# Load keybindings.
_perf_timer_start "keybinding.zsh"
source "${ZSH_DIR}/keybinding.zsh"
_perf_timer_stop "keybinding.zsh"

# Load Dima's zle setup.
_perf_timer_start "zle.zsh"
source "${ZSH_DIR}/zle.zsh"
_perf_timer_stop "zle.zsh"

# Load Dima's prompt.
_perf_timer_start "prompt.zsh"
source "${ZSH_DIR}/prompt.zsh"
_perf_timer_stop "prompt.zsh"

_perf_timer_stop "total"

# Autoloads functions.
functionsDir="${ZSH_DIR}/functions"
fpath=( ${functionsDir} "${fpath[@]}" )
autoload -Uz $functionsDir/*(.:t)
