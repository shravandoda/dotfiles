-- Pull in the wezterm API and build a config object
local wezterm = require("wezterm")
local config = wezterm.config_builder()

----------------------------------------------------------------------
--- General configuration options
----------------------------------------------------------------------

--- Enable 120Hz refresh rate
config.max_fps = 120
config.animation_fps = 10

-- Rendering backend preference
config.prefer_egl = true

--- Enable Scrollbar
config.enable_scroll_bar = true

---- WSL2 configuration
config.default_prog =
	{ "C:\\WINDOWS\\system32\\wsl.exe", "--distribution-id", "{015c167b-3b0d-47aa-bce8-87b6f9b09176}", "--cd", "~" }

----------------------------------------------------------------------
--- Appearance configuration options
----------------------------------------------------------------------

--- Font configuration
config.font_size = 11
config.font = wezterm.font("Maple Mono NF", { weight = "Medium", italic = false })
config.line_height = 1.25

--- Color scheme
config.color_scheme = "Vs Code Dark+ (Gogh)"

---------------- Window configuration ----------------

---- Remove window decorations
config.window_decorations = "RESIZE"

---- Opacity of the window
config.window_background_opacity = 1.00

---- Set the initial window size
config.initial_cols = 240
config.initial_rows = 62

---- Padding around the terminal
config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 5,
}

---------------- Tab bar configuration ----------------

---- Tab bar at the bottom
config.window_frame = {
	font_size = 11.0,
	font = wezterm.font({ family = "Inter", weight = "Bold" }),
	active_titlebar_bg = "#1d2021",
	inactive_titlebar_bg = "#1d2021",
}

---------------- Key bindings configuration ----------------

config.keys = {
	{
		key = "q",
		mods = "CTRL",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
}

-- Finally, return the configuration to wezterm:
return config
