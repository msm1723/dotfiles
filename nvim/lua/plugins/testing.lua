return {
  {
    'nvim-neotest/neotest',
    version = '*',
    ft = { 'python' },
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-python',
    },
    keys = {
      {
        '<localleader>t',
        function()
          require('neotest').run.run()
        end,
        desc = 'Run nearest test',
        ft = 'python',
      },
      {
        '<localleader>d',
        function()
          require('neotest').run.run({
            strategy = 'dap',
          })
        end,
        desc = 'Debug nearest test',
        ft = 'python',
      },
      {
        '<localleader>f',
        function()
          require('neotest').run.run(vim.fn.expand('%'))
        end,
        desc = 'Run current test file',
        ft = 'python',
      },
      {
        '<localleader>s',
        function()
          require('neotest').summary.toggle()
        end,
        desc = 'Toggle test summary',
        ft = 'python',
      },
      {
        '<localleader>o',
        function()
          require('neotest').output.open({
            enter = true,
            auto_close = true,
          })
        end,
        desc = 'Open test output',
        ft = 'python',
      },
      {
        '<localleader>O',
        function()
          require('neotest').output_panel.toggle()
        end,
        desc = 'Toggle test output panel',
        ft = 'python',
      },
      {
        '<localleader>w',
        function()
          require('neotest').watch.toggle(vim.fn.expand('%'))
        end,
        desc = 'Toggle watch current file',
        ft = 'python',
      },
      {
        '<localleader>S',
        function()
          require('neotest').run.stop()
        end,
        desc = 'Stop test run',
        ft = 'python',
      },
    },
    config = function()
      require('neotest').setup({
        adapters = {
          require('neotest-python')({
            runner = 'pytest',
            args = {
              '--quiet',
            },
          }),
        },
        discovery = {
          enabled = true,
        },
        running = {
          concurrent = true,
        },
        summary = {
          animated = true,
        },
        output = {
          open_on_run = false,
        },
      })
    end,
  },
}
