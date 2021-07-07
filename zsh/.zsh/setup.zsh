# Program specific setup.

# Node Version Manager {{{
# NVM init
if [[ -s "/usr/share/nvm/init-nvm.sh" ]]; then
  source /usr/share/nvm/init-nvm.sh
fi
# }}}

# Ruby Version Manager {{{
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  source "$HOME/.rvm/scripts/rvm"
fi
# }}}

