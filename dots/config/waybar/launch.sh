#!/bin/bash
killall waybar
waybar -c ~/.config/waybar/config.jsonc & -s /home/roman/.config/waybar/style.css
