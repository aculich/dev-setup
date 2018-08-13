#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# http://superuser.com/questions/203707/how-to-uninstall-homebrew-mac-os-x-package-manager/203740#203740
# To uninstall run:
#     ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#### Github API token instructions: https://gist.github.com/christopheranderton/8644743

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install better (python) version: https://github.com/jacobsalmela/tccutil
#brew install tccutil

# Install Cask
brew install caskroom/cask/brew-cask
brew tap caskroom/versions
brew tap aculich/homebrew-custom

# Core casks
brew cask install --appdir="/Applications" emacs
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" amethyst
brew cask install --appdir="/Applications" totalspaces
brew cask install --appdir="/Applications" karabiner-elements
brew cask install --appdir="/Applications" spectacle
#brew cask install --appdir="/Applications" seil
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" docker-edge
brew cask install --appdir="/Applications" screenflick
#brew cask install --appdir="/Applications" switchresx
brew install cask --ignore-dependencies

brew cask install google-cloud-sdk

## Add to ~/.bash_profile
# source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
# source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'

# Install Fonts
brew tap caskroom/fonts
brew cask install --fontdir=/Library/Fonts font-xits
brew cask install --fontdir=/Library/Fonts font-source-code-pro
brew cask install --fontdir=/Library/Fonts font-source-serif-pro
brew cask install --fontdir=/Library/Fonts font-consolas-for-powerline
brew cask install --fontdir=/Library/Fonts font-inconsolata
brew cask install --fontdir=/Library/Fonts font-monoid

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
brew install bash
brew tap homebrew/versions
brew install bash-completion2
# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"
# Prompts for password
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/bash

# Install more recent versions of some OS X tools.
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

brew install byobu

# Install other useful binaries.
brew install watch
brew install jq
brew install asciinema
brew install pandoc
brew install ack
brew install dark-mode
brew install git
brew install git-extras
brew install hub
brew install pv
brew install rename
brew install speedtest_cli
brew install ssh-copy-id
brew install tree
brew install python
brew install python3
brew install xonsh

# Install yubikey and other security related tools
brew install oath-toolkit
brew install yubico-piv-tool
brew install yubikey-personalization
brew install ykclient
brew install ykneomgr
brew install ykpers
brew install gpg
brew install gpg-agent
brew cask install --appdir="/Applications" gpg-suite
brew cask install --appdir="/Applications" gpgtools
brew cask install --appdir="/Applications" yubico-authenticator
brew cask install --appdir="/Applications" yubikey-neo-manager
brew cask install --appdir="/Applications" yubikey-personalization-gui
brew cask install --appdir="/Applications" yubikey-piv-manager
brew cask install --appdir="/Applications" yubiswitch

## See instructions for setting up ssh+gpg+yubikey:
##   https://www.isi.edu/~calvin/yubikeyssh.htm

# Remove outdated versions from the cellar.
brew cleanup

# consider adding other packages from
# https://github.com/mathiasbynens/dotfiles
