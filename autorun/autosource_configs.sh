configs_dir="$HOME/dotfiles/configs"
if [ -d "$configs_dir" ]; then
    # Loop through each sub-folder
    for folder in "$configs_dir"/*; do
        if [ -f "$folder/config.sh" ]; then
            source "$folder/config.sh"
        fi
    done
fi
