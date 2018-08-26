#!/usr/bin/env bash

# modify OS X's accessibility database

brew list tccutil >/dev/null || brew install tccutil

list="com.amethyst.Amethyst com.apple.Terminal com.googlecode.iterm2 org.pqrs.Karabiner-AXNotifier com.binaryage.TotalSpaces2 com.divisiblebyzero.Spectacle"
for i in $list; do
  sudo /usr/local/bin/tccutil --insert $i
  sudo /usr/local/bin/tccutil --enable $i
done
