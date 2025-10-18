local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font configuration
config.font = wezterm.font("MesloLGS NF")
config.font_size = 20

-- Color scheme
config.color_scheme = "Catppuccin Mocha"

-- Enable transparency and blur
config.window_background_opacity = 0.49
config.window_background_gradient = {
	orientation = "Vertical",
	interpolation = "Linear",
	colors = {
		"#1e1e2e",
		"#181825",
	},
}

-- Enable blur on supported platforms (macOS and Windows)
config.macos_window_background_blur = 40
config.win32_system_backdrop = "Acrylic"

-- Terminal padding
config.window_padding = {
	left = 15,
	right = 15,
	top = 15,
	bottom = 5,
}

-- Tab bar styling
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.show_tab_index_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- Window decorations
config.window_decorations = "RESIZE"

-- Animation settings
config.animation_fps = 60
config.cursor_blink_rate = 800

-- Terminal bell
config.audible_bell = "Disabled"

return config
