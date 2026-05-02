local augroup = vim.api.nvim_create_augroup("user_config", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	desc = "Highlight yanked text",
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	desc = "Remove trailing whitespace on save",
	callback = function()
		local cursor = vim.api.nvim_win_get_cursor(0)

		vim.cmd([[%s/\s\+$//e]])

		vim.api.nvim_win_set_cursor(0, cursor)
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	group = augroup,
	pattern = {
		"*.log",
		"*.logs",
	},
	desc = "Set log files to log filetype",
	callback = function()
		vim.bo.filetype = "log"
	end,
})
