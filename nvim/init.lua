-- 1. Core editor setup (runs immediately, no plugins involved)
require('settings.options')
require('settings.keymaps')

-- 2. Lazy bootstrap (also runs immediately)
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- 3. Lazy setup (THIS was the only broken part)
require('lazy').setup({
  require('plugins.neo-tree'),
  require('plugins.colortheme'),
  require('plugins.bufferline'),
  require('plugins.lualine'),
  require('plugins.treesitter'),
  require('plugins.telescope'),
  require('plugins.lsp'),
  require('plugins.cmp'),
  require('plugins.none-ls'),
  require('plugins.gitsigns'),
  require('plugins.alpha'),
  require('plugins.indent-blankline'),
  require('plugins.misc'),
  require('plugins.nvim-dap'),
  require('plugins.neo-test'),
}, {
  install = { colorscheme = { 'kanagawa-wave' } },
  checker = { enabled = true },
})
