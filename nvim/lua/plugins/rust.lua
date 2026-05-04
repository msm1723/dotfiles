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
        '<localleader>h',
        function()
          vim.cmd.RustLsp({ 'hover', 'actions' })
        end,
        desc = 'Rust hover actions',
        ft = 'rust',
      },
      {
        '<localleader>a',
        function()
          vim.cmd.RustLsp('codeAction')
        end,
        desc = 'Rust code action',
        ft = 'rust',
      },
      {
        '<localleader>r',
        function()
          vim.cmd.RustLsp('runnables')
        end,
        desc = 'Rust runnables',
        ft = 'rust',
      },
      {
        '<localleader>e',
        function()
          vim.cmd.RustLsp('explainError')
        end,
        desc = 'Rust explain error',
        ft = 'rust',
      },
      {
        '<localleader>d',
        function()
          vim.cmd.RustLsp('renderDiagnostic')
        end,
        desc = 'Rust render diagnostic',
        ft = 'rust',
      },
      {
        '<localleader>c',
        function()
          vim.cmd.RustLsp('openCargo')
        end,
        desc = 'Open Cargo.toml',
        ft = 'rust',
      },
      {
        '<localleader>o',
        function()
          vim.cmd.RustLsp('openDocs')
        end,
        desc = 'Open Rust docs',
        ft = 'rust',
      },
    },
  },
}
