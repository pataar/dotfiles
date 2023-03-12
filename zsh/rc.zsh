
source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}
source_if_exists $HOME/.env.sh

# Init everything

zstyle ':znap:*' repos-dir "$DOTFILES/zsh/zsh-snap-repos"

# Init Znap
source_if_exists $DOTFILES/zsh/zsh-snap/znap.zsh  # Start Znap

export GIT_MERGE_AUTOEDIT=no
export DEFAULT_USER=$(whoami)

alias git_current_branch="git branch --show-current"
alias git_recent_branches="git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format='%(refname:short)'"

# Init theme
# znap source romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

znap source ohmyzsh/ohmyzsh plugins/git # Git aliases
#znap source ohmyzsh/ohmyzsh plugins/asdf
znap source agkozak/zsh-z
znap source ohmyzsh/ohmyzsh plugins/colorize # Syntax highlighting for catted files
#znap source ohmyzsh/ohmyzsh plugins/docker # Suggestion when command is not found
#znap source ohmyzsh/ohmyzsh plugins/docker-compose # Suggestion when command is not found
znap source zdharma/fast-syntax-highlighting # Syntax highlighting
znap source zsh-users/zsh-autosuggestions # Autosuggest commands on type
znap source diazod/git-prune # Git prune command (gprune)


source_if_exists $DOTFILES/zsh/history.zsh
source_if_exists $DOTFILES/zsh/git.zsh
source_if_exists ~/.fzf.zsh
source_if_exists $DOTFILES/zsh/aliases.zsh
source_if_exists /usr/local/etc/profile.d/z.sh
source_if_exists /opt/homebrew/etc/profile.d/z.sh

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
touch $HISTFILE

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:~/.local/bin:/usr/sbin:/sbin:~/bin:~/.composer/vendor/bin"
export TZ="Europe/Amsterdam"


# Preferred editor for local and remote sessions

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


preexec() { print -Pn "\e]0;$1\a" } # Show the command in the terminal title bar

export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1
export PHP_CS_FIXER_IGNORE_ENV=1
export HOMEBREW_NO_ANALYTICS=1

export ANDROID_SDK_ROOT=~/Library/Android/sdk/
export PATH=${PATH}:/usr/local/sbin:~/Library/Android/sdk/platform-tools:~/Library/Android/sdk/platform-tools/tools:~/.composer/vendor/bin:~/Library/Android/sdk/tools:~/.bin
export PATH=$PATH:"/users/$DEFAULT_USER/.config/yarn/global/node_modules/.bin:/$HOME/.local/bin"
export PATH=/usr/local/bin:/usr/local/sbin:$PATH:/Users/$DEFAULT_USER/bin
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# autoload -U zmv
# autoload -U promptinit && promptinit
# autoload -U colors && colors
# autoload -Uz compinit && compinit

# Custom keybindings
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

[[ -f "~/.fastlane_session" ]] && source ~/.fastlane_session

# Enable the use of '!'
unsetopt BANG_HIST

eval "$(oh-my-posh init zsh --config $DOTFILES/oh-my-posh/config.json)"
source_if_exists $DOTFILES/zsh/lang.zsh

# We need to accept UTF 8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Auto start tmux when we're not in a tmux session
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi


# bun completions
[ -s "/Users/pieter/.bun/_bun" ] && source "/Users/pieter/.bun/_bun"
