local wezterm = require("wezterm")
local act = wezterm.action
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"
config.enable_tab_bar = false
config.window_padding = {
	left = 2,
	right = 2,
	top = 8,
	bottom = 8,
}

config.leader = { key = "n", mods = "CTRL" }
config.keys = {
	-- Splits
	{
		mods = "LEADER",
		key = "s",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "v",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "m",
		action = act.TogglePaneZoomState,
	},
	-- Pane Move
	-- {
	-- 	mods = "CTRL|SHIFT",
	-- 	key = "h",
	-- 	action = act.RotatePanes("Clockwise"),
	-- },
	-- {
	-- 	mods = "CTRL|SHIFT",
	-- 	key = "l",
	-- 	action = act.RotatePanes("CounterClockwise"),
	-- },
	{
		mods = "LEADER",
		key = "Space",
		action = act.PaneSelect({
			mode = "SwapWithActive",
		}),
	},
	-- Other
	{
		mods = "LEADER",
		key = "x",
		action = act.ActivateCopyMode,
	},
}

smart_splits.apply_to_config(config, {
	-- directional keys to use in order of: left, down, up, right
	direction_keys = { "h", "j", "k", "l" },
	-- modifier keys to combine with direction_keys
	modifiers = {
		move = "CTRL", -- modifier to use for pane movement, e.g. CTRL+h to move left
		resize = "CTRL|SHIFT", -- modifier to use for pane resize, e.g. META+h to resize to the left
	},
	-- log level to use: info, warn, error
	log_level = "info",
})

return config
