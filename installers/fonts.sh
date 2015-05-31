#!/bin/zsh

# Installing the fonts needed for oh-my-git
cd /tmp
git clone http://github.com/gabrielelana/awesome-terminal-fonts
cd awesome-terminal-fonts
git checkout patching-strategy
mkdir -p /Users/$USER/Library/Fonts
cp patched/*.ttf /Users/$USER/Library/Fonts
