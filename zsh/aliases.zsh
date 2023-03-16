# Aliases
alias art="php artisan"
alias "c"="code"
alias "c."="c ."
alias ci="composer install"
alias cdu="composer du"
alias glmb="lab mr browse"
alias lmco="glab mr create -a "$(whoami)" --remove-source-branch --squash-before-merge --push -y -b"
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

function prune-branches {
  git branch -vv | grep ': gone]' | grep -v '\*' | awk '{ print $1; }' | xargs -r git branch -D
}

function take {
  mkdir -p $1
  cd $1
}

alias s='source ~/.zshrc'
alias l='exa -alh'


if [[ $OSTYPE == 'darwin'* ]]; then
  alias rm=trash # Throw it in the bin instead of a hard delete
fi
