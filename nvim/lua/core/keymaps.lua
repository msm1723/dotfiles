local keymap = vim.keymap.set

keymap({ 'n', 'v' }, '<Space>', '<Nop>', {
  silent = true,
  desc = 'Disable Space',
})

keymap('n', '<Esc>', '<cmd>nohlsearch<CR>', {
  silent = true,
  desc = 'Clear search highlight',
})

keymap('n', '<leader>ss', '<cmd>write<cr>', {
  silent = true,
  desc = 'Save file',
})

keymap('n', '<leader>sS', '<cmd>wall<cr>', {
  silent = true,
  desc = 'Save all files',
})

keymap('i', 'jk', '<Esc>', {
  silent = true,
  desc = 'Exit insert mode',
})

keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", {
  expr = true,
  silent = true,
  desc = 'Move down',
})

keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", {
  expr = true,
  silent = true,
  desc = 'Move up',
})

keymap('n', 'x', '"_x', {
  silent = true,
  desc = 'Delete character without yanking',
})

keymap('v', 'p', '"_dP', {
  silent = true,
  desc = 'Paste without replacing register',
})

keymap('n', '<leader>lw', function()
  vim.wo.wrap = not vim.wo.wrap
end, {
  silent = true,
  desc = 'Toggle line wrap',
})

keymap('v', '<', '<gv', {
  silent = true,
  desc = 'Indent left and keep selection',
})

keymap('v', '>', '>gv', {
  silent = true,
  desc = 'Indent right and keep selection',
})

keymap('n', 'n', 'nzzzv', {
  silent = true,
  desc = 'Next search result center',
})

keymap('n', 'N', 'Nzzzv', {
  silent = true,
  desc = 'Previous search result center',
})

keymap('n', '<C-d>', '<C-d>zz', {
  silent = true,
  desc = 'Scroll half-page down and center',
})

keymap('n', '<C-u>', '<C-u>zz', {
  silent = true,
  desc = 'Scroll half-page up and center',
})

keymap('n', '<leader>qo', '<cmd>copen<CR>', {
  silent = true,
  desc = 'Open quickfix',
})

keymap('n', '<leader>qc', '<cmd>cclose<CR>', {
  silent = true,
  desc = 'Close quickfix',
})

keymap('n', ']q', '<cmd>cnext<CR>zzzv', {
  silent = true,
  desc = 'Next quickfix item',
})

keymap('n', '[q', '<cmd>cprev<CR>zzzv', {
  silent = true,
  desc = 'Previous quickfix item',
})

keymap('n', '<leader>lo', '<cmd>lopen<CR>', {
  silent = true,
  desc = 'Open location list',
})

keymap('n', '<leader>lc', '<cmd>lclose<CR>', {
  silent = true,
  desc = 'Close location list',
})

keymap('n', ']l', '<cmd>lnext<CR>zzzv', {
  silent = true,
  desc = 'Next location item',
})

keymap('n', '[l', '<cmd>lprev<CR>zzzv', {
  silent = true,
  desc = 'Previous location item',
})

keymap('n', '<leader>fw', function()
  local word = vim.fn.expand('<cword>')
  if word == '' then
    return
  end
  vim.cmd('silent grep! -F -- ' .. vim.fn.shellescape(word))
  vim.cmd('copen')
end, {
  silent = true,
  desc = 'Ripgrep word under cursor',
})

keymap('n', '<leader>h', '<cmd>split<CR>', {
  silent = true,
  desc = 'Horizontal split',
})

keymap('n', '<leader>v', '<cmd>vsplit<CR>', {
  silent = true,
  desc = 'Vertical split',
})

keymap('n', '<leader>wh', '<cmd>vertical resize -5<CR>', {
  silent = true,
  desc = 'Decrease window width',
})

keymap('n', '<leader>wl', '<cmd>vertical resize +5<CR>', {
  silent = true,
  desc = 'Increase window width',
})

keymap('n', '<leader>wk', '<cmd>resize +3<CR>', {
  silent = true,
  desc = 'Increase window height',
})

keymap('n', '<leader>wj', '<cmd>resize -3<CR>', {
  silent = true,
  desc = 'Decrease window height',
})

keymap('n', '<leader>w=', '<C-w>=', {
  silent = true,
  desc = 'Equalize splits',
})

keymap('n', ']b', '<cmd>bnext<CR>', {
  silent = true,
  desc = 'Next buffer',
})

keymap('n', '[b', '<cmd>bprevious<CR>', {
  silent = true,
  desc = 'Previous buffer',
})

keymap('n', '<leader>bd', '<cmd>bdelete<CR>', {
  silent = true,
  desc = 'Delete buffer',
})

keymap('n', '<leader>bD', '<cmd>bdelete!<CR>', {
  silent = true,
  desc = 'Force delete buffer',
})

keymap('n', '<leader>be', '<cmd>enew<CR>', {
  silent = true,
  desc = 'New empty buffer',
})

keymap('n', '<leader><Tab>o', '<cmd>tabnew<CR>', {
  silent = true,
  desc = 'Open new tab',
})

keymap('n', '<leader><Tab>x', '<cmd>tabclose<CR>', {
  silent = true,
  desc = 'Close current tab',
})

keymap('n', ']t', '<cmd>tabnext<CR>', {
  silent = true,
  desc = 'Next tab',
})

keymap('n', '[t', '<cmd>tabprevious<CR>', {
  silent = true,
  desc = 'Previous tab',
})

keymap('n', '<leader>dd', vim.diagnostic.open_float, {
  silent = true,
  desc = 'Show diagnostic',
})

keymap('n', '<leader>dl', function()
  vim.diagnostic.setloclist({ open = true })
end, {
  silent = true,
  desc = 'Open diagnostics location list',
})

keymap('n', '[d', function()
  vim.diagnostic.jump({ count = -1, float = true })
end, {
  silent = true,
  desc = 'Previous diagnostic',
})

keymap('n', ']d', function()
  vim.diagnostic.jump({ count = 1, float = true })
end, {
  silent = true,
  desc = 'Next diagnostic',
})
