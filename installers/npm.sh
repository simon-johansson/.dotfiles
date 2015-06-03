#!/bin/zsh

modules=(
  # Package managers
  'npm'
  'bower'

  # Yeoman
  'yo'
  'generator-angular-fullstack'
  'generator-webapp'

  # Generators
  'sails'
  'express-generator'

  # Grunt & gulp
  'grunt-cli'
  'gulp'

  # Linting
  'jshint'
  'coffeelint'
  'csslint'

  # Compilers
  'node-sass'
  'less'
  'jade'
  'browserify'
  'coffee-script'

  # Testing & coverage
  'mocha'

  # Utils
  'n'
  'js2coffee'
  'nodemon'
  'http-server'
  'npm-check-updates'
  'watch-lessc'
  'fixpack'
  )

for mod in $modules; do
  sudo npm install -g $mod
done
