#!/bin/sh

echo "update homebrew"
brew update

echo "upgrade already-installed packages"
brew upgrade

echo "install brew-packages"
brew install awscli
brew install ctags
brew install curl
brew install ghq
brew install git
brew install git-secrets
brew install grip
brew install hugo
brew install reattach-to-user-namespace
brew install sqlite
brew install tig
brew install tmux
brew install vim
brew install wget
brew install zsh

echo "install cask-packages"
brew tap homebrew/cask-cask
brew cask install alfred
brew cask install appcleaner
brew cask install bartender
brew cask install docker
brew cask install dropbox
brew cask install dynalist
brew cask install firefox
brew cask install forklift
brew cask install google-chrome
brew cask install iterm2
brew cask install karabiner-elements
brew cask install qlmarkdown
brew cask install slack
brew cask install vagrant

echo "remove outdated versions from the cellar"
brew cleanup
