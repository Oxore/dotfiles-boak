# Oxore's dotfiles

Welcome!

This repo contains some dotfiles from my "boak" machine. It is mostly about visual appearance.

This readme is meant to be helpful if you interest in some things this repo contains. I use `i3wm` with `i3blocks` bar on **Arch Linux**, so there are distro-specific names of dependencies and maybe some other things.




## Pop-up calendar

This is perl script to generate calendar layout for `dzen2` popup window.

![dzen2 calendar](http://i.imgur.com/LzdHbT3.png "dzen2 calendar")

Dependencies:
`xdotool`
`dzen2`
`perl`

Script file's location is`.i3/dzen/dzen.pl`. As script runs as window appears at left from mouse position by `x` and at `28 px` from top by `y`. It runs after click on tima-and-date block displaying at `i3bar`. The way how it's done is next lines in `.i3/scripts/timedate` file:

```
case $BLOCK_BUTTON in                                                           
  1) ~/.i3/dzen/dzen.pl ;;  # left click show calendar                          
esac
```

___

Feel free to ask me anything about my dotfiles by email or opening an issue.
