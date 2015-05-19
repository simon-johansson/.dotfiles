# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# prompt when not in a git repo
PS1="%~ • "

antigen bundles <<EOBUNDLES
command-not-found
autojump
git
brew
sublime

zsh-users/zsh-syntax-highlighting
zsh-users/zsh-history-substring-search
arialdomartini/oh-my-git
unixorn/autoupdate-antigen.zshplugin
djui/alias-tips
voronkovich/gitignore.plugin.zsh
walesmd/caniuse.plugin.zsh

# npm
# osx
# zsh-users/zsh-completions src
# supercrabtree/k
EOBUNDLES

# Load the theme.
antigen theme arialdomartini/oh-my-git-themes oppa-lana-style

# Tell antigen that you're done.
antigen apply

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

