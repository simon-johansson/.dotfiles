#!/bin/zsh

[[ -z $ANTIGEN ]] && echo 'export ANTIGEN=(path to antigen)' && return 1

ZSHFILES=$DOTFILES/zsh

# Load antigen library
source $ANTIGEN/antigen.zsh
source $ZSHFILES/antigen_conf.zsh

# Load zsh custom sources
source $ZSHFILES/functions.sh
cd "$ZSHFILES"
    load "exports.*.sh"
    load "functions.*.sh"
    load "aliases.*.sh"
    load "completion.*.sh"
    load "setopt.*.sh"
    load "lib/.*.sh"
cd -
