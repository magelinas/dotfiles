local wezterm = require("wezterm")

local keys = {
	{
		key = "w",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "t",
		mods = "LEADER",
		action = wezterm.action.SpawnCommandInNewTab({
			domain = "CurrentPaneDomain",
			cwd = wezterm.home_dir,
		}),
	},
	{
		mods = "LEADER",
		key = "-",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "=",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
}

for i = 1, 8 do
	table.insert(keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

return {
	font = wezterm.font("Iosevka Nerd Font Mono"),
	font_size = 16.0,

	enable_wayland = false,

	window_background_opacity = 0.97,

	default_prog = { "/usr/bin/fish", "--login", "--interactive" },

	color_scheme = "Tokyo Night",

	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = false,

	unix_domains = {
		{
			name = "unix",
		},
	},

	default_gui_startup_args = { "connect", "unix" },

	leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 },

	keys = keys,
}
