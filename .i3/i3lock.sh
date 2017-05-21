##!/usr/bin/env bash
#
## Dependencies: imagemagick, i3lock-color-git, scrot
#
#icon="$HOME/.i3/icon.png"
#tmpbg='/tmp/screen.png'
#PARAM='--textcolor=ffffff00 --insidecolor=77aa9944 --ringcolor=aaffee55 \
#        --linecolor=ffffff00 --keyhlcolor=99ffee99 --ringvercolor=00000000 \
#        --insidevercolor=00000055 --ringwrongcolor=00000055 --insidewrongcolor=0000001c'
#
#(( $# )) && { icon=$1; }
#
#scrot "$tmpbg"
##convert "$tmpbg" -blur 5x6 "$tmpbg"
#convert "$tmpbg" -filter Gaussian -resize 25% -define filter:sigma=1.5 -resize 400% "$tmpbg"
#convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"

i3lock #$PARAM -i "$tmpbg"
