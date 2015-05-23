#!/bin/bash

DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

command_exists () {
    type "$1" &> /dev/null;
}

printf "\nInstalling/Updating Brew\n"

if command_exists 'brew'; then
    brew update
    brew upgrade --all
    brew cleanup
    brew cask cleanup
else
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    # to be able to use brewfiles
    brew tap Homebrew/bundle

    brew tap caskroom/cask
    # access specific versions to be able to install sublime-text3
    brew tap caskroom/versions
    # to be able to install fonts via cask
    brew tap caskroom/fonts

    # Thoughtbots rcm dotfile management lib
    brew tap thoughtbot/formulae

fi

cd "$DIR"

brew bundle
brew bundle cleanup

cd -
