# Docker apps

I've decided to put some **heavy** apps into archlinux based container.

Script that runs docker is `./arch-containered-app`.

Every app is a specially named symlink to `./arch-containered-app-wrapper` which
is a wrapper around `./arch-containered-app` script. It detects the name it was
invoked (effectively symlink's name) and runs necessary app.

Currently existing apps:

- `kicad`
- `inkscape`
- `libreoffice`
- `openscad`
- `qbittorrent`
- `qtcreator`
