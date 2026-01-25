function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

set fish_greeting

alias pamcan=pacman

set -gx TERM xterm-256color
zoxide init fish --cmd cd | source
oh-my-posh init fish --config $HOME/.config/oh-my-posh/config.toml | source
