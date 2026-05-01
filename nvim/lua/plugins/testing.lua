return {
	{
		"nvim-neotest/neotest",
		version = "*",
		ft = { "python" },
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-python",
		},
		keys = {
			{
				"<leader>tt",
				function()
					require("neotest").run.run()
				end,
				desc = "Run nearest test",
			},
			{
				"<leader>td",
				function()
					require("neotest").run.run({
						strategy = "dap",
					})
				end,
				desc = "Debug nearest test",
			},
			{
				"<leader>tf",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "Run current test file",
			},
			{
				"<leader>ts",
				function()
					require("neotest").summary.toggle()
				end,
				desc = "Toggle test summary",
			},
			{
				"<leader>to",
				function()
					require("neotest").output.open({
						enter = true,
						auto_close = true,
					})
				end,
				desc = "Open test output",
			},
			{
				"<leader>tO",
				function()
					require("neotest").output_panel.toggle()
				end,
				desc = "Toggle test output panel",
			},
			{
				"<leader>tw",
				function()
					require("neotest").watch.toggle(vim.fn.expand("%"))
				end,
				desc = "Toggle watch current file",
			},
			{
				"<leader>tS",
				function()
					require("neotest").run.stop()
				end,
				desc = "Stop test run",
			},
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-python")({
						runner = "pytest",
						args = {
							"--quiet",
						},
					}),
				},
				discovery = {
					enabled = true,
				},
				running = {
					concurrent = true,
				},
				summary = {
					animated = true,
				},
				output = {
					open_on_run = false,
				},
			})
		end,
	},
}
