-- Disable unused language providers.
-- This keeps :checkhealth cleaner and avoids checking tools we do not use.
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local opt = vim.opt

-- Encoding
vim.opt.encoding = 'utf-8' -- Internal Vim encoding
vim.opt.fileencoding = 'utf-8' -- File encoding for saving/loading

-- UI
opt.number = true -- Show line numbers
opt.relativenumber = true -- Relative line numbers
opt.numberwidth = 4 -- Width of the number column
opt.cursorline = true -- Highlight the current line
opt.signcolumn = 'yes' -- Always show the sign column
opt.termguicolors = true -- True color support
opt.cmdheight = 1 -- Height of command line area
opt.showtabline = 2 -- Always display tab line
opt.pumheight = 10 -- Popup menu height
opt.title = true -- Set terminal window title
opt.ruler = true -- Display cursor position at bottom
opt.conceallevel = 0 -- Display Markdown backticks clearly
opt.guifont = 'CaskaydiaCove Nerd Font:h14'

-- Editing Behavior
opt.wrap = false -- Disable line wrap
opt.breakindent = true -- Indent wrapped lines for readability
opt.linebreak = true -- Wrap lines at word boundary
opt.autoindent = true -- Auto-indent new lines
opt.smartindent = true -- Smart indentation
opt.expandtab = true -- Convert tabs to spaces
opt.shiftwidth = 2 -- Indentation width
opt.tabstop = 2 -- Tab character width
opt.softtabstop = 2 -- Spaces per tab during editing
opt.backspace = 'indent,eol,start' -- Allow backspace in insert mode

-- Search
opt.hlsearch = true -- Highlight search results
opt.ignorecase = true -- Ignore case in searches
opt.incsearch = true -- Jumping to matches while typing
opt.smartcase = true -- Enable smart case search behavior
opt.inccommand = 'split' -- Live substitution preview
opt.grepprg = 'rg --vimgrep --smart-case' -- Use ripgrep for :grep
opt.grepformat = '%f:%l:%c:%m' -- format

-- Folding
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.foldcolumn = '1'
opt.fillchars = {
  fold = ' ',
  foldopen = '',
  foldsep = ' ',
  foldclose = '',
}

-- Clipboard
opt.clipboard = 'unnamedplus' -- Use system clipboard

-- Mouse
opt.mouse = 'a' -- Enable mouse in all modes

-- Splitting
opt.splitbelow = true -- Split horizontally below
opt.splitright = true -- Split vertically to the right
opt.switchbuf = 'useopen' -- Reuse open windows when switching buffers

-- Performance
opt.updatetime = 250 -- Faster completion and diagnostics
opt.timeoutlen = 400 -- Faster mapped sequence completion

-- Scroll Behavior
opt.scrolloff = 4 -- Lines above/below cursor when scrolling
opt.sidescrolloff = 8 -- Columns left/right of cursor when side scrolling
opt.whichwrap = 'bs<>[]hl' -- Allow cursor movement across lines

-- Completion
opt.completeopt = { 'menu', 'menuone', 'noselect' } -- Better completion experience
opt.shortmess:append('c') -- Reduce completion messages
opt.iskeyword:append('-') -- Hyphen treated as part of word

-- Backup & Undo
opt.swapfile = false -- Disable swap files
opt.backup = false -- Disable backup files
opt.writebackup = false -- Disable backup before overwriting files
opt.undofile = true -- Enable persistent undo history

-- Miscellaneous
opt.hidden = true -- Allow switching buffers without saving
opt.runtimepath:remove('/usr/share/vim/vimfiles') -- Prevent conflicts with Vim plugins
opt.wildmenu = true -- Enhanced command-line completion
opt.showcmd = true -- Show partial command in command line
opt.showmode = false -- Display current mode in status line done by lualine
opt.showmatch = true -- Highlight matching brackets
opt.list = true -- Show invisible characters
opt.listchars = {
  tab = '» ',
  trail = '·',
  nbsp = '␣',
}
