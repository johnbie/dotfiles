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

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH="$HOME/.local/bin:$PATH"
