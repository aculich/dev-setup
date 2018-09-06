#!/bin/sh
# save-hotkeys.sh
# https://superuser.com/questions/670584/how-can-i-migrate-all-keyboard-shortcuts-from-one-mac-to-another#
# https://www.raizlabs.com/dev/2015/02/how-to-script-os-x-keyboard-shortcuts/

# https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/
# https://github.com/pawelgrzybek/dotfiles/blob/master/setup-macos.sh
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos

# Command:  @
# Control:  ^
# Option:   ~
# Shift:    $
# Tab: \U21e5 (Unicode code point for ⇥ character)

COMMAND_KEY_SYMBOL="@"
CONTROL_KEY_SYMBOL="^"
OPTION_KEY_SYMBOL="~"
SHIFT_KEY_SYMBOL="$"
TAB_KEY_SYMBOL="\\U21e5" # Note the backslash-escaped backslash.

# # You may need to restart the Finder or kill the preferences daemon for the change to take effect:
# killall Finder
# killall cfprefsd

DESTFILE=install-hotkeys.sh
echo '#!/bin/bash' > $DESTFILE

defaults find NSUserKeyEquivalents | sed -e "s/Found [0-9]* keys in domain '\\([^']*\\)':/defaults write \\1 NSUserKeyEquivalents '/" -e "s/    NSUserKeyEquivalents =     {//"  -e "s/};//" -e "s/}/}'/" >> $DESTFILE
echo killall Finder >> $DESTFILE
echo killall cfprefsd >> $DESTFILE
chmod a+x $DESTFILE
