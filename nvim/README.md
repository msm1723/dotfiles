# Neovim Configuration

Modern Neovim configuration focused on:

- Python / pytest automation work
- Rust learning and development
- VS Code Neovim integration
- Portable setup across MacBooks
- Clean separation between LSP, formatting, completion, testing, debugging, and UI

This config intentionally avoids a full Neovim distribution such as LazyVim. It uses `lazy.nvim` only as the plugin manager.

---

## Directory Structure

```text
~/.config/nvim/
├── init.lua
├── lazy-lock.json
├── stylua.toml
└── lua/
    ├── config/
    │   └── lazy.lua
    ├── core/
    │   ├── autocmds.lua
    │   ├── keymaps.lua
    │   ├── lsp.lua
    │   └── options.lua
    ├── plugins/
    │   ├── ansi.lua
    │   ├── colorscheme.lua
    │   ├── completion.lua
    │   ├── debugging.lua
    │   ├── editor.lua
    │   ├── formatting.lua
    │   ├── init.lua
    │   ├── lsp.lua
    │   ├── rust.lua
    │   ├── telescope.lua
    │   ├── testing.lua
    │   ├── tools.lua
    │   ├── treesitter.lua
    │   ├── ui.lua
    │   └── yazi.lua
    └── vscode_config/
        └── keymaps.lua
```

---

## High-Level Mental Model

```text
init.lua
  entry point

core/
  pure Neovim behavior

config/
  plugin manager bootstrap/config

plugins/
  standalone Neovim plugins

vscode_config/
  VS Code Neovim-only mappings
```

Important separation:

```text
LSP          -> understands code
Formatting   -> formats code
Completion   -> completes code
Testing      -> runs tests
Debugging    -> breakpoints and stepping
Tools        -> installs external CLI tools
Rust         -> handled separately through rustup + rustaceanvim
```

---

# Entry Point

## `init.lua`

Main Neovim entrypoint.

Responsibilities:

- Load common editor options
- Load common keymaps
- Detect VS Code Neovim mode
- Load VS Code-only keymaps when running inside VS Code
- Stop early inside VS Code so standalone plugins are not loaded
- Load standalone Neovim autocmds, LSP keymaps, and plugins

Conceptual flow:

```lua
require('core.options')
require('core.keymaps')

if vim.g.vscode then
  require('vscode_config.keymaps')
  return
end

require('core.autocmds')
require('core.lsp')
require('config.lazy')
```

---

# Core Configuration

## `lua/core/options.lua`

Basic Neovim options.

Contains settings such as:

- Leader key
- Relative line numbers
- Tabs/spaces behavior
- Search behavior
- Split direction
- Clipboard integration
- Cursorline
- Sign column
- `termguicolors`
- Disabled unused providers

Example responsibilities:

```text
mapleader
tabstop / shiftwidth / expandtab
number / relativenumber
clipboard
termguicolors
disabled node/perl/ruby providers
```

Current indentation philosophy:

```text
global default -> 2 spaces
Python         -> 4 spaces via FileType autocmd
Lua            -> 2 spaces via stylua.toml
Rust           -> rustfmt decides
```

---

## `lua/core/keymaps.lua`

General keymaps that do not depend on plugins.

Examples:

```text
<Esc>       clear search highlight
<leader>w  save file
<leader>q  quit window
<C-h/j/k/l> window navigation
<leader>bn next buffer
<leader>bN previous buffer
<leader>bd delete buffer
```

These mappings are intentionally simple and always available.

---

## `lua/core/autocmds.lua`

General autocmds.

Contains behavior such as:

- Highlight yanked text
- Remove trailing whitespace on save
- Set `*.log` and `*.logs` files to `filetype=log`
- Use 4-space indentation for Python files

Important log-related behavior:

```lua
pattern = {
  '*.log',
  '*.logs',
}
```

This makes ANSI log rendering work automatically with `ansi.nvim`.

---

## `lua/core/lsp.lua`

Generic LSP keymaps attached through the `LspAttach` autocmd.

These mappings are buffer-local and only exist when an LSP server is attached.

Examples:

```text
K            hover
gd           go to definition
gD           go to declaration
gi           go to implementation
gr           references
<leader>rn   rename symbol
<leader>ca   code action
[d           previous diagnostic
]d           next diagnostic
<leader>de   show diagnostic
<leader>dq   diagnostics quickfix
```

This file does **not** configure language servers. It only defines general LSP behavior.

---

# Plugin Manager

## `lua/config/lazy.lua`

Bootstraps and configures `lazy.nvim`.

Responsibilities:

- Clone `lazy.nvim` if missing
- Add it to runtime path
- Load all plugin specs from `lua/plugins/`
- Configure update checker and install behavior

`lazy.nvim` is used only as a plugin manager, not as a full distribution.

---

# Plugin Specifications

## `lua/plugins/init.lua`

Empty or minimal plugin-spec entry file.

It exists because `lazy.nvim` imports the whole `plugins` directory.

---

## `lua/plugins/colorscheme.lua`

Contains colorscheme configuration.

Plugin:

```text
rebelot/kanagawa.nvim
```

Purpose:

- Main colorscheme
- Provides the visual base for the whole editor

Configured theme:

```text
kanagawa wave
```

---

## `lua/plugins/editor.lua`

Small editor-enhancement plugins.

Plugins:

```text
tpope/vim-sleuth
folke/which-key.nvim
windwp/nvim-autopairs
folke/todo-comments.nvim
catgoose/nvim-colorizer.lua
```

### `vim-sleuth`

Automatically detects indentation settings from existing files.

Useful when working in projects with different indentation styles.

### `which-key.nvim`

Shows available keybindings after pressing `<leader>`.

Very useful while learning the config.

### `nvim-autopairs`

Automatically closes brackets, quotes, and parentheses.

Example:

```text
( -> ()
" -> ""
```

### `todo-comments.nvim`

Highlights comments like:

```text
TODO
FIXME
NOTE
HACK
```

### `nvim-colorizer.lua`

Highlights color values in files.

Examples:

```text
#ff0000
rgb(255, 0, 0)
```

---

## `lua/plugins/treesitter.lua`

Modern Treesitter setup using the `main` branch of `nvim-treesitter`.

Plugin:

```text
nvim-treesitter/nvim-treesitter
```

Purpose:

- Better syntax highlighting
- Treesitter-aware indentation
- Parser installation

Uses the modern API:

```lua
require('nvim-treesitter').setup(...)
require('nvim-treesitter').install(...)
vim.treesitter.start()
```

Does **not** use the old API:

```lua
require('nvim-treesitter.configs').setup(...)
```

Languages installed include:

```text
bash
dockerfile
gitignore
json
lua
luadoc
make
markdown
markdown_inline
python
rust
toml
vim
vimdoc
yaml
```

---

## `lua/plugins/telescope.lua`

Fuzzy finder and project search.

Plugins:

```text
nvim-telescope/telescope.nvim
nvim-telescope/telescope-fzf-native.nvim
nvim-lua/plenary.nvim
```

Purpose:

- Find files
- Search text in project
- Search buffers
- Search help
- Open recent files

Main keybindings:

```text
<leader>ff  find files
<leader>fg  live grep / find text
<leader>fb  find buffers
<leader>fh  find help
<leader>fr  recent files
```

External recommended tools:

```text
ripgrep
fd
```

Install on macOS:

```bash
brew install ripgrep fd
```

---

## `lua/plugins/lsp.lua`

General non-Rust LSP setup.

Plugins:

```text
williamboman/mason.nvim
williamboman/mason-lspconfig.nvim
neovim/nvim-lspconfig
```

Purpose:

- Install language servers through Mason
- Configure LSP servers through modern Neovim APIs
- Explicitly enable only selected servers

Uses modern Neovim LSP API:

```lua
vim.lsp.config(...)
vim.lsp.enable(...)
```

Important setting:

```lua
automatic_enable = false
```

This prevents Mason from automatically starting unexpected servers.

Configured servers:

```text
lua_ls        Lua
basedpyright  Python type checking
ruff          Python linting/fixes/diagnostics
bashls        Bash
jsonls        JSON
yamlls        YAML
```

Rust is intentionally **not** configured here.

Rust is handled in:

```text
plugins/rust.lua
```

---

## `lua/plugins/rust.lua`

Rust-specific integration.

Plugin:

```text
mrcjkb/rustaceanvim
```

Purpose:

- Rust LSP integration
- Rust-specific commands
- Rust Analyzer setup
- Rust hover actions
- Rust runnables
- Rust diagnostics helpers

Rust tooling is installed through `rustup`, not Mason:

```text
cargo
rustc
rust-analyzer
rustfmt
clippy
rust-src
```

Rust keybindings:

```text
<leader>rh  Rust hover actions
<leader>ra  Rust code action
<leader>rr  Rust runnables
<leader>re  explain Rust error
<leader>rd  render Rust diagnostic
<leader>rc  open Cargo.toml
<leader>ro  open Rust docs
```

Important rule:

```text
Do not manually configure rust_analyzer in plugins/lsp.lua.
rustaceanvim owns Rust LSP setup.
```

---

## `lua/plugins/tools.lua`

Installs external command-line tools through Mason.

Plugin:

```text
WhoIsSethDaniel/mason-tool-installer.nvim
```

Purpose:

- Ensure external non-LSP tools are installed
- Keep setup portable across machines

Current tools:

```text
stylua    Lua formatter
shfmt     shell formatter
prettier  JSON/YAML/Markdown formatter
debugpy   Python debug adapter
codelldb  Rust / native debug adapter
```

This file is for tools that are not normal LSP server configs.

---

## `lua/plugins/formatting.lua`

Formatting setup.

Plugin:

```text
stevearc/conform.nvim
```

Purpose:

- Format files manually
- Format files on save
- Connect formatters to filetypes

Main keybinding:

```text
<leader>cf  format file
```

Configured formatters:

```text
lua       stylua
python    ruff_format
rust      rustfmt
sh/bash   shfmt
zsh       shfmt
json      prettier
yaml      prettier
markdown  prettier
```

Important distinction:

```text
LSP is not responsible for formatting by default.
Conform owns formatting.
```

---

## `lua/plugins/completion.lua`

Completion setup.

Plugins:

```text
saghen/blink.cmp
rafamadriz/friendly-snippets
```

Purpose:

- LSP completion
- Path completion
- Buffer word completion
- Snippet completion
- Signature help
- Ghost text
- Documentation popup

Completion sources:

```text
lsp
path
snippets
buffer
```

Uses stable v1 series:

```lua
version = '1.*'
```

---

## `lua/plugins/testing.lua`

Test runner setup.

Plugins:

```text
nvim-neotest/neotest
nvim-neotest/neotest-python
nvim-neotest/nvim-nio
nvim-lua/plenary.nvim
antoinemadec/FixCursorHold.nvim
```

Purpose:

- Run nearest pytest test
- Run current test file
- Show test summary
- Show test output
- Watch current test file
- Debug nearest test through DAP

Keybindings:

```text
<leader>tt  run nearest test
<leader>tf  run current test file
<leader>td  debug nearest test
<leader>ts  toggle test summary
<leader>to  open test output
<leader>tO  toggle output panel
<leader>tw  toggle watch current file
<leader>tS  stop test run
```

Configured runner:

```text
pytest
```

Project dependency:

```text
pytest should be installed in the project virtual environment.
```

---

## `lua/plugins/debugging.lua`

Debugger setup.

Plugins:

```text
mfussenegger/nvim-dap
rcarriga/nvim-dap-ui
theHamsta/nvim-dap-virtual-text
mfussenegger/nvim-dap-python
nvim-neotest/nvim-nio
```

Purpose:

- Set breakpoints
- Start/continue debugging
- Step over/into/out
- Open debug REPL
- Show debug UI
- Display inline variable values
- Debug Python files/tests
- Support Rust/native debugging through codelldb

Keybindings:

```text
<leader>db  toggle breakpoint
<leader>dB  set conditional breakpoint
<leader>dc  continue/start
<leader>do  step over
<leader>di  step into
<leader>dO  step out
<leader>dr  open debug REPL
<leader>du  toggle debug UI
<leader>dx  terminate debug session
```

Debug adapters:

```text
debugpy   Python
codelldb  Rust/native
```

---

## `lua/plugins/ui.lua`

Visual polish.

Plugins:

```text
nvim-lualine/lualine.nvim
akinsho/bufferline.nvim
nvim-tree/nvim-web-devicons
```

### `lualine.nvim`

Statusline plugin.

Shows:

```text
mode
git branch
diff
diagnostics
filename
encoding
filetype
progress
cursor location
```

### `bufferline.nvim`

Visual buffer tabs at the top.

Keybindings:

```text
<S-h>       previous buffer
<S-l>       next buffer
<leader>bp  pin buffer
<leader>bP  close unpinned buffers
<leader>bo  close other buffers
<leader>br  close buffers to right
<leader>bl  close buffers to left
```

---

## `lua/plugins/yazi.lua`

Yazi terminal file manager integration.

Plugin:

```text
mikavilpas/yazi.nvim
```

External dependency:

```text
yazi
```

Install on macOS:

```bash
brew install yazi
```

Purpose:

- Open Yazi inside Neovim
- Browse/manage files
- Open files in current window/splits/tabs
- Use a full terminal file manager without leaving Neovim

Keybindings:

```text
<leader>-   open Yazi at current file
<leader>cw  open Yazi in current working directory
<C-Up>      resume Yazi session
```

Yazi is used instead of Neo-tree.

Navigation philosophy:

```text
Telescope   -> quickly jump to files/text
Yazi        -> manage files
Bufferline  -> switch open buffers
```

---

## `lua/plugins/ansi.lua`

ANSI log rendering.

Plugin:

```text
0xferrous/ansi.nvim
```

Purpose:

- Render ANSI escape sequences in log files
- Useful for pytest logs collected with `--color=yes`
- Conceal raw ANSI escape codes and show actual colors

Keybinding:

```text
<leader>ua  toggle ANSI colors
```

Commands:

```text
:AnsiEnable
:AnsiDisable
:AnsiToggle
```

Configured for filetypes:

```text
log
ansi
```

Log files are assigned `filetype=log` in `core/autocmds.lua`.

---

# VS Code Neovim

## `lua/vscode_config/keymaps.lua`

Keymaps used only when running inside VS Code through:

```text
asvetliakov.vscode-neovim
```

This file is loaded only when:

```lua
vim.g.vscode
```

is true.

Purpose:

- Provide Vim motions inside VS Code
- Reuse some leader-key muscle memory
- Call VS Code actions directly

Examples:

```text
<leader>w   save file
<leader>q   close active editor
<leader>ff  quick open
<leader>fg  find in files
<leader>e   explorer
<leader>p   command palette
<leader>rn  rename symbol
<leader>ca  code action
gd           go to definition
gr           go to references
```

Important:

```text
Standalone Neovim plugins are not loaded inside VS Code.
```

This avoids conflicts and keeps VS Code responsible for:

```text
Dev Containers
VS Code LSP
VS Code debugging
VS Code file explorer
VS Code extensions
```

---

# Root Configuration Files

## `stylua.toml`

StyLua formatter configuration for Lua files.

Recommended content:

```toml
column_width = 160
line_endings = "Unix"
indent_type = "Spaces"
indent_width = 2
quote_style = "AutoPreferSingle"
```

Purpose:

- Keep Lua formatting consistent
- Use spaces instead of tabs
- Use 2-space indentation for Neovim Lua config

---

## `lazy-lock.json`

Generated by `lazy.nvim`.

Purpose:

- Lock plugin versions/commits
- Improve reproducibility across machines

This file should be committed to Git.

---

# External Dependencies

Recommended system tools on macOS:

```bash
brew install neovim git ripgrep fd tree-sitter yazi
xcode-select --install
```

Rust setup:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rust-analyzer rustfmt clippy rust-src
```

Formatter/debug tools are installed through Mason:

```text
stylua
shfmt
prettier
debugpy
codelldb
```

LSP servers are installed through Mason:

```text
lua-language-server
basedpyright
ruff
bash-language-server
json-lsp
yaml-language-server
```

---

# Useful Health Checks

Run these after changes:

```vim
:checkhealth vim.deprecated
:checkhealth vim.lsp
:checkhealth rustaceanvim
:checkhealth vim.provider
:checkhealth nvim-treesitter
:checkhealth yazi
```

Useful plugin checks:

```vim
:Mason
:Lazy
:ConformInfo
```

Expected state:

```text
No deprecated API warnings
LSP health clean
Rustaceanvim health clean
Provider health clean
Formatting available for configured filetypes
```

---

# Daily Keybindings

Most useful everyday bindings:

```text
<leader>ff  find files
<leader>fg  find text
<leader>fb  find buffers
<leader>fr  recent files
<leader>-   open Yazi at current file
<leader>cw  open Yazi in cwd

<S-h>       previous buffer
<S-l>       next buffer

K            LSP hover
gd           go to definition
gr           references
<leader>rn   rename
<leader>ca   code action
<leader>cf   format file

<leader>tt  run nearest test
<leader>tf  run current test file
<leader>ts  toggle test summary

<leader>db  toggle breakpoint
<leader>dc  start/continue debug
<leader>du  toggle debug UI

<leader>ua  toggle ANSI colors
```

---

# Design Principles

This configuration follows these principles:

```text
Modern Neovim APIs first
Portable across MacBooks
No full Neovim distribution
Small focused plugin files
Clear ownership of responsibilities
No formatter/LSP/debugger mixing
VS Code mode isolated from standalone Neovim
```
