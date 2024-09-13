#!/usr/bin/env bash

# nvm
export NVM_DIR="$HOME/dotfiles/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
