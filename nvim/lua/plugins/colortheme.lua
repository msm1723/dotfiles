return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa").load("wave")

            -- Toggle background transparency
            local bg_transparent = true

            local toggle_transparency = function()
              bg_transparent = not bg_transparent
              vim.g.kanagawa_disable_background = bg_transparent
              vim.cmd [[colorscheme kanagawa]]
            end

            vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
		end,
	},
}
