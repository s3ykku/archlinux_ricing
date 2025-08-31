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

alias conf_update="bash /home/roman/downloads/archlinux_ricing/config_updating.sh"

alias arch_update="sudo pacman -Syu"

alias clr="clear"

alias p="sudo pacman"

alias nv="nvim"
