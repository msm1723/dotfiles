return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    keys = {
      -- Files / search
      {
        '<leader>ff',
        function()
          Snacks.picker.files()
        end,
        desc = 'Find files',
      },
      {
        '<leader>fg',
        function()
          Snacks.picker.grep()
        end,
        desc = 'Find text',
      },
      {
        '<leader>fb',
        function()
          Snacks.picker.buffers()
        end,
        desc = 'Find buffers',
      },
      {
        '<leader>fr',
        function()
          Snacks.picker.recent()
        end,
        desc = 'Recent files',
      },
      {
        '<leader>fh',
        function()
          Snacks.picker.help()
        end,
        desc = 'Find help',
      },
      {
        '<leader>fc',
        function()
          Snacks.picker.files({
            cwd = vim.fn.stdpath('config'),
          })
        end,
        desc = 'Find config files',
      },

      -- Useful LSP/search pickers
      {
        '<leader>sd',
        function()
          Snacks.picker.diagnostics()
        end,
        desc = 'Search diagnostics',
      },
      {
        '<leader>sD',
        function()
          Snacks.picker.diagnostics_buffer()
        end,
        desc = 'Search buffer diagnostics',
      },
      {
        '<leader>sk',
        function()
          Snacks.picker.keymaps()
        end,
        desc = 'Search keymaps',
      },
      {
        '<leader>sc',
        function()
          Snacks.picker.commands()
        end,
        desc = 'Search commands',
      },
    },
    ---@type snacks.Config
    opts = {
      dashboard = {
        enabled = true,
        width = 60,
        row = nil,
        col = nil,
        pane_gap = 4,

        preset = {
          pick = nil,
          header = [[
     ███╗  ██╗██╗   ██╗██╗███╗   ███╗
     ████╗ ██║██║   ██║██║████╗ ████║
     ██╔██╗██║╚██╗ ██╔╝██║██╔████╔██║
     ██║╚████║ ╚████╔╝ ██║██║╚██╔╝██║
     ╚═╝ ╚═══╝  ╚═══╝  ╚═╝╚═╝ ╚═╝ ╚═╝
          ]],
          keys = {
            {
              icon = ' ',
              key = 'f',
              desc = 'Find file',
              action = function()
                Snacks.picker.files()
              end,
            },
            {
              icon = ' ',
              key = 'g',
              desc = 'Find text',
              action = function()
                Snacks.picker.grep()
              end,
            },
            {
              icon = ' ',
              key = 'r',
              desc = 'Recent files',
              action = function()
                Snacks.picker.recent()
              end,
            },
            {
              icon = ' ',
              key = 'c',
              desc = 'Open config',
              action = function()
                Snacks.picker.files({
                  cwd = vim.fn.stdpath('config'),
                })
              end,
            },
            {
              icon = ' ',
              key = 'y',
              desc = 'Yazi cwd',
              action = ':Yazi cwd',
            },
            {
              icon = '󰒲 ',
              key = 'l',
              desc = 'Lazy',
              action = ':Lazy',
              enabled = package.loaded.lazy ~= nil,
            },
            {
              icon = '󱌣 ',
              key = 'm',
              desc = 'Mason',
              action = ':Mason',
            },
            {
              icon = '󰗡 ',
              key = 'h',
              desc = 'Health',
              action = ':checkhealth',
            },
            {
              icon = ' ',
              key = 'n',
              desc = 'New file',
              action = ':ene | startinsert',
            },
            {
              icon = ' ',
              key = 'q',
              desc = 'Quit',
              action = ':qa',
            },
          },
        },

        sections = {
          {
            section = 'header',
            padding = 1,
          },
          {
            section = 'startup',
            padding = 1,
          },
          {
            icon = ' ',
            title = 'Actions',
            section = 'keys',
            indent = 2,
            padding = 1,
          },
          {
            icon = ' ',
            title = 'Recent Files',
            section = 'recent_files',
            indent = 2,
            padding = 1,
          },
          {
            icon = ' ',
            title = 'Projects',
            section = 'projects',
            indent = 2,
            padding = 1,
          },
        },
      },

      bigfile = {
        enabled = true,
      },

      quickfile = {
        enabled = true,
      },

      input = {
        enabled = true,
      },

      indent = {
        enabled = true,
      },

      picker = {
        enabled = true,
      },
    },
  },
}
