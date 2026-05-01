require('core.options')
require('core.keymaps')

if vim.g.vscode then
  require('vscode_config.keymaps')
  return
end

require('core.autocmds')
require('core.lsp')
require('config.lazy')
