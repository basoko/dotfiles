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
  emacs --daemon --with-x-toolkit=lucid &
  dbus-launch --exit-with-session xmonad
  # 1 hour of inactitvity before goes screen blank
  xset s 3600 3600

  # zoom black screen
  xcompmgr -c -l0 -t0 -r0 -o.00

  exec xmonad
  ;;
kde)
  exec startkde
  ;;
esac
