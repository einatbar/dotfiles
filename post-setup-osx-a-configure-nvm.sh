#!/bin/sh

# Default packages that will always get installed whenever a new node version is installed.
echo 'npmrc' > $NVM_DIR/default-packages

# Get the latest node version so we'll have something to work with.
nvm install --lts