return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        compile = false,
        transparent = false,
        dimInactive = false,
        theme = 'wave',
      })

      vim.cmd.colorscheme('kanagawa')
    end,
  },
}
