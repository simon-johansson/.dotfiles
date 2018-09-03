function github() {
  giturl=$(git config --get remote.origin.url)
  if [[ "$giturl" == "" ]]
    then
     echo "Not a git repository or no remote.origin.url set"
     exit 1;
  fi

  giturl=${giturl/git\@github\.com\:/https://github.com/}
  giturl=${giturl/\.git/}
  branch="$(git symbolic-ref HEAD 2>/dev/null)" ||
  branch="(unnamed branch)"     # detached HEAD
  branch=${branch##refs/heads/}
  giturl=$giturl/tree/$branch
  open $giturl
}

function dash() { open dash://"$1"; }

function take() {
  mkdir $1;
  cd $1;
}

function up() {
  LIMIT=$1
  P=$PWD
  for ((i=1; i <= LIMIT; i++))
  do
      P=$P/..
  done
  cd $P
}

function load() {
    regexp="$1"
    root="$PWD"
    if [ ! -z "$2" ]; then
        root="$2"
    fi
    if [ -e "$root" ]; then
        for f in $(find $root -print | grep "$regexp" | sort); do
            source "$f"
        done
    fi
}

function json() {
    python -m json.tool $1 | pygmentize -l javascript
}

# Copy the full absolute path into the clipboard, and also echo it.
function copy_path() {
    pwd | pbcopy
}

function tophistory() {
  history | awk '{a[$2]++ } END{for(i in a){print a[i] " " i}}' | sort -rn | head -n 30
}

# dlfrom user@example.com /tmp/files.tar ['.']
# rsync -v user@example.com:/tmp/files.tar .
function dlfrom() {
    ssh=$1
    remote_file=$2
    local_path='.'
    if [ ! -z "$3" ]; then
        local_path="$3"
    fi
    rsync -v $ssh:$remote_file $local_path
}

function extract() {
  echo Extracting $1 ...
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xjf $1  ;;
          *.tar.gz)    tar xzf $1  ;;
          *.bz2)       bunzip2 $1  ;;
          *.rar)       unrar x $1    ;;
          *.gz)        gunzip $1   ;;
          *.tar)       tar xf $1   ;;
          *.tbz2)      tar xjf $1  ;;
          *.tgz)       tar xzf $1  ;;
          *.zip)       unzip $1   ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1  ;;
          *)        echo "'$1' cannot be extracted via extract()" ;;
      esac
  else
      echo "'$1' is not a valid file"
  fi
}

function update_everything() {
  update_brew
  update_zsh
  update_node
  # update_ruby
}

function _updating_header() {
  echo "
*****************************
  $1 IS BEING UPDATED
*****************************\n"
}

function update_brew() {
  _updating_header 'HOMEBREW'
  brew update
  brew upgrade --all
  brew cleanup
  brew cask cleanup
}

function update_zsh() {
  _updating_header 'ZSH'
  source $ANTIGEN
  antigen update
}

function update_node() {
  _updating_header 'NODE'

  # Install and activate latest stable version of node
  n stable

  # Install/update important packages
  zsh $DOTFILES/installers/npm.sh
}

function update_ruby() {
  _updating_header 'RUBY'
  update_rubygems
  gem update --system
}
