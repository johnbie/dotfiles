alias dotfile='/usr/bin/git --git-dir=$HOME/dotfiles/.git --work-tree=$HOME/dotfiles/'
alias dotfiles='cd $HOME/dotfiles'
alias clipboard='xclip -selection c -o'

configs_dir="$HOME/dotfiles/configs"
if [ -d "$configs_dir" ]; then
    # Loop through each sub-folder
    for folder in "$configs_dir"/*; do
        if [ -f "$folder/aliases.sh" ]; then
            source "$folder/aliases.sh"
        fi
    done
fi
