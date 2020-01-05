FROM archlinux/base

# Username, UID and GID for new user, should be the same as on host system.
ARG NEW_USERNAME=user
ARG NEW_UID=1000
ARG NEW_GID=1000

RUN groupadd -g $NEW_GID $NEW_USERNAME
RUN useradd -m -u $NEW_UID -g $NEW_GID $NEW_USERNAME
RUN echo -ne "root:toor" | chpasswd
RUN echo -ne "$NEW_USERNAME:abcd" | chpasswd
RUN pacman --noconfirm -Syyuu
RUN pacman --noconfirm -S sudo sshfs htop vim nano emacs openvpn
RUN pacman --noconfirm -S nodejs clang jdk-openjdk
RUN pacman --noconfirm -S \
  firefox qtcreator qbittorrent libreoffice-fresh libreoffice-fresh-ru \
  openscad kicad inkscape

USER $NEW_USERNAME
