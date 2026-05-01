return {
  {
    'mrcjkb/rustaceanvim',
    version = '^9',
    lazy = false,
    init = function()
      vim.g.rustaceanvim = {
        server = {
          default_settings = {
            ['rust-analyzer'] = {
              cargo = {
                allFeatures = true,
              },
              check = {
                command = 'clippy',
              },
            },
          },
        },
      }
    end,
    keys = {
      {
        '<leader>rh',
        function()
          vim.cmd.RustLsp({ 'hover', 'actions' })
        end,
        desc = 'Rust hover actions',
        ft = 'rust',
      },
      {
        '<leader>ra',
        function()
          vim.cmd.RustLsp('codeAction')
        end,
        desc = 'Rust code action',
        ft = 'rust',
      },
      {
        '<leader>rr',
        function()
          vim.cmd.RustLsp('runnables')
        end,
        desc = 'Rust runnables',
        ft = 'rust',
      },
      {
        '<leader>re',
        function()
          vim.cmd.RustLsp('explainError')
        end,
        desc = 'Rust explain error',
        ft = 'rust',
      },
      {
        '<leader>rd',
        function()
          vim.cmd.RustLsp('renderDiagnostic')
        end,
        desc = 'Rust render diagnostic',
        ft = 'rust',
      },
      {
        '<leader>rc',
        function()
          vim.cmd.RustLsp('openCargo')
        end,
        desc = 'Open Cargo.toml',
        ft = 'rust',
      },
      {
        '<leader>ro',
        function()
          vim.cmd.RustLsp('openDocs')
        end,
        desc = 'Open Rust docs',
        ft = 'rust',
      },
    },
  },
}
