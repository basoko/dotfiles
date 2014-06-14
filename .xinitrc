#!/bin/sh

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#

case $1 in
xmonad|*)
  [[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
  xsetroot -cursor_name left_ptr
  # Set up an icon tray
  trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent true --tint 0x191970 --height 12 &
  nm-applet &
  dropboxd start &
  dbus-launch --exit-with-session xmonad
  # 1 hour of inactitvity before goes screen blank
  xset s 3600 3600
  exec xmonad
  ;;
kde)
  exec startkde
  ;;
esac
