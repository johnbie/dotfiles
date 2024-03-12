#!/usr/bin/env bash

# Usage Guide
# Run an arbituary git command on a collection of repositories as defined in the ~/dotfiles/configs/**/repos text file.
# For instance, `.git-batch.sh fetch main` fetches on all repositories defined in ~/dotfiles/configs/main/repos
# and `.git-batch.sh fetch --all main` fetches for all remotes.
#
# You can also fetch on all namespace with `.git-batch.sh fetch all`.

# define a function
git_operate() {
    local repo_dir=${@: -1}
    local git_command=${@:1:$#-1}
    # Skip if directory path is empty
    if [ -z "$repo_dir" ]; then
        return 0
    fi

    # evaluate any bash variables
    eval "repo_dir=$repo_dir"

    # Check if the directory exists
    if [ -d "$repo_dir" ]; then
        echo "Running 'git $git_command' on '$repo_dir'"

        # Change directory and perform git operation
        cd "$repo_dir" || continue
        eval "git $git_command"

        # return to previous directory
        cd - > /dev/null
    else
        echo "Directory '$repo_dir' does not exist."
    fi
    printf "\n"
}
export -f git_operate

# define the batch function
git_batch() {
    local configs_namespace=${@: -1}
    local git_command=${@:1:$#-1}
    # namespace exists
    if [ ! -d "$HOME/dotfiles/configs/$configs_namespace" ]; then
        echo "namespace does not exist"
        return 1
    fi

    repos_path="$HOME/dotfiles/configs/$configs_namespace/repos"

    # repos exists
    if [ ! -f $repos_path ]; then
        return 0
    fi

    echo "$repos_path"
    echo "$git_command"
    cat $repos_path | parallel --keep-order git_operate $git_command
}
export -f git_batch

# need 2 parameters
if [ $# -lt 2 ]; then
    echo "At least 2 arguments are required. $# passed"
    return 1
fi

# set up variables
configs_namespace=${@: -1}
git_command=${@:1:$#-1}

if [ "$configs_namespace" == "all" ]; then
    ls "$HOME/dotfiles/configs" | parallel --keep-order git_batch $git_command
else
    git_batch $git_command $configs_namespace
fi
