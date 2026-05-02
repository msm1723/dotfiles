return {
	{
		"0xferrous/ansi.nvim",
		ft = {
			"log",
			"logs",
			"ans",
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
				"logs",
				"ans",
				"ansi",
			},
			colors = {
				theme = "terminal",
			},
		},
	},
}
