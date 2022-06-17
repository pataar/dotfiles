#!/usr/bin/env bash

COLORED='\033[0;32m'
NC='\033[0m'

echo "${COLORED}Installing .zshrc stuff...${NC}"

if [[ "$(whoami)" == "pieter" ]]; then
  cp ./git/.gitconfig ~/
fi

cp ./zsh/.zshrc ~/
cp ./zsh/.p10k.zsh ~/

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/bin:~/.composer/vendor/bin"

## Install mkcert and the root certificate
if test $(which mkcert); then
  echo "${COLORED}Installing mkcert stuff...${NC}"
  mkcert -install
fi

## Install NPM dependencies and the correct registry
if test $(which volta); then
  echo "${COLORED}Installing volta stuff...${NC}"
  volta install node@lts yarn
fi

echo "\033[0;36m| Done installing. | "

