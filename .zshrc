
export DOTFILES=~/.dotfiles
export ANTIGEN=$DOTFILES/antigen

source $DOTFILES/bootstrap.zsh

auto-ls () { ls; }
chpwd_functions=( auto-ls $chpwd_functions )

# if which karn > /dev/null; then eval "$(karn init)"; fi

node /Users/sijo/Projects/personal/pragmatic_tips/index.js
