vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true

opt.wrap = false
opt.linebreak = true

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true

opt.signcolumn = 'yes'
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.splitright = true
opt.splitbelow = true

opt.undofile = true
opt.swapfile = false
opt.backup = false

opt.updatetime = 250
opt.timeoutlen = 400

opt.clipboard = 'unnamedplus'

opt.completeopt = { 'menu', 'menuone', 'noselect' }

opt.list = true
opt.listchars = {
  tab = '» ',
  trail = '·',
  nbsp = '␣',
}
