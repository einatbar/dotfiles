#######################################
# Shell Aliases                       #
#######################################

# Override `ls` to always show detailed information.
alias ls="ls -la"

# Create the `fuck` alias to fix commands
eval $(thefuck --alias)

#######################################
# ZSH                                 #
#######################################

# bind up/down keys to searching history in the shell. (zsh-users/zsh-history-substring-search plugin)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
