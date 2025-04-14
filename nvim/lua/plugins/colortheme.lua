return {
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local bg_transparent = true

      require('kanagawa').setup({
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = false },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        transparent = bg_transparent,
        theme = 'wave',
        background = {
          dark = 'wave', -- or "dragon"/"lotus"
          light = 'lotus',
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
