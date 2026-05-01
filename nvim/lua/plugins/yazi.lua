return {
	{
		"mikavilpas/yazi.nvim",
		version = "*",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{
				"<leader>-",
				"<cmd>Yazi<cr>",
				desc = "Open Yazi at current file",
				mode = { "n", "v" },
			},
			{
				"<leader>cw",
				"<cmd>Yazi cwd<cr>",
				desc = "Open Yazi in working directory",
			},
			{
				"<C-Up>",
				"<cmd>Yazi toggle<cr>",
				desc = "Resume Yazi session",
			},
		},
		opts = {
			open_for_directories = false,
			floating_window_scaling_factor = 0.9,
			yazi_floating_window_border = "rounded",
			yazi_floating_window_winblend = 0,
			keymaps = {
				show_help = "<f1>",
			},
		},
	},
}
