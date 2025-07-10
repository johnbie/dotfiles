
# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# run the auto-run scripts
autoload_scripts="$HOME/dotfiles/autoload"
if [ -d "$autoload_scripts" ]; then
    # Loop through each sub-folder
    for autoload_script in "$autoload_scripts"/*; do
        . "$autoload_script"
    done
fi

# add commands to path
export PATH="$PATH:$HOME/dotfiles/commands"
