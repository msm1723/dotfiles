return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'theHamsta/nvim-dap-virtual-text',
      'mfussenegger/nvim-dap-python',
    },
    keys = {
      {
        '<leader>db',
        function()
          require('dap').toggle_breakpoint()
        end,
        desc = 'Toggle breakpoint',
      },
      {
        '<leader>dB',
        function()
          require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
        end,
        desc = 'Set conditional breakpoint',
      },
      {
        '<leader>dc',
        function()
          require('dap').continue()
        end,
        desc = 'Debug continue/start',
      },
      {
        '<leader>do',
        function()
          require('dap').step_over()
        end,
        desc = 'Debug step over',
      },
      {
        '<leader>di',
        function()
          require('dap').step_into()
        end,
        desc = 'Debug step into',
      },
      {
        '<leader>dO',
        function()
          require('dap').step_out()
        end,
        desc = 'Debug step out',
      },
      {
        '<leader>dr',
        function()
          require('dap').repl.open()
        end,
        desc = 'Open debug REPL',
      },
      {
        '<leader>du',
        function()
          require('dapui').toggle()
        end,
        desc = 'Toggle debug UI',
      },
      {
        '<leader>dx',
        function()
          require('dap').terminate()
        end,
        desc = 'Terminate debug session',
      },
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')

      dapui.setup()

      require('nvim-dap-virtual-text').setup({
        commented = true,
      })

      local debugpy_python = vim.fn.stdpath('data') .. '/mason/packages/debugpy/venv/bin/python'

      if vim.fn.executable(debugpy_python) == 1 then
        require('dap-python').setup(debugpy_python)
      else
        require('dap-python').setup('python')
      end

      vim.fn.sign_define('DapBreakpoint', {
        text = '●',
        texthl = 'DiagnosticSignError',
        linehl = '',
        numhl = '',
      })

      vim.fn.sign_define('DapBreakpointCondition', {
        text = '◆',
        texthl = 'DiagnosticSignWarn',
        linehl = '',
        numhl = '',
      })

      vim.fn.sign_define('DapStopped', {
        text = '▶',
        texthl = 'DiagnosticSignInfo',
        linehl = 'Visual',
        numhl = '',
      })

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end

      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end

      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
}
