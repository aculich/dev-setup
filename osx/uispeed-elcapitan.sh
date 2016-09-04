#!/usr/bin/env bash

# http://www.defaults-write.com/10-terminal-commands-to-speed-up-your-mac-in-os-x-el-capitan/

# 10 terminal commands to speed up your Mac in OS X El Capitan

# November 27, 2015November 27, 2015 by Mr.W

# Most improvements in OS X 10:11 El Capitan are not immediately visible to the
# ordinary OS X user. Especially under the hood many improvements have been made
# in the area of performance and safety.

# Do you want OS X 10:11 El Capitan faster than you can use the OS X Terminal
# Commands 10 below. The commands disable various delays from that standard built
# by Apple.

# Open OS X Terminal, which you can find in the folder: Applications ▸
# Utilities. Copy and paste the following command either in the Terminal window.

# OS X user interface

# 1. Disable animations when opening and closing windows.

defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# 2. Disable animations when opening a Quick Look window.

defaults write -g QLPanelAnimationDuration -float 0

# 3. Accelerated playback when adjusting the window size (Cocoa applications).

defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# 4. Disable animation when opening the Info window in OS X Finder (cmd⌘ + i).

defaults write com.apple.finder DisableAllAnimations -bool true

# 5. Disable animations when you open an application from the Dock.

defaults write com.apple.dock launchanim -bool false

# 6. Make all animations faster that are used by Mission Control.

defaults write com.apple.dock expose-animation-duration -float 0.1

# 7. Disable the delay when you hide the Dock

defaults write com.apple.Dock autohide-delay -float 0

# Mail app
# 8. Disable the animation when you sending and replying an e-mail

defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true

# Safari
# 9. Disable the standard delay in rendering a Web page.

defaults write com.apple.Safari WebKitInitialTimedLayoutDelay 0.25

# 10. The keyboard react faster to keystrokes (not equally useful for everyone

defaults write NSGlobalDomain KeyRepeat -int 0

# When the commands are conducted in OS X Terminal, you need to reboot your
# Mac. After re-login you will notice that your Mac responds smoother.

# Undo changes

# If you want any of the above commands undo than is possible using the defaults
# delete command.

# defaults delete domain key

# Example: To undo the adjustment number 10, type the command:

# defaults delete NSGlobalDomain KeyRepeat

# After undoing, you need to restart your Mac.
