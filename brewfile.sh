#!/bin/sh

echo "update homebrew"
brew update

echo "upgrade already-installed packages"
brew upgrade

echo "install brew-packages"
brew install ctags
brew install curl
brew install ghq
brew install git
brew install peco
brew install reattach-to-user-namespace
brew install sqlite
brew install tig
brew install tmux
brew install vim --with-lua
brew install wget
brew install zsh

echo "install cask-packages"
brew tap caskroom/cask
brew cask install appcleaner
brew cask install clipy
brew cask install docker
brew cask install dropbox
brew cask install firefox
brew cask install google-chrome
brew cask install iterm2
brew cask install qlmarkdown
brew cask install vagrant
brew cask install workflowy

echo "remove outdated versions from the cellar"
brew cleanup
