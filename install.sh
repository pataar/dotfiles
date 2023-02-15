#!/usr/bin/env bash

COLORED='\033[0;32m'
NC='\033[0m'

echo "\n";
echo "\033[0;36m| Dev install script by Pataar | "
echo "\033[0;36m| Running on $(whoami)@$(hostname) | "
echo "\n";


if [ "$(uname)" == "Darwin" ]; then
  echo "${COLORED}Setting up the Mac for $(whoami)...${NC}"

  # Check for Homebrew and install if we don't have it
  if test ! $(which brew); then
    echo "${COLORED}Installing brew...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # Handle Mac platforms
  CPU=$(uname -p)
  if [[ "$CPU" == "arm" ]]; then
      export PATH="/opt/homebrew/bin:$PATH"
      export EDITOR=/opt/homebrew/bin/nano
      alias nano=/opt/homebrew/bin/nano
      alias oldbrew=/usr/local/bin/brew
  else
      export PATH="/usr/local/bin:$PATH"
      export EDITOR=/usr/local/bin/nano
      alias nano=/usr/local/bin/nano
  fi

  # Update Homebrew recipes
  brew update

  brew install zsh

  # Install all our dependencies with bundle (See Brewfile)
  brew tap homebrew/bundle
  echo "${COLORED}Updating brew bundle...${NC}"
  brew bundle --file=./brew/Brewfile

  xcode-select --install

fi

# Make ZSH the default shell environment
if test $(which zsh); then
  echo "${COLORED}Changing shell to zsh...${NC}"
  chsh -s $(which zsh)
fi

zsh ./zsh_install.sh
source ./bootstrap.sh