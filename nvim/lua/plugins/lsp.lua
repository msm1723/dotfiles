local servers = {
  'lua_ls',
  'basedpyright',
  'ruff',
  'bashls',
  'jsonls',
  'yamlls',
}

return {
  {
    'williamboman/mason.nvim',
    lazy = false,
    opts = {},
  },

  {
    'williamboman/mason-lspconfig.nvim',
    lazy = false,
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = servers,

        -- Important:
        -- We explicitly enable LSP servers ourselves with vim.lsp.enable(...).
        -- This prevents Mason from starting something unexpected.
        automatic_enable = false,
      })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    lazy = false,
    config = function()
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              globals = {
                'vim',
              },
            },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
              },
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      vim.lsp.config('basedpyright', {
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = 'standard',
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = 'openFilesOnly',
            },
          },
        },
      })

      vim.lsp.config('ruff', {
        init_options = {
          settings = {
            lint = {
              enable = true,
            },
          },
        },
      })

      vim.lsp.config('bashls', {})
      vim.lsp.config('jsonls', {})
      vim.lsp.config('yamlls', {
        filetypes = {
          'yaml',
        },
        settings = {
          redhat = {
            telemetry = {
              enabled = false,
            },
          },
          yaml = {
            format = {
              enable = true,
            },
          },
        },
      })
      vim.lsp.enable(servers)
    end,
  },
}
