#!/bin/sh

set -xe
TMPDIR=/tmp/_tmp_update_discord
mkdir -p $TMPDIR
cd $TMPDIR
wget "https://discord.com/api/download?platform=linux&format=tar.gz" -O discord.tar.gz
tar xf *.tar.gz
ls
rm -rf $HOME/.local/share/Discord
mv /tmp/_tmp_update_discord/Discord $HOME/.local/share/Discord
cd /tmp
rm -rfv $TMPDIR
