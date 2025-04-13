require('settings.options')
require('settings.keymaps')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- colorscheme that will be used when installing plugins
  install = { colorscheme = { 'kanagawa-wave' } },
  -- import plugins
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
  -- automatically check for plugin updates
  checker = { enabled = true },
})
