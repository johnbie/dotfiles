# ad an alisas per defined aliases in configs folder
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

