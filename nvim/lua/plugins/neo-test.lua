return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-neotest/neotest-python',
      'nvim-neotest/nvim-nio', -- ← this is the missing one
    },
    config = function()
      local neotest = require('neotest')

      neotest.setup({
        adapters = {
          require('neotest-python')({
            dap = { justMyCode = false },
            runner = 'pytest',
          }),
        },
      })

      vim.keymap.set('n', '<leader>tt', function()
        neotest.run.run()
      end)
      vim.keymap.set('n', '<leader>tf', function()
        neotest.run.run(vim.fn.expand('%'))
      end)
      vim.keymap.set('n', '<leader>ts', neotest.summary.toggle)
      vim.keymap.set('n', '<leader>to', function()
        neotest.output.open({ enter = true })
      end)
    end,
  },
}
