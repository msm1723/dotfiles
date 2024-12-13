return {
  {
    'shaunsingh/nord.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- Disable italic styles
      vim.g.nord_italic = false
      vim.g.nord_italic_comments = false

      -- Now load Nord
      vim.cmd('colorscheme nord')
    end,
  },
}
