return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>cf',
        function()
          require('conform').format({
            async = true,
          })
        end,
        mode = { 'n', 'v' },
        desc = 'Format file or selection',
      },
    },
    opts = {
      default_format_opts = {
        lsp_format = 'fallback',
      },

      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff_format' },
        rust = { 'rustfmt' },

        sh = { 'shfmt' },
        bash = { 'shfmt' },
        zsh = { 'shfmt' },

        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
      },

      format_on_save = {
        timeout_ms = 1000,
      },
    },
  },
}
