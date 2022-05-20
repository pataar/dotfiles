#!/bin/zsh

COLORED='\033[0;32m'
NC='\033[0m'

echo "\033[0;36m| dotfiles | @pataar"
echo "${COLORED}Updating the dev env of $(whoami)@$(hostname)...${NC}"

echo "${COLORED}Updating current repo...${NC}"
git pull 2>/dev/null

echo "${COLORED}Updating .zshrc stuff...${NC}"
cp ./zsh/.zshrc ~/
cp ./zsh/.p10k.zsh ~/

echo "${COLORED}Updating .zsh-snap repo...${NC}"
cd ~/.zsh/zsh-snap && git pull 2>/dev/null && cd -

source ~/.zshrc

echo "${COLORED}Updating znap stuff...${NC}"
znap status
znap pull

## Update the mkcert root certificate
if [ -x "$(command -v mkcert)" ]; then
  echo "${COLORED}Updating mkcert stuff...${NC}"
  mkcert -install 2>/dev/null
  cp -r ./bin/ /usr/local/bin/
fi

echo "${COLORED}Reapply .zshrc...${NC}"
source ~/.zshrc

echo "\033[0;36m| Done updating. | "
