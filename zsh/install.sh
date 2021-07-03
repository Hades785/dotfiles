#!/usr/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

ln -svf "${SCRIPT_DIR}/.zshrc" "${HOME}/.zshrc"
ln -svT "${SCRIPT_DIR}/.zsh" "${HOME}/.zsh"
ln -svf "${SCRIPT_DIR}/.profile" "${HOME}/.profile"
