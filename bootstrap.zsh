[[ -z $ANTIGEN ]] && echo 'export ANTIGEN=(path to antigen)' && return 1

# Load antigen library
source $ANTIGEN/antigen.zsh
source $DOTFILES/.antigen_conf

# Load zsh custom sources
ZSHFILES=$DOTFILES/zsh
source $ZSHFILES/functions.sh
cd "$ZSHFILES"
    load "exports.*.sh"    # sources all aliases files
    load "functions.*.sh"  # sources any local functions files (functions.local.sh)
    load "aliases.*.sh"    # sources all aliases files
    load "completion.*.sh" # sources all aliases files
    load "setopt.*.sh"     # sources all aliases files
    load "lib/.*.sh"       # sources all libs
cd -
