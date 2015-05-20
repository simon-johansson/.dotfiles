#!/bin/bash

# rcup -d symlinks -v
# lsrc -d symlinks -v

USAGE="$(basename "$0") [-h --help] [-v --vim] [-z --zsh] [-b --brew] [-n --npm]

OPTIONS
        -h, --help
            Print this message

        -v, --vim
            Install VIM plugins & syntax

        -z, --zsh
            Install ZSH plugins

        -b, --brew
            Install homebrew & casks + formulas

        -n, --npm
            Install global npm modules\n"
if [[ -z $1 ]]; then
    printf "$USAGE"
    exit 0
fi
DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# CP="/bin/cp -vfr"

INSTALL_VIM=false
INSTALL_ZSH_PLUGINS=false
INSTALL_BREW=false
INSTALL_NPM=false

if ! OPTIONS=$(getopt -o hgcmpvtzaeb -l help,vim,zsh,brew,npm,all -- "$@")
then
    # something went wrong, getopt will put out an error message for us
    exit 1
fi
while [ $# -gt 0 ]; do
    case $1 in
        "-h" | "--help") printf "$USAGE"; exit 0 ;;
        "-v" | "--vim")  INSTALL_VIM=true ;;
        "-z" | "--zsh")  INSTALL_ZSH_PLUGINS=true ;;
        "-b" | "--brew") INSTALL_BREW=true ;;
        "-n" | "--npm")  INSTALL_NPM=true ;;
        "-a" | "--all")
            INSTALL_VIM=true
            INSTALL_ZSH_PLUGINS=true
            INSTALL_BREW=true
            INSTALL_NPM=true
            break;;
        (--) shift; break;;
        (-*) echo "$0: error - unrecognized option $1" 1>&2; exit 1;;
        (*) break;;
    esac
    shift
done

if $INSTALL_BREW; then
    "$DIR/installers/brew.sh"
fi

# if $INSTALL_ZSH_PLUGINS; then
#     "$DIR/installers/zsh.sh"
# fi

# if $INSTALL_VIM; then
#     "$DIR/installers/vim.sh"
# fi

if $INSTALL_NPM; then
    "$DIR/installers/npm.sh"
fi
