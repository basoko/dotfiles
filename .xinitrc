#!/bin/sh

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#

case $1 in
xmonad)
  xsetroot -cursor_name left_ptr
  exec xmonad
  ;;
kde|*)
  exec startkde
  ;;
esac
