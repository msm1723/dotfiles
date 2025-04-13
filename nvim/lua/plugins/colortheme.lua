return {
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local bg_transparent = true

      require('kanagawa').setup({
        transparent = bg_transparent,
        background = {
          dark = 'wave', -- or "dragon"/"lotus"
        },
      })

      vim.cmd([[colorscheme kanagawa]])

      local toggle_transparency = function()
        bg_transparent = not bg_transparent
        require('kanagawa').setup({
          transparent = bg_transparent,
          background = {
            dark = 'wave',
          },
        })
        vim.cmd([[colorscheme kanagawa]])
      end

      vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
    end,
  },
}
