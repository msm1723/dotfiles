return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = {
      'williamboman/mason.nvim',
    },
    opts = {
      ensure_installed = {
        'stylua',
        'shfmt',
        'prettier',
        'debugpy',
        'codelldb',
      },
    },
  },
}
