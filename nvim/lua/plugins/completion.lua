return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		event = { "InsertEnter", "CmdlineEnter" },
		opts = {
			keymap = {
				preset = "default",
			},

			appearance = {
				nerd_font_variant = "mono",
			},

			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 250,
				},
				ghost_text = {
					enabled = true,
				},
			},

			snippets = {
				preset = "default",
			},

			sources = {
				default = {
					"lsp",
					"path",
					"snippets",
					"buffer",
				},
			},

			signature = {
				enabled = true,
			},
		},
	},
}
