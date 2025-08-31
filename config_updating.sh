#!/bin/bash

PATHFROM="/home/roman"
PATHTO="/home/roman/downloads/archlinux_ricing"

cp -r ${PATHFROM}/.config/hypr ${PATHTO}/config/

cp -r ${PATHFROM}/.config/waybar ${PATHTO}/config/

cp -r ${PATHFROM}/.config/kitty ${PATHTO}/config/

cp -r ${PATHFROM}/.config/fish ${PATHTO}/config/

cp -r ${PATHFROM}/.config/rofi ${PATHTO}/config/

cp -r ${PATHFROM}/.config/yazi ${PATHTO}/config/

cp -r ${PATHFROM}/.config/nvim ${PATHTO}/config/

cp -r ${PATHFROM}/pictures/wallpapers ${PATHTO}/

cp ${PATHFROM}/.vimrc ${PATHTO}/config/vimrc
