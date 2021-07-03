#!/usr/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

ln -svT "${SCRIPT_DIR}/autoload" "${HOME}/.local/share/nvim/site/autoload"
ln -svT "${SCRIPT_DIR}/config" "${HOME}/.config/nvim"
