#!/bin/bash

PATHFROM="/home/roman/downloads/archlinux_ricing"
PATHTO="/home/roman"

mkdir -p ${PATHTO}/.config/fish

mkdir -p ${PATHTO}/.config/hypr

mkdir -p ${PATHTO}/.config/kitty

mkdir -p ${PATHTO}/.config/waybar

mkdir -p ${PATHTO}/.scripts/waybar

mkdir -p ${PATHTO}/.scripts/grim

mkdir -p ${PATHTO}/pictures

cp -r ${PATHFROM}/config/hypr/ ${PATHTO}/.config/

cp -r ${PATHFROM}/config/fish/ ${PATHTO}/.config/

cp -r ${PATHFROM}/config/waybar/ ${PATHTO}/.config/

cp -r ${PATHFROM}/config/kitty/ ${PATHTO}/.config/

cp -r ${PATHFROM}/scripts/ ${PATHTO}/.scripts/

cp -r ${PATHFROM}/wallpapers/ ${PATHTO}/pictures/

cp ${PATHFROM}/config/vimrc ${PATHTO}/.vimrc

chmod +x ${PATHTO}/.scripts/waybar/launch.sh

chmod +x ${PATHTO}/.scripts/grim/screenshot_to_clipboard.sh

sudo timedatectl set-ntp true

chsh -s $(which fish)

sudo sed -i '/ParallelDownloads = 5/c\ParallelDownloads = 25' /etc/pacman.conf

sudo sed -i '/#GRUB_DISABLE_OS_PROBER=false/c\GRUB_DISABLE_OS_PROBER=false' /etc/pacman.conf

os-prober

sudo grub-mkconfig -o /boot/grub/grub.cfg
