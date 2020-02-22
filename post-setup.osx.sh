#!/bin/sh

# These scripts assume that the environment is already set up.
# All the right environment variables are in place,
# All the 
for file in $(chezmoi source-path)/post-setup-osx*.sh; do
    source $file
done