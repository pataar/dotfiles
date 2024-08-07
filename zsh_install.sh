#!/usr/bin/env bash

COLORED='\033[0;32m'
NC='\033[0m'

echo "${COLORED}Installing .zshrc stuff...${NC}"

if [[ "$(whoami)" == "pieter" ]]; then
  cp ./git/.gitconfig ~/
fi

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/bin:~/.composer/vendor/bin"

## Install mkcert and the root certificate
if command -v mkcert &> /dev/null
then
  echo "${COLORED}Installing mkcert stuff...${NC}"
  mkcert -install
fi


echo "\033[0;36m| Done installing. | "
