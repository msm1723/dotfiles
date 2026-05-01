local languages = {
  'bash',
  'dockerfile',
  'gitignore',
  'json',
  'lua',
  'luadoc',
  'make',
  'markdown',
  'markdown_inline',
  'python',
  'rust',
  'toml',
  'vim',
  'vimdoc',
  'yaml',
}

local treesitter_filetypes = {
  'bash',
  'dockerfile',
  'gitignore',
  'json',
  'lua',
  'luadoc',
  'make',
  'markdown',
  'python',
  'rust',
  'toml',
  'vim',
  'vimdoc',
  'yaml',
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      local treesitter = require('nvim-treesitter')

      treesitter.setup({
        install_dir = vim.fn.stdpath('data') .. '/site',
      })

      treesitter.install(languages)

      vim.api.nvim_create_autocmd('FileType', {
        pattern = treesitter_filetypes,
        desc = 'Enable Treesitter highlighting',
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })

      vim.api.nvim_create_autocmd('FileType', {
        pattern = treesitter_filetypes,
        desc = 'Enable Treesitter indentation',
        callback = function()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
