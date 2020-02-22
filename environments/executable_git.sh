alias gs="git status"

branches () {
  git branch --sort=-committerdate  | cut -c2- | fzf --height 40% --reverse
}

export PATH=~/environments/git/extensions:$PATH