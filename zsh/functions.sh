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
