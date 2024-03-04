alias dotfiles='cd $HOME/dotfiles'
alias helper='cd $HOME/helper-scripts'

alias source-profile='source $HOME/.profile'

alias xclipi='xclip -selection c'
alias xclipo='xclip -selection c -o'
alias apt-sources='cd /etc/apt/sources.list.d'

# do a per-configs folder configuration
configs_dir="$HOME/dotfiles/configs"
if [ -d "$configs_dir" ]; then
    # Loop through each sub-folder
    for folder in "$configs_dir"/*; do
        # add aliases
        if [ -f "$folder/aliases.sh" ]; then
            source "$folder/aliases.sh"
        fi
    done
fi

# add an alias per commands file
commands_dir="$HOME/dotfiles/commands"
if [ -d "$commands_dir" ]; then
    for command_file in "$commands_dir"/*; do
        # Check if the file is a regular file and executable
        if [ -f "$command_file" ] && [ -x "$command_file" ]; then
            # Extract the command from the file path
            command_name=$(basename "$command_file")
            # Define the alias
            alias_name="${command_name%.sh}"  # Remove the '.sh' extension
            alias_command="source $command_file"
            # Add the alias to the shell configuration file (e.g., ~/.bashrc)
            eval "alias $alias_name=\"$alias_command\""
        fi
    done
fi
