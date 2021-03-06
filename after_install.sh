#!/bin/bash

set -e # exit with nonzero exit code if anything fails

openssl aes-256-cbc -K $encrypted_95b1a418b9d1_key -iv $encrypted_95b1a418b9d1_iv -in deploy_key.enc -out deploy_key -d

GIT_NAME="Travis Deploy"
GIT_EMAIL="travisci@rmg.edu"
echo GIT_NAME: $GIT_NAME
echo GIT_EMAIL: $GIT_EMAIL

# use the decrypted deploy SSH key as
# the credentials to push to the RMG-tests repo:
chmod 600 deploy_key
eval `ssh-agent -s`
ssh-add deploy_key

git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"

REPO=git@github.com:ReactionMechanismGenerator/RMG-tests.git
git push $REPO --delete $BRANCH > /dev/null
