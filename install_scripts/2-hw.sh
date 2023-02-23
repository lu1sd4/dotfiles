#!/usr/bin/env bash

PKGS=(
    'mesa'
    'vulkan-intel'
    'alsa-utils'
    'alsa-plugins'
    'pulseaudio'
    'pulseaudio-alsa'
    'pavucontrol'
    'bluez'
    'bluez-utils'
    'blueman'
    'pulseaudio-bluetooth'
)

for PKG in "${PKGS[@]}"; do
    echo "install: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done