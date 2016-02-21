#!/bin/bash

# Make sure we’re using the latest Homebrew
brew update

brew install zsh
brew install wget --enable-iri
brew install cmus # Music

# Dev
brew install vim --override-system-vi
brew install node
brew install docker
brew install ngrok
brew install the_silver_searcher # search with ag

# <3 git
brew install git
brew install hub
brew install diff-so-fancy

# Dotfiles management
brew tap thoughtbot/formulae
brew install thoughtbot/formulae/rcm
