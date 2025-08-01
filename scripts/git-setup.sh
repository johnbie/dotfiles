# /usr/bin/env bash
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

read -p "Enter your email (or empty to skip): " email && [[ "$email" == *"@"* ]] && ssh-keygen -t ed25519 -C "$email" # || echo "Skipping SSH key setup"

read -p "Clone dotfiles? [Y/n] " confirm && [[ $confirm =~ ^[Yy]$|^$ ]]  && git clone git@github.com:johnbie/dotfiles.git ~/dotfiles
read -p "Clone second-brain? [Y/n] " confirm && [[ $confirm =~ ^[Yy]$|^$ ]] && mkdir -p ~/notes && git clone git@github.com:johnbie/second-brain.git ~/notes/second-brain
read -p "Clone helper-scripts? [Y/n] " confirm && [[ $confirm =~ ^[Yy]$|^$ ]] && mkdir -p ~/dev && git clone git@github.com:johnbie/helper-scripts.sh ~/dev/helper-scripts

