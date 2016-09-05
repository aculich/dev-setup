#!/bin/bash

# This script is taken from:
# http://stackoverflow.com/questions/16093042/applescript-script-to-switch-caps-lock-key-to-control/16093043#16093043

# And it requires the Privacy settings updated for Accessibility access. To do
# so programmatically we use: https://github.com/jacobsalmela/tccutil

# As described here:
# https://apple.stackexchange.com/questions/178313/change-accessibility-setting-on-mac-using-terminal/239929#239929
# Additionally:
# http://stackoverflow.com/questions/31019916/is-not-allowed-for-assistive-access-error-when-running-applescript-from-java

# http://superuser.com/questions/590526/switch-function-keys-on-os-x-via-via-command-line

# list of keyboards plugged in to this computer
keyboard_ids=$(ioreg -n IOHIDKeyboard -r | grep -E 'VendorID"|ProductID' | awk '{ print $4 }' | paste -s -d'-\n' -)
# check if the keyboards are already remapped
echo $keyboard_ids | xargs -I{} sh -c 'defaults -currentHost read -g "com.apple.keyboard.modifiermapping.{}-0" 2>/dev/null | grep "Dst = 2" > /dev/null'
if [[ $? -ne 0 ]]; then
  # remap the keyboards
  echo $keyboard_ids | xargs -I{} defaults -currentHost write -g "com.apple.keyboard.modifiermapping.{}-0" -array "<dict><key>HIDKeyboardModifierMappingDst</key><integer>2</integer><key>HIDKeyboardModifierMappingSrc</key><integer>0</integer></dict>"
fi

# http://apple.stackexchange.com/questions/4813/changing-modifier-keys-from-the-command-line
# http://apple.stackexchange.com/questions/13598/updating-modifier-key-mappings-through-defaults-command-tool
# http://apple.stackexchange.com/questions/141069/updating-modifier-keys-from-the-command-line-takes-no-effect
# http://stevelosh.com/blog/2012/10/a-modern-space-cadet/
# http://superuser.com/questions/206898/where-are-those-defaults-stored-in-os-x
# https://github.com/mathiasbynens/dotfiles/issues/310
# https://github.com/mathiasbynens/dotfiles


exit

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
