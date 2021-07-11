#!/usr/bin/env zsh

# Clear all aliases
unalias -a

# Interactive cp all the time.
alias cp='cp -i'

# Human readable df.
alias df='df -h'

# Free memory in mebibytes.
alias free='free -m'

# more sucks {{{
if command -v "more" &> /dev/null; then
if command -v "less" &> /dev/null; then
  alias more='less'
fi; fi
# }}}

# grep {{{
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
#}}}

# ls / exa {{{
if ! command -v "exa" &> /dev/null; then
  alias ls='ls --color=auto'
else
  alias ls='exa --icons'
fi

alias lsl='ls -l'
#}}}

# kittens (only on Kitty terminal) {{{
if [[ "$TERM" == "xterm-kitty" ]]; then
  alias image='kitty +kitten icat'
fi
#}}}
