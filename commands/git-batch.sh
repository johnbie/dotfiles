#!/bin/sh

configs_namespace=$1
repos_path="$HOME/dotfiles/configs/$configs_namespace/repos"
git_command=$2

if [ ! -f $repos_path ]; then
    echo "Repos file $repos_path not found."
    exit 1
fi

# Read each line of the file
while IFS= read -r repo_dir; do
    # Skip if directory path is empty
    if [ -z "$repo_dir" ]; then
        continue
    fi

    # evaluate any bash variables
    eval "repo_dir=$repo_dir"

    # Check if the directory exists
    if [ -d "$repo_dir" ]; then
        echo "pulling for $repo_dir..."
        # Change directory and perform git operation
        cd "$repo_dir" || continue
        eval "git $git_command"

        # return to previous directory
        cd - > /dev/null
    else
        echo "Directory '$repo_dir' does not exist."
    fi
done < $repos_path
