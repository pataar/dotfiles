#!/bin/sh
# Orginally by driesvints. Edited by Pataar

COLORED='\033[0;32m'
NC='\033[0m'

echo "\n";
echo "\033[0;36m| Mac dev install script by Pataar | "
echo "\n";

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

# Make ZSH the default shell environment

if test $(which zsh); then
  echo "${COLORED}Changing shell to zsh...${NC}"
  chsh -s $(which zsh)
fi

git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/.zsh-snap
source zsh-snap/install.zsh

echo "${COLORED}Installing .zshrc stuff...${NC}"
cp ./git/.gitconfig ~/
cp ./zsh/.zshrc ~/
cp ./zsh/.p10k.zsh ~/
cp -r ./bin/ /usr/local/bin/

source ~/.zshrc

open ./iterm/monokai-remastered.itermcolors

xcode-select --install

## Install the correct ruby version using rbenv
if test $(which rbenv); then
echo "${COLORED}Installing Ruby...${NC}"
  rbenv install 2.6.1
  rbenv global 2.6.1
fi

## Install NPM dependencies and the correct registry
if test $(which mkcert); then
  echo "${COLORED}Installing mkcert stuff...${NC}"
  mkcert -install
fi

echo "\033[0;36m| Done installing. | "
