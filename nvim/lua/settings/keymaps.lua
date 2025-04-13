-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true })
end

-- Disable the spacebar key's default behavior in Normal and Visual modes
map({ 'n', 'v' }, '<Space>', '<Nop>')

-- Save
map('n', '<leader>w', '<CMD>update<CR>')

-- Quit
map('n', '<leader>q', '<CMD>q<CR>')

-- Exit insert mode
map('i', 'jk', '<ESC>')

-- Delete single character without copying into register
map('n', 'x', '"_x')

-- Vertical scroll half screen down/up and center
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- Find next/previous and center
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Clear highlighting
map('n', '<Esc>', ':nohlsearch<CR>')

-- Window managemen
map('n', '<leader>v', '<C-w>v') -- split window vertically
map('n', '<leader>h', '<C-w>s') -- split window horizontally
map('n', '<leader>se', '<C-w>=') -- make split windows equal width & height
map('n', '<leader>xs', '<CMD>close<CR>') -- close current split window-- Window Navigation

-- Navigate between splits
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-j>', '<C-w>j')

-- Resize Windows
map('n', '<C-Left>', '<C-w><')
map('n', '<C-Right>', '<C-w>>')
map('n', '<C-Up>', '<C-w>+')
map('n', '<C-Down>', '<C-w>-')

-- Buffers
map('n', '<Tab>', '<CMD>bnext<CR>')
map('n', '<S-Tab>', '<CMD>bprevious<CR>')
map('n', '<leader>x', '<CMD>bdelete!<CR>') -- close buffer
map('n', '<leader>b', '<CMD>enew<CR>') -- new buffe

-- Tabs
map('n', '<leader>to', ':tabnew<CR>') -- open new tab
map('n', '<leader>tx', ':tabclose<CR>') -- close current tab
map('n', '<leader>tn', ':tabn<CR>') --  go to next tab
map('n', '<leader>tp', ':tabp<CR>') --  go to previous tab

-- Toggle line wrapping
map('n', '<leader>lw', '<cmd>set wrap!<CR>')

-- Stay in indent mode
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Keep last yanked when pasting
map('v', 'p', '"_dP')

-- Diagnostic keymaps
map('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end) -- go to previous diagnostic message
map('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end) -- go to next diagnostic message
map('n', '<leader>d', vim.diagnostic.open_float) -- open floating diagnostic message
map('n', '<leader>f', vim.diagnostic.setloclist) -- open diagnostics list
