return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      options = {
        theme = 'kanagawa',
        globalstatus = true,
        component_separators = {
          left = '│',
          right = '│',
        },
        section_separators = {
          left = '',
          right = '',
        },
        disabled_filetypes = {
          statusline = {
            'neo-tree',
            'dashboard',
            'alpha',
            'lazy',
            'mason',
          },
        },
      },
      sections = {
        lualine_a = {
          'mode',
        },
        lualine_b = {
          'branch',
          'diff',
          'diagnostics',
        },
        lualine_c = {
          {
            'filename',
            path = 1,
          },
        },
        lualine_x = {
          'encoding',
          'fileformat',
          'filetype',
        },
        lualine_y = {
          'progress',
        },
        lualine_z = {
          'location',
        },
      },
      extensions = {
        'lazy',
        'mason',
        'neo-tree',
        'quickfix',
      },
    },
  },

  {
    'akinsho/bufferline.nvim',
    version = '*',
    event = 'VeryLazy',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      {
        '<S-h>',
        '<cmd>BufferLineCyclePrev<cr>',
        desc = 'Previous buffer',
      },
      {
        '<S-l>',
        '<cmd>BufferLineCycleNext<cr>',
        desc = 'Next buffer',
      },
      {
        '<leader>bp',
        '<cmd>BufferLineTogglePin<cr>',
        desc = 'Pin buffer',
      },
      {
        '<leader>bP',
        '<cmd>BufferLineGroupClose ungrouped<cr>',
        desc = 'Close unpinned buffers',
      },
      {
        '<leader>bo',
        '<cmd>BufferLineCloseOthers<cr>',
        desc = 'Close other buffers',
      },
      {
        '<leader>br',
        '<cmd>BufferLineCloseRight<cr>',
        desc = 'Close buffers to right',
      },
      {
        '<leader>bl',
        '<cmd>BufferLineCloseLeft<cr>',
        desc = 'Close buffers to left',
      },
    },
    opts = {
      options = {
        mode = 'buffers',
        diagnostics = 'nvim_lsp',
        always_show_bufferline = false,
        separator_style = 'thin',
        show_buffer_close_icons = false,
        show_close_icon = false,
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Explorer',
            text_align = 'center',
            separator = true,
          },
        },
      },
    },
  },
}
