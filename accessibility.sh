#!/usr/bin/env bash

# modify OS X's accessibility database

brew list tccutil >/dev/null || brew install tccutil

list="com.amethyst.Amethyst com.apple.Terminal com.googlecode.iterm2 org.pqrs.Karabiner-AXNotifier"
for i in $list; do
  sudo tccutil --insert $i
  sudo tccutil --enable $i
done
