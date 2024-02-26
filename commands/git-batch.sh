#!/bin/sh

# Usage Guide
# Run an arbituary git command on a collection of repositories as defined in the ~/dotfiles/configs/**/repos text file.
# For instance, `.git-batch.sh fetch main` fetches on all repositories defined in ~/dotfiles/configs/main/repos
# and `.git-batch.sh fetch --all main` fetches for all remotes.

# define a function
git_operate() {
    git_command=$1
    repo_dir=$2
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

# need 2 parameters
if [ $# -lt 2 ]; then
    echo "At least 2 arguments are required. $# passed"
    return 1
fi

# set up variables
configs_namespace=${@: -1}
git_command=${@:1:$#-1}
repos_path="$HOME/dotfiles/configs/$configs_namespace/repos"

# repos path exists
if [ ! -f $repos_path ]; then
    echo "Repos file $repos_path not found."
    return 1
fi

cat $repos_path | parallel --keep-order git_operate $git_command $repo_dir
#while IFS= read -r repo_dir; do
#    git_operate $repo_dir
#done < $repos_path
