local keymap = vim.keymap.set

keymap('n', '<Esc>', '<cmd>nohlsearch<CR>', {
  silent = true,
  desc = 'Clear search highlight',
})

keymap('n', 'n', 'nzzzv', {
  silent = true,
  desc = 'Next search result',
})

keymap('n', 'N', 'Nzzzv', {
  silent = true,
  desc = 'Previous search result',
})

keymap('n', ']q', '<cmd>cnext<CR>zzzv', {
  silent = true,
  desc = 'Next quickfix item',
})

keymap('n', '[q', '<cmd>cprev<CR>zzzv', {
  silent = true,
  desc = 'Previous quickfix item',
})

keymap('n', '<leader>qo', '<cmd>copen<CR>', {
  silent = true,
  desc = 'Open quickfix',
})

keymap('n', '<leader>qc', '<cmd>cclose<CR>', {
  silent = true,
  desc = 'Close quickfix',
})

keymap('n', '<leader>sw', function()
  local word = vim.fn.expand('<cword>')
  vim.cmd('silent grep! -F ' .. vim.fn.shellescape(word))
  vim.cmd('copen')
end, {
  silent = true,
  desc = 'Ripgrep word under cursor',
})

keymap('n', '<leader>w', '<cmd>write<CR>', {
  silent = true,
  desc = 'Save file',
})

keymap('n', '<leader>x', '<cmd>quit<CR>', {
  silent = true,
  desc = 'Quit window',
})

keymap('n', '<leader>h', '<cmd>split<CR>', {
  silent = true,
  desc = 'Horizontal split',
})

keymap('n', '<leader>v', '<cmd>vsplit<CR>', {
  silent = true,
  desc = 'Vertical split',
})

keymap('n', '<C-h>', '<C-w>h', {
  silent = true,
  desc = 'Go to left window',
})

keymap('n', '<C-j>', '<C-w>j', {
  silent = true,
  desc = 'Go to lower window',
})

keymap('n', '<C-k>', '<C-w>k', {
  silent = true,
  desc = 'Go to upper window',
})

keymap('n', '<C-l>', '<C-w>l', {
  silent = true,
  desc = 'Go to right window',
})

keymap('n', '<leader>bn', '<cmd>bnext<CR>', {
  silent = true,
  desc = 'Next buffer',
})

keymap('n', '<leader>bN', '<cmd>bprevious<CR>', {
  silent = true,
  desc = 'Previous buffer',
})

keymap('n', '<leader>bd', '<cmd>bdelete<CR>', {
  silent = true,
  desc = 'Delete buffer',
})

keymap('v', '<', '<gv', {
  silent = true,
  desc = 'Indent left and keep selection',
})

keymap('v', '>', '>gv', {
  silent = true,
  desc = 'Indent right and keep selection',
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
