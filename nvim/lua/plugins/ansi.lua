return {
	{
		"0xferrous/ansi.nvim",
		ft = {
			"log",
			"ansi",
		},
		cmd = {
			"AnsiEnable",
			"AnsiDisable",
			"AnsiToggle",
		},
		keys = {
			{
				"<leader>ua",
				"<cmd>AnsiToggle<cr>",
				desc = "Toggle ANSI colors",
			},
		},
		opts = {
			auto_enable = true,
			auto_enable_stdin = true,
			filetypes = {
				"log",
				"ansi",
			},
			colors = {
				theme = "terminal",
			},
		},
	},
}
