# .dotfiles

## On a fresh install

##### 1. Set zsh as the defulat shell
```bash
$ chsh -s $(which zsh)
```

##### 2. Clone this repo to ~/
```bash
$ cd ~ && git clone https://github.com/simon-johansson/.dotfiles.git && cd .dotfiles/
```

<!-- Run the install script using zsh
```bash
$ zsh install.sh
```
 -->

##### 3. Install Homebrew & Casks + formulas
```bash
$ zsh installers/brew.sh
```

##### 4. Install ZSH plugins using [Antigen](https://github.com/zsh-users/antigen)
```bash
$ zsh installers/zsh.sh
```

##### 5. Create symlinks to `~/` for files in `symlinks/` folder
```bash
# Close the current terminal/iTerm window tab and
# open a new one after finishing this step
$ rcup -d symlinks -v
```

##### 6. Install global Node.js modules
```bash
$ zsh installers/npm.sh
```

##### 7. Install global Ruby gems
```bash
$ zsh installers/gem.sh
```

##### 8. Install font needed for zsh theme [oh-my-git](https://github.com/arialdomartini/oh-my-git)
```bash
$ zsh installers/fonts.sh
```

##### 9. Set OSX settings (screenshots folder, keyboard repeat rate, etc.)
```bash
$ zsh <(curl -s 'https://gist.githubusercontent.com/brandonb927/3195465/raw/1ec980e6803610791d36e45e1fc5a9ce3cd40507/osx-for-hackers.sh')
```

#### Also...

* Create SSH-keys

## Restoring application settings
Syncing application settings between mac:s is done with [mackup](https://github.com/lra/mackup) using Dropbox.

Before restoring, make sure that:

* You have installed Dropbox and synced your account
* You are fine with overwriting your current application settings

```bash
$ mackup restore
```

## Configure iTerm
Open iTerm preferences and set "Load preferences from a custom folder or URL" to `~/.dotfiles/iterm`. Import `colors.itermcolors`, located in `~/.dotfiles/iterm`, as custom color scheme for some fancy colors.

## Sublime Text Package Control
Install [Package Control](https://packagecontrol.io/installation), the package manager for Sublime, in order to install packages.

## Updating
Run the following command once in a while
```bash
$ update_everything
```
It will:
* Update Homebrew and formulas
* Update Zsh plugins with Antigen
* Update Node to the latest stable version

## License
MIT
