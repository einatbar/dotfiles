cdnvm(){
  cd $1
  if [[ -f .nvmrc && -s .nvmrc && -r .nvmrc ]]; then
    <.nvmrc nvm install;
  elif [[ $(nvm current) != $(nvm version default) ]]; then
    nvm use default;
  fi
}
alias cd='cdnvm'