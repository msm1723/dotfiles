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
    keymap('n', 'gd', function()
      Snacks.picker.lsp_definitions()
    end, 'Go to definition')

    keymap('n', 'gD', function()
      Snacks.picker.lsp_declarations()
    end, 'Go to declaration')

    keymap('n', 'gr', function()
      Snacks.picker.lsp_references()
    end, 'References')

    keymap('n', 'gI', function()
      Snacks.picker.lsp_implementations()
    end, 'Go to implementation')

    keymap('n', 'gy', function()
      Snacks.picker.lsp_type_definitions()
    end, 'Go to type definition')
    keymap('n', 'K', vim.lsp.buf.hover, 'LSP hover')
    keymap('n', '<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
    keymap('n', '<leader>ca', vim.lsp.buf.code_action, 'Code action')
  end,
})
