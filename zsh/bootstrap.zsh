#!/bin/zsh

[[ -z $ANTIGEN ]] && echo 'export ANTIGEN=(path to antigen)' && return 1

ZSHFILES=$DOTFILES/zsh

# Antigen settings
# ANTIGEN_CACHE=false

# Load Antigen
source $ANTIGEN

# Load antingen bundles and themes
antigen init $ZSHFILES/antigen_conf.zsh

# Load zsh custom sources
source $ZSHFILES/functions.sh
# source $ZSHFILES/update_reminder.sh

cd "$ZSHFILES"
  load "exports.*.sh"
  load "functions.*.sh"
  load "aliases.*.sh"
  load "completion.*.sh"
  load "setopt.*.sh"
  load "lib/.*.sh"
cd -
