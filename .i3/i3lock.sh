#!/bin/sh

setxkbmap us
i3lock -f
sleep 1
setxkbmap -model pc105 -layout us,ru -option grp:win_space_toggle
