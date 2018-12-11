#!/bin/bash
# install gnome-terminal profile

dconf dump /org/gnome/terminal/legacy/profiles:/:32bd4538-5819-4142-8feb-058da38fa402/ < profile.dconf
