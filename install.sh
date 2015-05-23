#!/bin/bash

# if [[ $UID != 0 ]]; then
#     echo "Please run this script with sudo:"
#     echo "sudo $0 $*"
#     exit 1
# fi

USAGE="$(basename "$0") [-h --help] [-b --brew] [-v --vim] [-z --zsh] [-n --npm] [-s --symlinks] [-a --all]

OPTIONS
        -h, --help
            Print this message

        -b, --brew
            Install Homebrew & Casks + formulas

        -v, --vim
            Install VIM plugins & syntax

        -z, --zsh
            Install ZSH plugins

        -n, --npm
            Install global npm modules

        -s, --symlinks
            Create symlinks to ~/ for files in symlinks/ folder

        -a, --all
            Do all of the above\n"
if [[ -z $1 ]]; then
  printf "$USAGE"
  exit 0
fi
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

INSTALL_VIM=false
INSTALL_ZSH_PLUGINS=false
INSTALL_BREW=false
INSTALL_NPM=false
CREATE_SYMLINKS=false

if ! OPTIONS=$(getopt -o hgcmpvtzaeb -l help,vim,zsh,brew,npm,symlinks,all -- "$@")
then
  # something went wrong, getopt will put out an error message for us
  exit 1
fi
while [ $# -gt 0 ]; do
  case $1 in
    "-h" | "--help")     printf "$USAGE"; exit 0 ;;
    "-v" | "--vim")      INSTALL_VIM=true ;;
    "-z" | "--zsh")      INSTALL_ZSH_PLUGINS=true ;;
    "-b" | "--brew")     INSTALL_BREW=true ;;
    "-n" | "--npm")      INSTALL_NPM=true ;;
    "-s" | "--symlinks") CREATE_SYMLINKS=true ;;
    "-a" | "--all")
      INSTALL_VIM=true
      INSTALL_ZSH_PLUGINS=true
      INSTALL_BREW=true
      INSTALL_NPM=true
      CREATE_SYMLINKS=true
      break;;
    (--) shift; break;;
    (-*) echo "$0: error - unrecognized option $1" 1>&2; exit 1;;
    (*) break;;
  esac
  shift
done

if $INSTALL_BREW; then
  # "$DIR/installers/brew.sh"
  echo 'Brew formulas installed'
fi

if $INSTALL_ZSH_PLUGINS; then
  # "$DIR/installers/zsh.sh"
  echo 'ZSH plugins installed'
fi

# if $INSTALL_VIM; then
  # "$DIR/installers/vim.sh"
# fi

if $INSTALL_NPM; then
  # "$DIR/installers/npm.sh"
  echo 'npm modules installed'
fi

if $CREATE_SYMLINKS; then
  rcup -d symlinks -v
  echo 'Symlinks created'
fi
