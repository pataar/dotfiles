#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Make ZSH the default shell environment

if test $(which zsh); then
  chsh -s $(which zsh)
fi

# Install Composer
if test $(which composer); then
  wget https://raw.githubusercontent.com/composer/getcomposer.org/master/web/installer -O - -q | php -- --quiet
fi

if test $(which upgrade_oh_my_zsh); then
 sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

cp ../zsh/.zshrc ~/.zshrc

source ~/.zshrc

xcode-select --install

if test $(which rbenv); then
  rbenv install 2.3.0
  rbenv global 2.3.0
fi

if test $(which npm); then
  npm install -g cordova ionic
  npm set registry https://gitlab.interactivestudios.nl:4873
fi
