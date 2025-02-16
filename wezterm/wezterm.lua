local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	enable_tab_bar = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE", -- disable the title bar but enable the resizable border
	default_cursor_style = "BlinkingBar",
	color_scheme = "Kanagawa (Gogh)",
	font = wezterm.font("CaskaydiaCove Nerd Font", { weight = "Light", stretch = "Normal", style = "Normal" }),
	font_size = 14,
	window_background_opacity = 1.0,
	window_padding = {
		left = 4,
		right = 0,
		top = 0,
		bottom = 0,
	},
}

return config
