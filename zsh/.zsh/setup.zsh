# Program specific setup.

# Node Version Manager {{{
# NVM init
if [[ -s "/usr/share/nvm/init-nvm.sh" ]]; then
  source /usr/share/nvm/init-nvm.sh
  echo "Loaded NVM specific setup."
fi
# }}}

# Ruby Version Manager {{{
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
  echo "Loaded RVM specific setup."
fi
# }}}

