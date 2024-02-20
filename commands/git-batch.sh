#!/bin/sh

# Usage Guide
# Run an arbituary git command on a collection of repositories as defined in the ~/dotfiles/configs/**/repos text file.
# For instance, `.git-batch.sh main fetch` fetches on all repositories defined in ~/dotfiles/configs/main/repos
# and `.git-batch.sh main "fetch --all"` fetches for all remotes.


# need 2 parameters
if [ $# -ne 2 ]; then
    echo "At least 2 arguments are required"
    return 1
fi

# set up variables
configs_namespace=$1
git_command=$2
repos_path="$HOME/dotfiles/configs/$configs_namespace/repos"

# repos path exists
if [ ! -f $repos_path ]; then
    echo "Repos file $repos_path not found."
    return 1
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
