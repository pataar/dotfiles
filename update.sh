#!/bin/zsh

COLORED='\033[0;32m'
NC='\033[0m'

echo "\033[0;36m| dotfiles | @pataar"
echo "${COLORED}Updating the Mac of $(whoami)...${NC}"
echo "\n";

cd ~/.zsh-snap && git pull 2>/dev/null && cd -

source ~/.zshrc

git pull 2>/dev/null

echo "${COLORED}Updating znap stuff...${NC}"
znap status
znap pull

echo "${COLORED}Updating .zshrc stuff...${NC}"
cp ./git/.gitconfig ~/
cp ./zsh/.zshrc ~/
cp ./zsh/.p10k.zsh ~/

## Install NPM dependencies and the correct registry
if test $(which mkcert); then
  echo "${COLORED}Updating mkcert stuff...${NC}"
  mkcert -install 2>/dev/null
cp -r ./bin/ /usr/local/bin/
fi

echo "\033[0;36m| Done updating. | "
echo "\n";
