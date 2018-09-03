# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# prompt when not in a git repo
PS1="%~ • "

# Plugin settings
ANTIGEN_AUTOUPDATE_VERBOSE=true

antigen bundles <<EOBUNDLES
  command-not-found
  autojump
  git
  brew
  sublime
  history

  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-autosuggestions
  djui/alias-tips
  voronkovich/gitignore.plugin.zsh

  # unixorn/autoupdate-antigen.zshplugin
  # npm
  # arialdomartini/oh-my-git
  # osx
  # zsh-users/zsh-completions src
  # supercrabtree/k
EOBUNDLES

# Load the theme.
# antigen theme sindresorhus/pure pure
antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship

# Tell antigen that you're done.
antigen apply

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
