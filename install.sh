#!/bin/zsh

USAGE="$(basename "$0") [-b --brew] [-z --zsh] [-n --npm] [-s --symlinks] [-a --all] • [-o --osx] [-m --mackup] [-h --help]

OPTIONS
        -b, --brew
            Install Homebrew & Casks + formulas

        -z, --zsh
            Install ZSH plugins

        -n, --npm
            Install global npm modules

        -s, --symlinks
            Create symlinks to ~/ for files in symlinks/ folder

        -a, --all
            Do all of the above

        -------------------------------------------------------

        -o, --osx
            Set OSX settings (screenshots folder, keyboard repeat rate, etc.)

        -m, --mackup
            Restore application settings from Dropbox

        -h, --help
            Print this message\n\n"

if [[ -z $1 ]]; then
  printf "$USAGE"
  exit 0
fi
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

INSTALL_ZSH_PLUGINS=false
INSTALL_BREW=false
INSTALL_NPM=false
OSX_CONFIG=false
CREATE_SYMLINKS=false
RESTORE_BACKUP=false

if ! OPTIONS=$(getopt -o hgcmpvtzaeb -l help,zsh,brew,npm,symlinks,mackup,all -- "$@")
then
  # something went wrong, getopt will put out an error message for us
  exit 1
fi
while [ $# -gt 0 ]; do
  case $1 in
    "-z" | "--zsh")      INSTALL_ZSH_PLUGINS=true ;;
    "-b" | "--brew")     INSTALL_BREW=true ;;
    "-n" | "--npm")      INSTALL_NPM=true ;;
    "-s" | "--symlinks") CREATE_SYMLINKS=true ;;
    "-a" | "--all")
      INSTALL_ZSH_PLUGINS=true
      INSTALL_BREW=true
      INSTALL_NPM=true
      CREATE_SYMLINKS=true
      break ;;
    "-o" | "--osx")      OSX_CONFIG=true ;;
    "-m" | "--mackup")   RESTORE_BACKUP=true ;;
    "-h" | "--help")     printf "$USAGE"; exit 0 ;;
    (--) shift; break;;
    (-*) echo "$0: error - unrecognized option $1" 1>&2; exit 1;;
    (*) break;;
  esac
  shift
done

if $INSTALL_BREW; then
    echo "
##################################
Brew formulas are being installed
##################################"
  sh "$DIR/installers/brew.sh"
fi

if $INSTALL_ZSH_PLUGINS; then
  echo "
################################
ZSH plugins are being installed
################################"
  sh "$DIR/installers/zsh.sh"
fi

if $INSTALL_NPM; then
  echo "
################################
npm modules are being installed
################################"
  sh "$DIR/installers/npm.sh"
fi

if $CREATE_SYMLINKS; then
  echo "
############################
Symlinks are being created
############################"
  if type "rcup" > /dev/null; then
    rcup -d symlinks -v
  else
    echo "Failed: 'rcm', which is used to create symlinks, was not found."
  fi
fi

if $OSX_CONFIG; then
  zsh <(curl -s 'https://gist.githubusercontent.com/simon-johansson/3037503f37e45c83a738/raw/f4c4e0ee565ff290c60fdaaa38ffdb97db42ec72/osx-for-hackers.sh')
fi

if $RESTORE_BACKUP; then
  echo "
#######################################
Restoring settings from Dropbox backup
#######################################\n"
  msg="Before restoring, make sure that:
    * You have installed Dropbox and synced your account
    * You have a .mackup.cfg in you home directory specifying what to backup/restore
    * You are fine with overwriting your current application settings
  "
  echo $msg
  vared -p 'Do you want to proceed? (y/N): ' -c choice
  if [[ $choice == y || $choice == Y ]]; then
    if type "mackup" > /dev/null; then
      mackup restore
    else
      echo "
    Failed: 'mackup', which is used to restore backups, was not found."
    fi
  fi
fi
