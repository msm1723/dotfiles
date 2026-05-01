vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user_lsp', { clear = true }),
  desc = 'Configure LSP keymaps',
  callback = function(event)
    local bufnr = event.buf

    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, {
        buffer = bufnr,
        desc = desc,
      })
    end

    map('n', 'K', vim.lsp.buf.hover, 'LSP hover')
    map('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
    map('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration')
    map('n', 'gi', vim.lsp.buf.implementation, 'Go to implementation')
    map('n', 'gr', vim.lsp.buf.references, 'Go to references')
    map('n', '<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
    map('n', '<leader>ca', vim.lsp.buf.code_action, 'Code action')

    map('n', '[d', function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, 'Previous diagnostic')

    map('n', ']d', function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, 'Next diagnostic')

    map('n', '<leader>de', vim.diagnostic.open_float, 'Show diagnostic')
    map('n', '<leader>dq', vim.diagnostic.setqflist, 'Diagnostics quickfix')
  end,
})
