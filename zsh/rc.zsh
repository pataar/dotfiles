source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

export PATH="$PATH:/opt/homebrew/bin/:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:~/.local/bin:/usr/sbin:/sbin:~/bin:~/.composer/vendor/bin"

source_if_exists "$HOME/.env.sh"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

eval "$(starship init zsh)"

export GIT_MERGE_AUTOEDIT=no
export DEFAULT_USER=$(whoami)

alias git_current_branch="git branch --show-current"
alias git_recent_branches="git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format='%(refname:short)'"

source_if_exists $DOTFILES/zsh/history.zsh
source_if_exists $DOTFILES/zsh/git.zsh
source_if_exists ~/.fzf.zsh
source_if_exists $DOTFILES/zsh/aliases.zsh
source_if_exists /usr/local/etc/profile.d/z.sh
source_if_exists /opt/homebrew/etc/profile.d/z.sh

HISTFILE=~/.pataar_zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
touch $HISTFILE

# increase file limits
ulimit -Sn 4096      # Increase open files.
ulimit -Sl unlimited # Increase max locked memory.

# User configuration
export PATH="$PATH:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:~/.local/bin:/usr/sbin:/sbin:~/bin:~/.composer/vendor/bin"
export TZ="Europe/Amsterdam"

# Handle Mac platforms
CPU=$(uname -p)
if [[ "$CPU" == "arm" ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
    export EDITOR=/opt/homebrew/bin/nano
    alias nano=/opt/homebrew/bin/nano
    alias oldbrew=/usr/local/bin/brew
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

source_if_exists ~/.fastlane_session

# Enable the use of '!'
unsetopt BANG_HIST


# We need to accept UTF 8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Auto start tmux when we're not in a tmux session
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    # tmux attach -t default || tmux new -s default
fi

source_if_exists $DOTFILES/zsh/lang.zsh

# bun completions
[ -s "/Users/pieter/.bun/_bun" ] && source "/Users/pieter/.bun/_bun"


if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

#override dev ip
DEV_IP=10.0.0.1
export PATH="/Users/p.willekens/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/Users/p.willekens/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/p.willekens/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
