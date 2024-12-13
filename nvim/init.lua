-- Expand the path to the dotfiles directory
-- local home_dir = vim.fn.expand('~')
-- local dotfiles_path = home_dir .. '/gitlocal/dotfiles/nvim/'

-- Add the dotfiles directory to the package path to allow require('config.lazy')
-- package.path = package.path .. ';' .. dotfiles_path .. '?.lua;' .. dotfiles_path .. '?/init.lua;' .. dotfiles_path .. '?/?.lua'

-- Require main configuration files from ~/dotfiles/nvim/config/
require("custom.lazy")
require("custom.settings")
