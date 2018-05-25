#zmodload zsh/zprof
DISABLE_UPDATE_PROMPT=true
# Path to your oh-my-zsh installation.
export ZSH=/Users/pieter/.oh-my-zsh

ZSH_THEME="taybalt-custom"


# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/bin:~/.composer/vendor/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

alias art="php artisan"
alias reloadcli="source $HOME/.zshrc"
alias weather="curl -4 http://wttr.in"
alias prune-branches="/usr/local/bin/git fetch --prune;/usr/local/bin/git branch --merged | grep \"/\" | grep -v \"*\" | xargs -n 1 /usr/local/bin/git branch -d"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
fi

alias alias-help="echo \"restart-services ssh-gitlab brew-upgrade proj-install proj-outdated\""
alias restart-services="brew services restart mysql && sudo brew services restart httpd24"
alias ssh-gitlab="ssh root@gitlab.interactivestudios.nl"
alias brew-upgrade="brew update && brew upgrade"
alias proj-install="npm install && composer install"
alias pull-screenshots="adb pull /sdcard/Pictures/Screenshots/ ~/Desktop/Android_Screenshots/"
alias proj-outdated="npm outdated && npm outdated -g && composer outdated"

#export PATH="$(brew --prefix php@7.0)/bin:$PATH"

export PATH="/usr/local/opt/php@7.0/bin:$PATH"
export PATH="/usr/local/opt/php@7.0/sbin:$PATH"
export PATH=${PATH}:/usr/local/sbin:/devtools/android-sdk-macosx/platform-tools:/devtools/android-sdk-macosx/tools:~/.composer/vendor/bin

fpath=(/usr/local/share/zsh-completions $fpath)
export DEFAULT_USER="pieter"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH=$PATH:"/users/pieter/.config/yarn/global/node_modules/.bin"
export PATH=/usr/local/bin:/usr/local/sbin:$PATH:/Users/pieter/bin
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

eval "$(rbenv init -)"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
ulimit -n 2048