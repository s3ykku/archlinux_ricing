#!/bin/bash

PATHFROM="/home/roman/Downloads/archlinux_ricing/s3ykku"
PATHTO="/home/roman/.config"
PATHTOSCRIPTS="/home/roman/.scripts"

mkdir -p ${PATHTO}/fish

mkdir -p ${PATHTO}/hypr

mkdir -p ${PATHTO}/kitty

mkdir -p ${PATHTO}/waybar

mkdir -p ${PATHTOSCRIPTS}/waybar

mkdir -p ${PATHTOSCRIPTS}/grim

cp ${PATHFROM}/config/hypr/hyprland.conf ${PATHTO}/hypr/

cp ${PATHFROM}/config/fish/config.fish ${PATHTO}/fish/

cp ${PATHFROM}/config/waybar/config.jsonc ${PATHTO}/waybar/

cp ${PATHFROM}/config/waybar/style.css ${PATHTO}/waybar/

cp ${PATHFROM}/config/kitty/kitty.conf ${PATHTO}/kitty

cp ${PATHFROM}/scripts/grim/screenshot_to_clipboard.sh ${PATHTOSCRIPTS}/grim/

cp ${PATHFROM}/scripts/waybar/launch.sh ${PATHTOSCRIPTS}/waybar/

chmod +x ${PATHTOSCRIPTS}/waybar/launch.sh

chmod +x ${PATHTOSCRIPTS}/grim/screenshot_to_clipboard.sh

sudo timedatectl set-ntp true

bash ${PATHTOSCRIPTS}/waybar/launch.sh

chsh -s $(which fish)
