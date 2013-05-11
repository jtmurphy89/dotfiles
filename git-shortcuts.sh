alias gco="git checkout"
alias ga="git add"
alias gl="git log --topo-order"
alias glp="git log --topo-order --pretty=oneline --graph --decorate"
alias gsw="git show --color"
alias gd="git diff"
alias gdc="git diff --cached"
alias gb="git branch"
alias gcp="git cherry-pick"
alias gr="git rebase"
alias gss="git status"
alias gpl="git pull --ff-only"
alias gf="git fetch"
alias gsmu="git submodule update --init --recursive"
alias gpom="git push origin master"
alias gdf="git difftool -y -g"

alias co="echo Use 'gco', you ninny!"

alias slist="git stash list"
alias spush="git stash save"
alias spop="git stash pop"
alias sapply="git stash apply"

alias fetch="git fetch"
alias merge="git merge --no-ff --no-commit"

# Push the working branch to master. 
function push {
  if [ -z $1 ]; then
    local h="$(git symbolic-ref HEAD 2>/dev/null)"
    local b=${h##refs/heads/}
  else
    local b=$1
  fi

  #read -p "Push $b to origin/$b? [y/N] " assent

  #if [ "$assent" == "y" ]; then
    git push origin $b
  #fi
}

# With no arguments, pull from origin.
#
# With two arguments where the first is "into," open a browser to create a GitHub
# pull request into the branch named in the second argument.
#
# Example:
#   pull into master
function pull {
  if [ "$1" == "into" ]; then
    local repo=`basename $PWD`
    local h="$(git symbolic-ref HEAD 2>/dev/null)"
    local source=${h##refs/heads/}
    local dest=$2
    local url="https://github.com/rightscale/$repo/pull/new/rightscale:${dest}...rightscale:$source"
    open $url
  elif [ -n "$1" ]; then
    git pull --ff-only
  else
    echo "Don't know how to $1"
    return 1
  fi
}

# Track a remote branch of the same name, at the given remote.
#
# Example:
#  track master
function track {
  local h="$(git symbolic-ref HEAD 2>/dev/null)"
  local b=${h##refs/heads/}

  if [ -z $1 ]; then
    local remote=origin
  else
    local remote=$1
  fi 

  git branch $b --set-upstream-to=$remote/$b
}

