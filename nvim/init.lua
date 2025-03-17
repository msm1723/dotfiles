require('settings.options')
require('settings.keymaps')

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- import plugins
  require 'plugins.neo-tree',
  require 'plugins.colortheme',
  -- colorscheme that will be used when installing plugins
  install = { colorscheme = { 'kanagawa-wave' } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
