#!/usr/bin/env bash
#
# gtree - git tree


setCommits() {
    # if you're in a git repo
    # get the current commit ID
    if git status; then
        curCommit=$(git rev-parse HEAD)
        lastCommit=$(git rev-parse HEAD^)
    else
        exit 0
    fi

}

main() {
    setCommits
    # if the tree command exists
    if command -v tree &>/dev/null; then
        echo "tree exists"
    else
        echo "tree isn't installed, install it and run again"
        exit 0
    fi
}

main "$@"
