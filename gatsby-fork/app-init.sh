#!/bin/bash

# Execute this script upon attaching to the container
# Cloning original repo into local device with only latest commit, then push them into your own remote repo

# Getting variables from external txt file
. ./variables.txt
# This is a recommended setting for VSCode users
if [ -d "$VSCDIR" ]; then
    if [ ! -f "$VSCJSON" ]; then
        echo -e "$VSCSET" >"$VSCJSON"
    fi
fi
# Store git-credentials at container home dir upon first time git authorization
git config --global credential.helper store
# Git user info set globally prior to gatsby new installation
git config --global user.name "$GIT_UNAME"
git config --global user.email "$GIT_UMAIL"
# npx cache clear
npx -y clear-npx-cache
# Launch project without installing gatsby-cli
npx -y gatsby new "$REPODIR" "$RMT_REPO_ADDR"
# Move to app repository
cd "$REPODIR" || exit 1
# If current branch is not main, change its name to main
if [ "$($SHOW_CRB_CMD)" != "main" ]; then
    git branch -m "$($SHOW_CRB_CMD)" main
fi
# Add remote and push to your own remote repo
git remote add origin "$MY_REPO_ADDR"
git push -u origin main
