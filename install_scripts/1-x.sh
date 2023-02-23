#!/usr/bin/env bash

PKGS=(
    'xorg-server'
    'xorg-apps'
    'xorg-xinit'
    'xf86-video-intel'
)

for PKG in "${PKGS[@]}"; do
    echo "install: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done
