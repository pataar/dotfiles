#!/bin/bash
# Orginally by driesvints. Edited by Pataar

COLORED='\033[0;32m'
NC='\033[0m'

echo "\n";
echo "\033[0;36m| Dev install script by Pataar | "
echo "\033[0;36m| Running on $(whoami)@${hostname} | "
echo "\n";


if [ "$(uname)" == "Darwin" ]; then
  echo "${COLORED}Setting up the Mac for $(whoami)...${NC}"

  # Check for Homebrew and install if we don't have it
  if test ! $(which brew); then
    echo "${COLORED}Installing brew...${NC}"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  # Update Homebrew recipes
  brew update

  # Install all our dependencies with bundle (See Brewfile)
  brew tap homebrew/bundle
  echo "${COLORED}Updating brew bundle...${NC}"
  brew bundle --file=./macos/Brewfile

  cp -r ./bin/ /usr/local/bin/

  open ./iterm/monokai-remastered.itermcolors

  xcode-select --install

fi

# Make ZSH the default shell environment
if test $(which zsh); then
  echo "${COLORED}Changing shell to zsh...${NC}"
  chsh -s $(which zsh)
fi

echo "${COLORED}Installing .zshrc stuff...${NC}"

if [ "$(whoami)" == "pieter" ] ||  [ "$(whoami)" == "pataar" ]; then
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
