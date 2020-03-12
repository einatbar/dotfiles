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

# Adding navi as a custom keybinding instead of running the command, default keybinding is Ctrl+g
source "$(navi widget zsh)"

# Since navi doesn't support well-known configuration folders and only allows to have custom that override all builtin cheats.
# This line adds the builtin cheats AND a custom cheats folder found in ~/cheats
export NAVI_PATH="$(navi home)/../libexec/cheats:$HOME/cheats"
