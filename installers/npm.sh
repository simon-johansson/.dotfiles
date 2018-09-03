
#!/bin/zsh

node_modules=(
  # Package managers
  'npm'
  # 'bower'

  # Yeoman
  'yo'

  # Generators
  'express-generator'

  # Utils
  'n'
  'nodemon'
  'http-server'
  'npm-check-updates'
  # 'fixpack'
  )

for mod in $node_modules; do
  npm install -g $mod
done
