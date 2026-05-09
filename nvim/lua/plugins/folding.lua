return {
  {
    'kevinhwang91/nvim-ufo',
    event = 'VeryLazy',
    dependencies = {
      'kevinhwang91/promise-async',
    },
    keys = {
      {
        'zR',
        function()
          require('ufo').openAllFolds()
        end,
        desc = 'Open all folds',
      },
      {
        'zM',
        function()
          require('ufo').closeAllFolds()
        end,
        desc = 'Close all folds',
      },
      {
        'zp',
        function()
          require('ufo').peekFoldedLinesUnderCursor()
        end,
        desc = 'Preview fold',
      },
    },
    opts = {
      provider_selector = function(_, filetype, _)
        local lsp_filetypes = {
          lua = true,
          python = true,
          rust = true,
          bash = true,
          sh = true,
          json = true,
          yaml = true,
        }

        if lsp_filetypes[filetype] then
          return { 'lsp', 'indent' }
        end

        return { 'treesitter', 'indent' }
      end,
    },
  },
}
