return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      require('kanagawa').setup({
        compile = false,
        transparent = true,
        dimInactive = false,
        theme = 'wave',
      })

      vim.cmd.colorscheme('kanagawa')
    end,
  },
}
