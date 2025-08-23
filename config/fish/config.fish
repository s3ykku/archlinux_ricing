if status is-interactive
	set fish_greeting
	fastfetch
	if test (tty) = "/dev/tty1"
		exec Hyprland
	end
end


function fish_prompt
	echo @(whoami) (prompt_pwd)
	echo "> "
end
