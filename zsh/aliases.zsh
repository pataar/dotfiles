# Aliases
alias art="php artisan"
alias "c"="code"
alias "c."="c ."
alias ci="composer install"
alias cdu="composer du"
alias glmb="lab mr browse"
# alias lmco="glab mr create -a "$(whoami)" --remove-source-branch --squash-before-merge --push -y -b" replaced by glmr
alias gissue="glab issue view --web"
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
alias gg="lazygit"
alias b="git checkout -b"
alias trim="awk '{\$1=\$1;print}'"
alias x="exit"
alias lv="lvim ." # Open lunarvim in current directory

alias ta='tmux attach -t'
alias docker-compose="docker compose"

# Glab aliases
alias mrlist="glab mr list --assignee=@me --reviewer=@me"
alias mrdiff="glab mr diff"
alias mrapprove="glab mr approve"
alias mrmerge="glab mr merge"

# Git aliases
alias last_commit_message="git show -s --format=%s"
alias refresh_remote_tags="git tag -d \$(git tag) && git fetch --tags"

if [ -x "$(command -v kitty)" ]; then
alias ssh="kitty +kitten ssh"
fi;

function prune-branches {
  git branch -vv | grep ': gone]' | grep -v '\*' | awk '{ print $1; }' | xargs -r git branch -D
}

function glmr(){ glab mr create -a "$(whoami)" --title "$(last_commit_message)" --remove-source-branch --squash-before-merge --push -y --draft --fill -b $1 }

function take {
  mkdir -p $1
  cd $1
}

# https://chan.dev/p/
function p {
  if [[ -f bun.lockb ]]; then
    command bun "$@"
  elif [[ -f pnpm-lock.yaml ]]; then
    command pnpm "$@"
  elif [[ -f yarn.lock ]]; then
    command yarn "$@"
  elif [[ -f package-lock.json ]]; then
    command npm "$@"
  else
    command pnpm "$@"
  fi
}

alias s='source ~/.zshrc'
alias l='eza -alh'

# Alias for tar with gzip and progress, using folder name as default archive name
function tgz() { tar -czvf "${1:-$(basename "$PWD")}.tar.gz" "$1"; }
function utgz() { tar -xzvf "$1"; }

zstyle ':completion:*:tgz:*' file-sort size
# Custom completion function for utgz alias
zstyle ':completion:*:utgz:*' file-patterns '*.tar.gz *(.)'

if [[ $OSTYPE == 'darwin'* ]]; then
  alias trm=trash # Throw it in the bin instead of a hard delete
  alias sed=gsed
  alias isleep="pmset sleepnow"
fi
