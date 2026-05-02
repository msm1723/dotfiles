return {
  {
    'nvim-telescope/telescope.nvim',
    branch = 'master',
    cmd = 'Telescope',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
    },
    keys = {
      {
        '<leader>ff',
        function()
          require('telescope.builtin').find_files()
        end,
        desc = 'Find files',
      },
      {
        '<leader>fg',
        function()
          require('telescope.builtin').live_grep()
        end,
        desc = 'Find text',
      },
      {
        '<leader>fb',
        function()
          require('telescope.builtin').buffers()
        end,
        desc = 'Find buffers',
      },
      {
        '<leader>fh',
        function()
          require('telescope.builtin').help_tags()
        end,
        desc = 'Find help',
      },
      {
        '<leader>fr',
        function()
          require('telescope.builtin').oldfiles()
        end,
        desc = 'Recent files',
      },
    },
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      telescope.setup({
        defaults = {
          path_display = { 'smart' },
          mappings = {
            i = {
              ['<esc>'] = actions.close,
            },
          },
        },
      })

      pcall(telescope.load_extension, 'fzf')
    end,
  },
}
