#!/usr/bin/env zsh

# Perfs wrapper (taken from @dmitmel's dotfiles) {{{
_plugin() {
  _perf_timer_start "plugin $1"
  plugin "$@"
  _perf_timer_stop "plugin $1"
}

_checkout_latest_version='build=plugin-cfg-git-checkout-version "*"'
# }}}

_plugin completions 'zsh-users/zsh-completions' "$_checkout_latest_version"
_plugin syntax-highlighting 'zsh-users/zsh-syntax-highlighting' "$_checkout_latest_version"
_plugin history-substring-search 'zsh-users/zsh-history-substring-search' "$_checkout_latest_version"
_plugin autosuggestions 'zsh-users/zsh-autosuggestions' "$_checkout_latest_version"

# compinit setup (taken from @dmitmel's dotfiles) {{{
  _perf_timer_start "compinit"

  # note that completion system must be initialized after zsh-completions and
  # before Oh My Zsh
  autoload -U compinit

  run_compdump=1
  # glob qualifiers description:
  #   N    turn on NULL_GLOB for this expansion
  #   .    match only plain files
  #   m-1  check if the file was modified today
  # see "Filename Generation" in zshexpn(1)
  for match in "${ZSH_CACHE_DIR}/zcompdump"(N.m-1); do
    run_compdump=0
    break
  done; unset match

  if (( $run_compdump )); then
    print -r -- "$0: rebuilding zsh completion dump"
    # -D flag turns off compdump loading
    compinit -D -d "${ZSH_CACHE_DIR}/zcompdump"
    compdump
  else
    # -C flag disables some checks performed by compinit - they are not needed
    # because we already have a fresh compdump
    compinit -C -d "${ZSH_CACHE_DIR}/zcompdump"
  fi
  unset run_compdump

  _perf_timer_stop "compinit"
# }}}
