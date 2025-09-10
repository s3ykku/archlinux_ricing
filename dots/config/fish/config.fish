if status is-interactive
	set fish_greeting
	fastfetch
	if test (tty) = "/dev/tty1"
		exec Hyprland
	end
end

function fish_prompt
	echo (prompt_pwd) "> "
end

set -x SUDO_EDITOR nvim

alias conf_update="sudo bash /home/roman/downloads/archlinux_ricing/dots/config_updating.sh"

alias arch_update="sudo pacman -Syu"

alias clr="clear"

alias p="sudo pacman"

alias nv="nvim"

