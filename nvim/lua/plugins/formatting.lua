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
            lsp_format = 'fallback',
          })
        end,
        desc = 'Format file',
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff_format' },
        rust = { 'rustfmt', lsp_format = 'fallback' },

        sh = { 'shfmt' },
        bash = { 'shfmt' },
        zsh = { 'shfmt' },

        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
      },

      format_on_save = {
        timeout_ms = 1000,
        lsp_format = 'fallback',
      },
    },
  },
}
