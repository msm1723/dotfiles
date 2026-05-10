local keymap = vim.keymap.set

local function vscode_action(name)
  return function()
    require('vscode').action(name)
  end
end

keymap('n', '<leader>ww', vscode_action('workbench.action.files.save'), { desc = 'Save file' })
keymap('n', '<leader>qq', vscode_action('workbench.action.closeActiveEditor'), { desc = 'Close editor' })

keymap('n', '<leader>sf', vscode_action('workbench.action.quickOpen'), { desc = 'Find file' })
keymap('n', '<leader>sg', vscode_action('workbench.action.findInFiles'), { desc = 'Find in files' })

keymap('n', '<leader>e', vscode_action('workbench.view.explorer'), { desc = 'Explorer' })
keymap('n', '<leader>p', vscode_action('workbench.action.showCommands'), { desc = 'Command palette' })

keymap('n', '<leader>rn', vscode_action('editor.action.rename'), { desc = 'Rename symbol' })
keymap('n', '<leader>ca', vscode_action('editor.action.quickFix'), { desc = 'Code action' })
keymap('n', 'gd', vscode_action('editor.action.revealDefinition'), { desc = 'Go to definition' })
keymap('n', 'gr', vscode_action('editor.action.goToReferences'), { desc = 'Go to references' })
