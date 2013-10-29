#!/bin/sh

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#

case $1 in
xmonad)
	exec xmonad
	;;
kde|*)
	exec startkde
	;;
esac
