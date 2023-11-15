# Aliases
alias "c"="code"
alias "c."="c ."
alias y="yarn"
alias up="docker compose up -d --build"
alias down="docker compose down"
alias gg="lazygit"
alias trim="awk '{\$1=\$1;print}'"
alias x="exit"
alias nv="nvim ." # Open neovim in current directory

alias ta='tmux attach -t'
alias docker-compose="docker compose"

# Glab aliases
alias mrlist="glab mr list --assignee=@me --reviewer=@me"
alias mrdiff="glab mr diff"
alias mrapprove="glab mr approve"
alias mrmerge="glab mr merge"

# Git aliases
alias last_commit_message="git show -s --format=%s"
alias refresh_local_tags="git tag -d \$(git tag) && git fetch --tags"

if [ -x "$(command -v kitty)" ]; then
  alias ssh="kitty +kitten ssh"
fi

# Branch pruner
function prune-branches {
  branches_to_delete=$(enquirer multi-select $(git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)') --message "Branch to delete")

  if [ -n "$branches_to_delete" ]; then
    git branch -D
    git remote prune origin
    git maintenance run
  fi
}

# Branch creator
function b+ {
  branch_name=${1:-$(enquirer input --message "Branch name")}
  if [ -n "$branch_name" ]; then
    git checkout -b "$branch_name"
  fi
}

# Branch switcher
function b {
  git checkout $(enquirer select $(git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)') --message "Branch to checkout")
  git pull
}

# Code review
function cr {
  glab mr checkout $1
  git pull
  task setup frontend:build open
}

# MR creator
function mr() {

  YELLOW='\e[0;33m'
  CYAN='\e[0;36m'
  RESET='\e[0m' # Reset color
  echo -e ""
  echo -e "${YELLOW}mr utility by ${CYAN}pataar${RESET}"

  title=$(enquirer input -m "Title" -d "$(last_commit_message)" | trim)
  default_description=$(echo $title | grep -o '#[0-9]*')
  description=$(enquirer input -m "Description" -d ${default_description:-"Zie titel"} | trim)
  description_replaced=$(cat $DOTFILES/zsh/templates/gitlab_mr | sed "s/TBD/${description}/g")
  reviewers=$(enquirer multi-select barend darryll jeroens musa nihat remco sander mondo --message "Reviewers" | tr '\n' ',')

  if [ -n "$title" ] && [ -n "$description" ] && [ -n "$reviewers" ]; then
    glab mr create --title $title --description $description_replaced --push -a "$(whoami)" --remove-source-branch --squash-before-merge --reviewer ${reviewers%,} $@
  else
    echo "Error: Missing required variables"
  fi
}

function mari {
  title=$(echo "MAR: $(enquirer input -m "Title" | trim)")
  description_file="$(mktemp -t description tmp.XXXXXXXXX).md"
  description=""
  cat <<EOF >"$description_file"
$description


/label ~"App rewrite" 
/epic health/patientjourneyapp&2 
EOF

  nvim "$description_file" +startinsert

  # Read the content of the temporary file into the variable
  description=$(cat "$description_file")

  # Cleanup: Remove the temporary file
  rm "$description_file"
  echo $description
  glab issue create --title $title --description $description
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
