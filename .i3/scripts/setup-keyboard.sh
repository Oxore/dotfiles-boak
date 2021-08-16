#!/bin/sh
export $(tr '\0' '\n' </proc/$(ps a -o pid,cmd \
  | grep '/usr/bin/[i]3' \
  | head -n1 \
  | awk '{print $1}')/environ \
  | grep DISPLAY)
xset r rate 300 60
setxkbmap -model pc105 -layout us,ru -option grp:caps_toggle
