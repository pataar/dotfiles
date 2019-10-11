#zmodload zsh/zprof
DISABLE_UPDATE_PROMPT=true
export DEFAULT_USER=$(whoami)
# Path to your oh-my-zsh installation.
export ZSH=/Users/$DEFAULT_USER/.oh-my-zsh

ZSH_THEME="taybalt-custom"

# Oh-my-zsh plugins
plugins=(git colorize gitfast)

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/bin:~/.composer/vendor/bin"

source $ZSH/oh-my-zsh.sh

# Aliases
alias art="php artisan"

alias c="code"
alias "c."="c ."

alias ci="composer install"
alias cdu="composer du"

alias lmb="lab mr browse"
alias lmco="lab mr create origin"

alias n="nano"
alias ni="npm install"
alias prune-branches="/usr/local/bin/git fetch --prune;/usr/local/bin/git branch --merged | grep \"/\" | grep -v \"*\" | xargs -n 1 /usr/local/bin/git branch -d"
alias reloadcli="source $HOME/.zshrc"

alias weather="curl -4 http://wttr.in"

alias y="yarn"
alias yw="yarn watch"
alias yb="yarn build"
alias yh="yarn hot"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='nano'
fi

export PATH="/usr/local/opt/php@7.2/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/sbin:$PATH"
export PATH=${PATH}:/usr/local/sbin:~/Library/Android/sdk/platform-tools:~/Library/Android/sdk/platform-tools/tools:~/.composer/vendor/bin

export PATH="/usr/local/opt/mariadb@10.1/bin:$PATH"
fpath=(/usr/local/share/zsh-completions $fpath)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH=$PATH:"/users/$DEFAULT_USER/.config/yarn/global/node_modules/.bin"
export PATH=/usr/local/bin:/usr/local/sbin:$PATH:/Users/$DEFAULT_USER/bin

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

eval "$(rbenv init -)"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
ulimit -n 2048

# Go development
export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"