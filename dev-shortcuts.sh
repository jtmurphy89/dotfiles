alias f="find . -iname"
alias ll="ls -l"
alias ups="ps aux | grep $USER | grep -Ev '/(Library|System|Applications)'"

alias r="bundle exec rake"
alias bx="bundle exec"
alias bc="bundle console"

alias review="git diff --color=always --word-diff=color --inter-hunk-context=50"

function g {
  right_x="$HOME/gitdir/right_$1"
  normal_x="$HOME/gitdir/$1"
  

  if [ -d $right_x ]; then
    cd $right_x
  elif [ -d $normal_x ]; then
    cd $normal_x
    else
    echo "Error: can't find $right_x, $normal_x"
  fi
}

# see https://github.com/rightscale/right_site/tree/master/spec/spec_helper.rb

