#!/bin/zsh

if ! type 'brew' &> /dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap caskroom/cask
# access specific versions to be able to install sublime-text3 & google-chrome-canary
brew tap caskroom/versions

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
brew install 'karn'
brew install 'rcm'
brew install 'rbenv'
brew install 'ruby-build'
brew install 'trash'
brew install 'antigen'
brew install 'mackup'
# brew install 'heroku-toolbelt'

# Cask
# brew install caskroom/cask/brew-cask

# Programming
brew cask install 'iterm2'
brew cask install 'transmit'
brew cask install 'rowanj-gitx'
# brew cask install 'sublime-text3'
# brew cask install 'atom'
# brew cask install 'virtualbox'
brew cask install 'sourcetree'
brew cask install 'postman'

# Design
brew cask install 'zeplin'
brew cask install 'sketch'

# Browsers
brew cask install 'google-chrome'
brew cask install 'google-chrome-canary'
brew cask install 'firefox'

# Status bar apps
brew cask install 'istat-menus'
brew cask install 'flux'
brew cask install 'caffeine'
brew cask install 'alfred'

# Social
brew cask install 'slack'
brew cask install 'microsoft-teams'
# brew cask install 'skype'

# Cloud apps
brew cask install 'dropbox'
# brew cask install 'google-drive'
# brew cask install 'evernote'

# Media
brew cask install 'vlc'
brew cask install 'spotify'

# Other
brew cask install 'the-unarchiver'
brew cask install 'appcleaner'
# brew cask install 'mou'
# brew cask install 'balsamiq-mockups'
# brew cask install 'sdformatter'
# brew cask install 'moom'

# Games
brew cask install 'steam'

brew update
brew upgrade brew-cask
brew cleanup
brew cask cleanup

# Other apps (not available on cask)
# Wunderlist
# Things
# 1password (from appstore)
# Giphy
# Office 365
# Moom
