#!/bin/zsh

COLORED='\033[0;32m'
NC='\033[0m'

echo "\033[0;36m| dotfiles | @pataar"
echo "${COLORED}Updating the dev env of $(whoami)@$(hostname)...${NC}"

bash ./bootstrap.sh


## Update the mkcert root certificate
if [ -x "$(command -v mkcert)" ]; then
  echo "${COLORED}Updating mkcert stuff...${NC}"
  mkcert -install 2>/dev/null
  rsync -a ./bin/ ~/.local/bin/
fi

echo "${COLORED}Reapply .zshrc...${NC}"
source ~/.zshrc

echo "\033[0;36m| Done updating. | "
