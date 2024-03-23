configs_dir="$HOME/dotfiles/configs"
if [ -d "$configs_dir" ]; then
    # Loop through each sub-folder
    for folder in "$configs_dir"/*; do
        if [ -f "$folder/configs.sh" ]; then
            source "$folder/configs.sh"
        fi
    done
fi
