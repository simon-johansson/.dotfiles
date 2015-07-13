#!/bin/zsh

if ! type 'brew' &> /dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap caskroom/cask
# access specific versions to be able to install sublime-text3 & google-chrome-canary
brew tap caskroom/versions
# to be able to install fonts via cask
brew tap caskroom/fonts

# Thoughtbots rcm dotfile management lib
brew tap thoughtbot/formulae

brew install 'coreutils'
brew install 'findutils'
brew install 'rename'
brew install 'bash'
brew install 'zsh'
brew install 'wget'
brew install 'tree'
brew install 'node'
brew install 'git'
brew install 'autojump'
brew install 'mongodb'
brew install 'python'
brew install 'unrar'
brew install 'mackup'
brew install 'karn'
brew install 'heroku-toolbelt'
brew install 'rcm'

# Cask
brew install caskroom/cask/brew-cask

# Programming
brew cask install 'iterm2'
brew cask install 'transmit'
brew cask install 'gitx'
brew cask install 'sublime-text3'

# Browsers
brew cask install 'google-chrome'
brew cask install 'google-chrome-canary'
brew cask install 'firefox'

# Status bar apps
brew cask install 'istat-menus'
brew cask install 'flux'
brew cask install 'caffeine'
brew cask install 'alfred'

# Install 1password via AppStore to get iCould sync
# brew cask install '1password'

# Social
brew cask install 'skype'
# brew cask install 'slack'

# Cloud apps
# brew cask install 'google-drive'
brew cask install 'dropbox'
brew cask install 'evernote'

# Media
brew cask install 'vlc'
brew cask install 'spotify'

# Other
brew cask install 'the-unarchiver'
# brew cask install 'mou'
brew cask install 'balsamiq-mockups'
brew cask install 'sdformatter'
brew cask install 'appcleaner'
# brew cask install 'moom'

# Games
# brew cask install 'steam'

# Quicklook extension
brew cask install 'qlcolorcode'
brew cask install 'qlstephen'
brew cask install 'qlmarkdown'
brew cask install 'quicklook-json'
brew cask install 'qlprettypatch'
brew cask install 'quicklook-csv'
brew cask install 'betterzipql'
brew cask install 'webpquicklook'
brew cask install 'suspicious-package'

# Fonts
brew cask install 'font-fontawesome'
brew cask install 'font-source-code-pro'
brew cask install 'font-source-code-pro-for-powerline'
brew cask install 'font-inconsolata'
brew cask install 'font-inconsolata-for-powerline'
brew cask install 'font-droid-sans-mono'
brew cask install 'font-droid-sans-mono-for-powerline'

brew update
brew upgrade brew-cask
brew cleanup
brew cask cleanup
