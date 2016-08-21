#!/bin/bash

# This script is taken from:
# http://stackoverflow.com/questions/16093042/applescript-script-to-switch-caps-lock-key-to-control/16093043#16093043

# And it requires the Privacy settings updated for Accessibility access. To do
# so programmatically we use: https://github.com/jacobsalmela/tccutil

# As described here:
# https://apple.stackexchange.com/questions/178313/change-accessibility-setting-on-mac-using-terminal/239929#239929

brew list tccutil >/dev/null || brew install tccutil

sudo tccutil --insert com.apple.Terminal
sudo tccutil --enable com.apple.Terminal

osascript <<EOF
tell application "System Preferences"
   activate
   set current pane to pane "com.apple.preference.keyboard"
end tell

tell application "System Events"
tell application process "System Preferences"
  get properties

  click button "Modifier Keys…" of tab group 1 of window "Keyboard"
  tell sheet 1 of window "Keyboard"
    click pop up button 4
    set capsLockCurrentlyOn to (value of attribute "AXMenuItemMarkChar" of menu item 1 of menu 1 of pop up button 4 as string) ≠ ""
    --display dialog "Caps Lock On: " & capsLockCurrentlyOn
    if capsLockCurrentlyOn is true then
      --tell me to beep 3
      click menu item 2 of menu 1 of pop up button 4
    else
      --tell me to beep 2
      click menu item 1 of menu 1 of pop up button 4
    end if
    click button "OK"
  end tell
end tell
tell application "System Preferences" to quit
end tell
EOF
