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

# Install Composer
if test ! $(which composer); then
  echo "${COLORED}Installing composer...${NC}"
  wget https://raw.githubusercontent.com/composer/getcomposer.org/master/web/installer -O - -q | php -- --quiet
  mv ./composer.phar /usr/local/bin/composer
fi

if test ! $(which upgrade_oh_my_zsh); then
  echo "${COLORED}Installing oh_my_zsh...${NC}"
 sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

echo "${COLORED}Installing .zshrc stuff...${NC}"
cp ./git/.gitconfig ~/
cp ./zsh/.zshrc ~/
cp ./zsh/taybalt-custom.zsh-theme ~/.oh-my-zsh/themes/taybalt-custom.zsh-theme
cp -r ./bin/ /usr/local/bin/

source ~/.zshrc

open ./iterm/monokai-remastered.itermcolors

xcode-select --install

## Install the correct ruby version using rbenv
if test $(which rbenv); then
echo "${COLORED}Installing Ruby...${NC}"
  rbenv install 2.3.0
  rbenv global 2.3.0
fi

## Install code extensions
if test $(which code); then
  echo "${COLORED}Installing vscode extensions...${NC}"
  sh ./vscode/vscode-extensions.sh
fi

## Install NPM dependencies and the correct registry
if test $(which npm); then
  echo "${COLORED}Installing npm stuff...${NC}"
  npm install -g cordova ionic
  npm set registry https://gitlab.interactivestudios.nl:4873
fi

if test $(which pecl); then
  pecl install xdebug
  pecl install imagick
  pecl install redis
fi

echo "\033[0;36m| Done installing. | "
