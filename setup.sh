#!/bin/sh
backup_file() {
    if [ -f "$1" ]&& [ ! -h "$1" ]; then
        mv "$1" "${1}_back"
    fi
}

# create new variable
dotfiles_dir="$HOME/dotfiles"

# Check if dotfiles directory exists
if [ ! -d "$dotfiles_dir" ]; then
    echo "dotfiles doesn't exist! Cloning dotfiles repo from GitHub..."
    git clone git@github.com:johnbie/dotfiles "$HOME/dotfiles"
fi

# Loop through all files in the dotfiles directory
for file in "$dotfiles_dir"/* "$dotfiles_dir"/.*; do
     # Check if the item is a file and not a symbolic link
    if [ -f "$file" ]; then
        # Get the filename without path
        filename=$(basename "$file")
        backup_file "$HOME/${filename}"
    fi
done

# stow it
stow -d "$dotfiles_dir" .

