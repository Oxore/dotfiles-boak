# Oxore's dotfiles

Welcome!

This repo contains some dotfiles from my "boak" machine. It is mostly about visual appearance.

This readme is meant to be helpful if you interest in some things this repo contains.
I use `i3wm` with `i3blocks` bar on **Gentoo Linux**, so there are distro-specific names of dependencies and may be some other specific things.

## Pop-up calendar

This is perl script to generate a calendar layout for `dzen2` popup window.

![dzen2 calendar](http://i.imgur.com/LzdHbT3.png "dzen2 calendar")

The font used on the screenshot above is `System San Francisco Display` size of 10. You can check it in `.i3/config` and in `.i3/dzen/dzen.pl` itself. The feature of this font is the monotype digits, but other characters are not monotype. This feature allows you to use this font in status bar -- so you get the nice non-monotype font with non-jumping text on the clock section when time value is changing every second.

**Dependencies:**
`xdotool`,
`dzen`,
`perl`.

The script file location is`.i3/dzen/dzen.pl`.
As the script runs it's window appears to the left from the mouse position by `x` and at `28 px` from top by `y`.
The script runs after clicking on the time&date block displaying at `i3bar`.
The way how it's done is the next lines in `.i3/scripts/timedate` file:

```
case $BLOCK_BUTTON in
  1) ~/.i3/dzen/dzen.pl ;;  # left click show calendar
esac
```

## Agnoster modified

My visual modification of the "agnoster" theme from [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).
The modification is implemented within the `.zshrc` file.

![agnoster](https://i.imgur.com/Nd7drsm.png "Agnoster modification")

**Dependencies:**
[`oh-my-zsh`](https://github.com/robbyrussell/oh-my-zsh),
any font patched by [`nerd-fonts` patcher](https://github.com/ryanoasis/nerd-fonts#font-patcher).

The font used on the screenshot is "Monaco For Powerline" size of 11 patched by `nerd-fonts` patcher.
You can find it in the [fonts](.local/share/fonts) directory.

## Fonts

- `fonts/Monaco for Powerline.otf` for ST as `"Monaco for Powerline:weight=bold:pixelsize=11:antialias=true:autohint=true";`
- `fonts/Monaco_Linux.ttf` for gnome-terminal

___

Feel free to ask me anything about my dotfiles by email or opening an issue.
