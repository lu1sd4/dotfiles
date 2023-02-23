#!/usr/bin/env bash

PKGS=(
    'vscodium-bin'
    'spotify'
    'slack-desktop'
    'teamocil'
    'nvm'
    'archlinux-java-run'
    'toilet'
)

for PKG in "${PKGS[@]}"; do
    echo "install: ${PKG}"
    yay -S "$PKG" --noconfirm --needed
done

echo
echo "done"
echo