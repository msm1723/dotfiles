return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'jay-babu/mason-nvim-dap.nvim',
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')

      dapui.setup()

      require('mason-nvim-dap').setup({
        ensure_installed = { 'debugpy' },
        handlers = {
          function(config)
            require('mason-nvim-dap').default_setup(config)
          end,
        },
      })

      ---@diagnostic disable-next-line: undefined-field
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      ---@diagnostic disable-next-line: undefined-field
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      ---@diagnostic disable-next-line: undefined-field
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end
    end,
  },
}
