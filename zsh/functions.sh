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

function dash { open dash://"$1"; }

function take {
  mkdir $1;
  cd $1;
}

function remove_firefox_certs {
  # For linux
  # ROOT_PATH="~/.mozilla/firefox/"
  # For mac
  ROOT_PATH="~/Library/Application Support/Firefox/Profiles"
  echo $PATH_TO_CERT
  if [ -f $ROOT_PATH/*.default/cert8.db ]; then
      rm $ROOT_PATH/*.default/cert8.db
      echo "Certificates have been removed"
    else
      echo "No certificate found"
  fi
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

load() {
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

json () {
    python -m json.tool $1 | pygmentize -l javascript
}

# Copy the full absolute path into the clipboard, and also echo it.
copy-path () {
    pwd | pbcopy
}

tophistory() {
  history | awk '{a[$2]++ } END{for(i in a){print a[i] " " i}}' | sort -rn | head -n 30
}

# dlfrom user@example.com /tmp/files.tar ['.']
# rsync -v user@example.com:/tmp/files.tar .
dlfrom () {
    ssh=$1
    remote_file=$2
    local_path='.'
    if [ ! -z "$3" ]; then
        local_path="$3"
    fi
    rsync -v $ssh:$remote_file $local_path
}

function extract {
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

# display a neatly formatted path
path() {
  echo $PATH | tr ":" "\n" | \
    awk "{ sub(\"/usr\",   \"$fg_no_bold[green]/usr$reset_color\"); \
           sub(\"/bin\",   \"$fg_no_bold[blue]/bin$reset_color\"); \
           sub(\"/opt\",   \"$fg_no_bold[cyan]/opt$reset_color\"); \
           sub(\"/sbin\",  \"$fg_no_bold[magenta]/sbin$reset_color\"); \
           sub(\"/local\", \"$fg_no_bold[yellow]/local$reset_color\"); \
           print }"
}

cat() {
  local out colored
  out=$(/bin/cat $@)
  colored=$(echo $out | pygmentize -f console -g 2>/dev/null)
  [[ -n $colored ]] && echo "$colored" || echo "$out"
}

# Skriv ut så att man ser vad som installeras/uppdateras
update_everything() {
  update_brew
  update_zsh
  update_node
  # update_ruby
}

_updating_header() {
  echo "
*****************************
  $1 IS BEING UPDATED
*****************************\n"
}

update_brew() {
  _updating_header 'HOMEBREW'
  brew update
  brew upgrade --all
  brew cleanup
  brew cask cleanup
}

update_zsh() {
  _updating_header 'ZSH'
  antigen selfupdate
  antigen update
}

update_node() {
  _updating_header 'NODE'
  # Node
  npm cache clean -f
  npm install -g n
  n stable

  # npm
  # npm update -g
}

update_ruby() {
  _updating_header 'RUBY'
  update_rubygems
  gem update --system
}
