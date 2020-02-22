#!/bin/sh
hash brew 2>/dev/null || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

hash chezmoi 2>/dev/null || brew install twpayne/taps/chezmoi

chezmoi init --apply https://github.com/OriR/dotfiles.git

zsh -i -c "source ~/.zshrc && source $(chezmoi source-path)/post-setup.osx.sh"

echo "🌈All Done🌈"
echo "Welcome to your new home 🏡"