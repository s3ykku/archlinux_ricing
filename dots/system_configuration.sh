#!/bin/bash

PATHFROM="/home/roman/downloads/archlinux_ricing/dots"
PATHTO="/home/roman"

cp -r ${PATHFROM}/config/hypr ${PATHTO}/.config/

cp -r ${PATHFROM}/config/fish ${PATHTO}/.config/

cp -r ${PATHFROM}/config/waybar ${PATHTO}/.config/

cp -r ${PATHFROM}/config/kitty ${PATHTO}/.config/

cp -r ${PATHFROM}/scripts ${PATHTO}/

cp -r ${PATHFROM}/wallpapers ${PATHTO}/pictures/

cp -r ${PATHFROM}/config/yazi ${PATHTO}/.config/

cp -r ${PATHFROM}/config/rofi ${PATHTO}/.config/

cp -r ${PATHFROM}/config/nvim ${PATHTO}/.config/

chmod +x ${PATHTO}/.config/waybar/launch.sh

chmod +x ${PATHTO}/scripts/grim/screenshot_to_clipboard.sh

sudo timedatectl set-ntp true

chsh -s $(which fish)

sudo sed -i '/ParallelDownloads = 5/c\ParallelDownloads = 25' /etc/pacman.conf

sudo sed -i '/#GRUB_DISABLE_OS_PROBER=false/c\GRUB_DISABLE_OS_PROBER=false' /etc/default/grub

os-prober

sudo grub-mkconfig -o /boot/grub/grub.cfg

mkdir -p ${PATHTO}/downloads/git

cd ${PATHTO}/downloads/git

git clone https://aur.archlinux.org/yay.git

cd yay/ && makepkg -si

cd ${PATHTO}

yay -S visual-studio-code-bin spotify rofi-wayland
