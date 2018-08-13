#!/usr/bin/env bash

#./caps-to-control.sh
./osx/accessories.sh
./osx/activity-monitor.sh
./osx/appstore.sh
./osx/dock.sh
./osx/finder.sh
./osx/general.sh
./osx/google-chrome.sh
./osx/screen.sh
./osx/terms.sh
./osx/utils.sh
./osx/restart-all-affected-services.sh
cp com.googlecode.iterm2.plist /Users/me/Library/Preferences/com.googlecode.iterm2.plist
cp .gitconfig ~/.gitconfig
git config --global user.name "Aaron Culich"
git config --global user.email "aculich@gmail.com"
git config --global credential.helper osxkeychain
