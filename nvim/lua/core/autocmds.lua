local augroup = vim.api.nvim_create_augroup('user_config', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup,
  desc = 'Highlight yanked text',
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  group = augroup,
  desc = 'Remove trailing whitespace on save',
  callback = function()
    local cursor = vim.api.nvim_win_get_cursor(0)

    vim.cmd([[%s/\s\+$//e]])

    vim.api.nvim_win_set_cursor(0, cursor)
  end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = augroup,
  pattern = {
    '*.ans',
    '*.ansi',
    '*.log',
    '*.logs',
  },
  desc = 'Set log files to log filetype',
  callback = function()
    vim.bo.filetype = 'log'
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = 'python',
  desc = 'Use 4 spaces for Python',
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab = true
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Disable auto-comment continuation',
  callback = function()
    vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
  end,
})
