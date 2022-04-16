#!/bin/bash

# Execute this script upon attaching to the container
# Do not global install gatsby-cli, but cloning from repo and yarn install

# Getting variables from external txt file
. ./variables.txt
# Store git-credentials at container home dir upon first time git authorization
git config --global credential.helper store
# Skip this field if app repo is already installed into current directory
if [ ! -d "$REPODIR" ]; then
    git clone "$RMT_REPO_ADDR"
    # Copy the local unique file such as env file into app repository if necessary
    if [ -n "$DEV_ONLY_FILE" ]; then
        cp ./"$DEV_ONLY_FILE" ./"$REPODIR"
    fi
fi
# Move to app repository
cd "$REPODIR" || exit 1
# Store git user info locally
git config user.name "$GIT_UNAME"
git config user.email "$GIT_UMAIL"
# Module installation if necessary
if [ ! -d "$MDLDIR" ]; then
    yarn install
fi
