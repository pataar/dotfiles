
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Init Znap
[[ -f ~/.zsh/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.zsh/zsh-snap

source ~/.zsh/zsh-snap/znap.zsh  # Start Znap

export DEFAULT_USER=$(whoami)

alias git_current_branch="git branch --show-current"
alias git_recent_branches="git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format='%(refname:short)'"

# Init theme
znap source romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

znap source ohmyzsh/ohmyzsh plugins/git # Git aliases
znap source ohmyzsh/ohmyzsh plugins/asdf
znap source ohmyzsh/ohmyzsh plugins/colorize # Syntax highlighting for catted files
#znap source ohmyzsh/ohmyzsh plugins/docker # Suggestion when command is not found
#znap source ohmyzsh/ohmyzsh plugins/docker-compose # Suggestion when command is not found
znap source zdharma/fast-syntax-highlighting # Syntax highlighting
znap source zsh-users/zsh-autosuggestions # Autosuggest commands on type
znap source diazod/git-prune # Git prune command (gprune)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
touch $HISTFILE

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/bin:~/.composer/vendor/bin"
export TZ="Europe/Amsterdam"

# source $ZSH/oh-my-zsh.sh
# Aliases
alias art="php artisan"
alias "c"="code"
alias "c."="c ."
alias ci="composer install"
alias cdu="composer du"
alias glmb="lab mr browse"
alias lmco="glab mr create -a "$(whoami)" --remove-source-branch --squash-before-merge --push -y -b"
alias gissue="glab issue view --web"
alias n="nano"
alias ni="npm install"
alias reloadcli="source $HOME/.zshrc"
alias weather="curl -4 http://wttr.in"
alias y="yarn"
alias yw="yarn watch"
alias yb="yarn build"
alias yh="yarn hot"
alias up="docker compose up -d --build"
alias down="docker compose down"
alias dcep="docker compose exec php"
alias dcp="docker compose pull"
alias dupd="dcp && up"
alias gencl="npx conventional-changelog-cli -p angular -i CHANGELOG.md -s"
alias gca="cz -a"
alias gc="cz"

# Glab aliases
alias mrlist="glab mr list --assignee=@me --reviewer=@me"
alias mrdiff="glab mr diff"
alias mrapprove="glab mr approve"
alias mrmerge="glab mr merge"

# Git aliases
alias last_commit_message="git show -s --format=%s"
alias refresh_remote_tags="git tag -d \$(git tag) && git fetch --tags"

# Preferred editor for local and remote sessions

export EDITOR='nano'

export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

export ANDROID_SDK_ROOT=~/Library/Android/sdk/
export PATH=${PATH}:/usr/local/sbin:~/Library/Android/sdk/platform-tools:~/Library/Android/sdk/platform-tools/tools:~/.composer/vendor/bin:~/Library/Android/sdk/tools
export PATH=$PATH:"/users/$DEFAULT_USER/.config/yarn/global/node_modules/.bin"
export PATH=/usr/local/bin:/usr/local/sbin:$PATH:/Users/$DEFAULT_USER/bin
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Custom keybindings
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

if [ -x "$(command -v rbenv)" ]; then
  eval "$(rbenv init -)"
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
ulimit -n 2048

# Volta stuff
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

[[ -f "~/.fastlane_session" ]] && source ~/.fastlane_session

# Rust stuff
[[ -f "$HOME/.cargo/env" ]] && . $HOME/.cargo/env

export JAVA_HOME="/usr/local/opt/openjdk@11"

# Dumb Java 11 fix
alias mkcert="unset JAVA_HOME && mkcert"

export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"

. /usr/local/opt/asdf/libexec/asdf.sh
