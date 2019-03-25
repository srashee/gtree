#!/usr/bin/env bash
#
# gtree - git tree

# don't even need to do this
setCommits() {
    # if you're in a git repo
    # get the current commit ID
    if git status &>/dev/null; then
        curCommit=$(git rev-parse HEAD)
        lastCommit=$(git rev-parse HEAD^)
    else
        exit 0
    fi
}

findChanges() {
    changes=$(git --no-pager diff --name-only HEAD HEAD^)
}

parseTree() {
    print $changes
}

main() {
    setCommits
    # if the tree command exists
    if command -v tree &>/dev/null; then
        echo "Current commit is $curCommit"
        echo "Last commit is $lastCommit"
    else
        echo "tree isn't installed, install it and run again"
        exit 0
    fi
    findChanges
    parseTree
}

main "$@"
