-- Encoding
vim.opt.encoding = 'utf-8'               -- Internal Vim encoding
vim.opt.fileencoding = 'utf-8'           -- File encoding for saving/loading

-- UI
vim.opt.number = true                    -- Show line numbers
vim.opt.relativenumber = true            -- Relative line numbers
vim.opt.numberwidth = 4                  -- Width of the number column
vim.opt.cursorline = true                -- Highlight the current line
vim.opt.signcolumn = 'yes'               -- Always show the sign column
vim.opt.termguicolors = true             -- True color support
vim.opt.cmdheight = 1                    -- Height of command line area
vim.opt.showtabline = 2                  -- Always display tab line
vim.opt.pumheight = 10                   -- Popup menu height
vim.opt.title = true                     -- Set terminal window title
vim.opt.ruler = true                     -- Display cursor position at bottom
vim.opt.conceallevel = 0                 -- Display Markdown backticks clearly
vim.opt.guifont = "CaskaydiaCove Nerd Font:h14"

-- Editing Behavior
vim.opt.wrap = false                     -- Disable line wrap
vim.opt.linebreak = true                 -- Wrap lines at word boundary
vim.opt.autoindent = true                -- Auto-indent new lines
vim.opt.smartindent = true               -- Smart indentation
vim.opt.expandtab = true                 -- Convert tabs to spaces
vim.opt.shiftwidth = 4                   -- Indentation width
vim.opt.tabstop = 4                      -- Tab character width
vim.opt.softtabstop = 4                  -- Spaces per tab during editing
vim.opt.backspace = 'indent,eol,start'   -- Allow backspace in insert mode

-- Search
vim.opt.hlsearch = true                  -- Highlight search results
vim.opt.ignorecase = true                -- Ignore case in searches
vim.opt.smartcase = true                 -- Enable smart case search behavior
vim.opt.inccommand = 'split'             -- Live substitution preview

-- Clipboard
vim.opt.clipboard = 'unnamedplus'        -- Use system clipboard

-- Mouse
vim.opt.mouse = 'a'                      -- Enable mouse in all modes

-- Splitting
vim.opt.splitbelow = true                -- Split horizontally below
vim.opt.splitright = true                -- Split vertically to the right
vim.opt.switchbuf = 'useopen'            -- Reuse open windows when switching buffers

-- Performance
vim.opt.updatetime = 250                 -- Faster completion and diagnostics
vim.opt.timeoutlen = 500                 -- Faster mapped sequence completion

-- Scroll Behavior
vim.opt.scrolloff = 4                    -- Lines above/below cursor when scrolling
vim.opt.sidescrolloff = 8                -- Columns left/right of cursor when side scrolling
vim.opt.whichwrap = 'bs<>[]hl'           -- Allow cursor movement across lines

-- Completion
vim.opt.completeopt = 'menuone,noselect' -- Better completion experience
vim.opt.shortmess:append('c')            -- Reduce completion messages
vim.opt.iskeyword:append('-')            -- Hyphen treated as part of word

-- Backup & Undo
vim.opt.swapfile = false                 -- Disable swap files
vim.opt.backup = false                   -- Disable backup files
vim.opt.writebackup = false              -- Disable backup before overwriting files
vim.opt.undofile = true                  -- Enable persistent undo history

-- Formatting
vim.opt.formatoptions:remove({ 'c', 'r', 'o' }) -- Disable auto-comment continuation
vim.opt.breakindent = true                      -- Indent wrapped lines for readability

-- Miscellaneous
vim.opt.hidden = true                    -- Allow switching buffers without saving
vim.opt.bufhidden = 'hide'               -- Keep buffers loaded but hidden
vim.opt.runtimepath:remove('/usr/share/vim/vimfiles') -- Prevent conflicts with Vim plugins
vim.opt.syntax = 'ON'                    -- Enable syntax highlighting explicitly
vim.opt.wildmenu = true                  -- Enhanced command-line completion
vim.opt.showcmd = true                   -- Show partial command in command line
vim.opt.showmode = true                  -- Display current mode in status line
vim.opt.showmatch = true                 -- Highlight matching brackets

