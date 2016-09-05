#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew.
brew update

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi

# Install other useful binaries.
brew install imagemagick --with-webp
brew install webkit2png
brew install zopfli

# Remove outdated versions from the cellar.
brew cleanup

# consider adding other packages from
# https://github.com/mathiasbynens/dotfiles
