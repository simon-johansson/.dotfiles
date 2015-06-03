#!/bin/zsh

gems=(
  'compass'
  'compass-core'
  'bundler'
  'sass'
  'scss-lint'
  'travis'
  'rubygems-update'
  )

for gem in $gems do
  sudo gem install gem
done



