vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user_lsp', { clear = true }),
  desc = 'Configure LSP keymaps',
  callback = function(event)
    local bufnr = event.buf

    local function keymap(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, {
        buffer = bufnr,
        desc = desc,
      })
    end

    keymap('n', 'K', vim.lsp.buf.hover, 'LSP hover')
    keymap('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
    keymap('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration')
    keymap('n', 'gi', vim.lsp.buf.implementation, 'Go to implementation')
    keymap('n', 'gr', vim.lsp.buf.references, 'Go to references')
    keymap('n', '<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
    keymap('n', '<leader>ca', vim.lsp.buf.code_action, 'Code action')
  end,
})
