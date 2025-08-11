# Aliases
alias "c"="code"
alias "c."="c ."
alias "z."="zed ."  # Open zed in current directory
alias "n."="nvim ." # Open neovim in current directory

alias y="yarn"
alias up="docker compose up -d --build"
alias down="docker compose down"
alias gg="lazygit"
alias trim="awk '{\$1=\$1;print}'"
alias x="exit"

alias ta='tmux attach -t'
alias docker-compose="docker compose"

# Glab aliases
alias mrlist="glab mr list --assignee=@me --reviewer=@me"
alias mrdiff="glab mr diff"
alias mrapprove="glab mr approve"
alias mrmerge="glab mr merge"

alias a="task exec -- php artisan "

# Git aliases
alias last_commit_message="git show -s --format=%s"
alias refresh_local_tags="git tag -d \$(git tag) && git fetch --tags"

# Branch pruner
function bxx {
  branches_to_delete=$(gum choose $(git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)') --header "Branch to delete")

  if [ -n "$branches_to_delete" ]; then
    git branch -D $(echo $branches_to_delete)
    git remote prune origin 2>/dev/null
    git maintenance run 2>/dev/null
  fi
}

# Branch pruner
function brew_leaves_prune {
  things_to_delete=$(gum filter --no-limit $(brew leaves) --header "Packages to delete")

  if [ -n "$things_to_delete" ]; then
    brew remove $(echo $things_to_delete)
    brew cleanup
  fi
}

# Branch creator
function b+ {
  branch_name=${1:-$(gum input --placeholder "Branch name")}
  if [ -n "$branch_name" ]; then
    git checkout -b "$branch_name"
  fi
}

# Branch switcher
function b {
  branch_name=${1:-$(gum filter $(git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)') --header "Branch to checkout")}
  if [ -n "$branch_name" ]; then
    echo "Switching to branch: '$branch_name'"
    git checkout $branch_name
    git pull 2>/dev/null
  fi
}

# Code review
function cr {
  glab mr checkout $1
  git pull
  if [ -f Taskfile.yml ]; then
    task setup open
  fi
}
# Reset To Remote
function nah {
  gum confirm "Are you sure you want to reset your changes? This removes all local (committed) changes." && git reset --hard HEAD && git clean -fd
}

function gmm() {
  git fetch origin $1:$1 &&
    git merge $1
}

# MR creator
function mr() {
  YELLOW='\e[0;33m'
  CYAN='\e[0;36m'
  RESET='\e[0m' # Reset color
  echo -e ""
  echo -e "${YELLOW}mr utility by ${CYAN}pataar${RESET}"

  title=$(gum input --header "Title" --value "$(last_commit_message)" | trim)
  default_description="$(echo $title | grep -o '#[0-9]*')"
  default_description="${default_description:+$default_description+}"
  description=$(gum input --header "Description" --value ${default_description:-"Zie titel"} | trim)
  description_replaced=$(cat $DOTFILES/zsh/templates/gitlab_mr | sed "s/TBD/${description}/g")
  reviewers=$(gum filter --no-limit $(glab api 'projects/:fullpath/members?per_page=100' | jq -r '.[]  | select(.access_level >= 30 and (.username | startswith("project_") | not)) | .username' | sort) --header "Reviewers" | tr '\n' ',')

  if [ -n "$title" ] && [ -n "$description" ] && [ -n "$reviewers" ]; then
    glab mr create --title $title --description $description_replaced --push -a $(glab api 'user' | jq -r .username) --remove-source-branch --squash-before-merge --reviewer ${reviewers%,} $@
  else
    echo "Error: Missing required variables"
  fi
}
# MR creator
function release-branch() {

  version=$(cat version)

  if [ -n "$version" ]; then
    title="chore(release): $version"
    assignees=$(gum filter --no-limit $(glab api 'projects/:fullpath/members?per_page=100' | jq -r '.[]  | select(.access_level >= 30 and (.username | startswith("project_") | not)) | .username' | sort) --header "Assignees" | tr '\n' ',')
      glab mr create -b master --title $title --push -a ${assignees%,} --reviewer $reviewers $@
  else
    echo "Error: Missing version file"
  fi
}

function take {
  mkdir -p $1
  cd $1
}

alias s='source ~/.zshrc'
alias l='eza -alh'

# Alias for tar with gzip and progress, using folder name as default archive name
function tgz() { tar -czvf "${1:-$(basename "$PWD")}.tar.gz" "$1"; }
function utgz() { tar -xzvf "$1"; }

zstyle ':completion:*:tgz:*' file-sort size
# # Custom completion function for utgz alias
zstyle ':completion:*:utgz:*' file-patterns '*.tar.gz *(.)'

if [[ $OSTYPE == 'darwin'* ]]; then
  alias trm=trash # Throw it in the bin instead of a hard delete
  alias sed=gsed
  alias grep=ggrep
  alias isleep="pmset sleepnow"
fi

alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'

alias ssh='TERM=xterm-256color ssh'
