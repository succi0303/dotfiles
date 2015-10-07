#!/bin/sh

echo "update homebrew"
brew update

echo "upgrade already-installed packages"
brew upgrade

echo "add repositories"
brew tap homebrew/binary
brew tap homebrew/versions

echo "install brew cask"
brew tap caskroom/cask
brew install brew-cask

echo "install brew-packages"
brew install ag
brew install curl
brew install ghq
brew install git
brew install go
brew install heroku-toolbelt
brew install hub
brew install nodejs
brew install peco
brew install pyenv
brew install reattach-to-user-namespace
brew install sqlite
brew install tig
brew install tmux
brew install vim --with-lua
brew install wget
brew install zsh

echo "install ruby environment"
brew install libyaml
brew install openssl
brew install rbenv
brew install readline
brew install ruby-build

echo "for nokogiri"
brew tap homebrew/dupes
brew install libxml2
brew install libxslt
brew install libiconv
link libxml2 libxslt libiconv

echo "install cask-packages"
brew cask install appcleaner
brew cask install atom
brew cask install caffeine
brew cask install chefdk
brew cask install coteditor
brew cask install dropbox
brew cask install firefox
brew cask install flash
brew cask install google-chrome
brew cask install iterm2
brew cask install karabiner
brew cask install kobito
brew cask install qlmarkdown
brew cask install quicksilver
brew cask install slack
brew cask install sourcetree
brew cask install vagrant
brew cask install virtualbox
brew cask install vmware-fusion

echo "remove outdated versions from the cellar"
brew cleanup
