#!/usr/bin/env bash

PKGS=(
    # system

    'ntp'

    # graphical env

    'i3-wm'
    'polybar'
    'feh'
    'python-pywal'
    'dunst'
    'unclutter'

    # terminal

    'alacritty'
    'curl'
    'zip'
    'tar'
    'fzf'
    'htop'
    'jq'
    'neofetch'
    'openssh'
    'rsync'
    'unzip'
    'unrar'
    'wget'
    'zsh'
    'zsh-completions'
    'pulsemixer'
    'ranger'
    'autorandr'
    'chezmoi'
    'nitrogen'
    'starship'
    'exa'
    'bat'
    'tealdeer'

    # disk

    'udiskie'
    'exfat-utils'
    'gparted'
    'parted'
    'filelight'

    # web

    'firefox'
    'chromium'
    'thunderbird'

    # dev

    'cmake'
    'gcc'
    'glibc'
    'mariadb'
    'pyenv'
    'virtualbox'
    'virtualbox-host-modules-arch'
    'mkcert'
    'myrepos'

    # media

    'vlc'
    'scrot'
    'imagemagick'
    'peek'
    'zathura'
    'libreoffice-fresh'
    'pngcrush'

    # social

    'discord'
    'element-desktop'
)

for PKG in "${PKGS[@]}"; do
    echo "install: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo
echo "done"
echo