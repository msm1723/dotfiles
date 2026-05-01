return {
  {
    'tpope/vim-sleuth',
  },

  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {},
  },

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },

  {
    'folke/todo-comments.nvim',
    event = 'BufReadPost',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      signs = false,
    },
  },

  {
    'catgoose/nvim-colorizer.lua',
    event = 'BufReadPre',
    opts = {
      filetypes = { '*' },
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = false,
        mode = 'background',
      },
    },
  },
}
