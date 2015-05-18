source antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
command-not-found
autojump
brew
git
node
npm
vagrant
osx
arialdomartini/oh-my-git
zsh-users/zsh-completions
zsh-users/zsh-syntax-highlighting
unixorn/autoupdate-antigen.zshplugin
djui/alias-tips
walesmd/caniuse.plugin.zsh
chriskempson/base16-iterm2
# MikeDacre/cdbk
# voronkovich/gitignore.plugin.zsh
# supercrabtree/k
# ascii-soup/zsh-url-highlighter
EOBUNDLES

# Load the theme.
# antigen theme robbyrussell
antigen theme arialdomartini/oh-my-git-themes oppa-lana-style

# Tell antigen that you're done.
antigen apply
