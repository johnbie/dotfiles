alias dotfile='/usr/bin/git --git-dir=$HOME/dotfiles/.git --work-tree=$HOME/dotfiles/'
alias dotfiles='cd $HOME/dotfiles'

alias helper='cd $HOME/helper-scripts'

alias clipboard='xclip -selection c -o'
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

