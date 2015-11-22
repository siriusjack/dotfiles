#!/bin/sh

# check homebrew
if test ! $(which brew); then
echo "Installing homebrew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew doctor
brew update

#
# cui tools
# 
brew install coreutils
brew install findutils
# shell
brew install zsh
# vcs
brew install git
# editor
brew install vim --with-lua
# terminal multiplexer
brew install tmux
brew install reattach-to-user-namespace
# docker
brew install docker
brew install boot2docker
# network
brew install openconnect
# env tools
brew install pyenv
brew install homebrew/boneyard/pyenv-pip-rehash
brew install rbenv
brew install rbenv-gem-rehash
brew install nodebrew
# misc
brew instll rmtrash
brew install tree

#
# cask
#
brew install caskroom/cask/brew-cask
# tweek
brew cask install alfred
brew cask install karabiner
brew cask install xtrafinder
brew cask install the-unarchiver
# devs
brew cask install iterm2
brew cask install xquartz
brew cask install sublime-text
brew cask install virtualbox
brew cask install vagrant
# tex
#brew cask install mactex
# misc
brew cask install google-chrome
brew cask install evernote

