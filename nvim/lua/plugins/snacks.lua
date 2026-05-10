return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    keys = {
      -- Find
      {
        '<leader><space>',
        function()
          Snacks.picker.smart()
        end,
        desc = 'Smart Find Files',
      },
      {
        '<leader>ff',
        function()
          Snacks.picker.files()
        end,
        desc = 'Find Files',
      },
      {
        '<leader>fb',
        function()
          Snacks.picker.buffers()
        end,
        desc = 'Buffers',
      },
      {
        '<leader>fp',
        function()
          Snacks.picker.projects()
        end,
        desc = 'Projects',
      },
      {
        '<leader>fr',
        function()
          Snacks.picker.recent()
        end,
        desc = 'Recent',
      },
      {
        '<leader>fc',
        function()
          Snacks.picker.files({ cwd = vim.fn.stdpath('config') })
        end,
        desc = 'Find Config File',
      },

      -- Grep
      {
        '<leader>sg',
        function()
          Snacks.picker.grep()
        end,
        desc = 'Find text',
      },
      {
        '<leader>sw',
        function()
          Snacks.picker.grep_word()
        end,
        desc = 'Visual selection or word',
        mode = { 'n', 'x' },
      },

      -- Search
      {
        '<leader>sb',
        function()
          Snacks.picker.lines()
        end,
        desc = 'Buffer Lines',
      },
      {
        '<leader>sh',
        function()
          Snacks.picker.help()
        end,
        desc = 'Find help',
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
          Snacks.picker.command_history()
        end,
        desc = 'Command History',
      },
      {
        '<leader>sC',
        function()
          Snacks.picker.commands()
        end,
        desc = 'Commands',
      },
      {
        '<leader>s"',
        function()
          Snacks.picker.registers()
        end,
        desc = 'Registers',
      },
      {
        '<leader>s/',
        function()
          Snacks.picker.search_history()
        end,
        desc = 'Search History',
      },
      {
        '<leader>sa',
        function()
          Snacks.picker.autocmds()
        end,
        desc = 'Autocmds',
      },
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
        '<leader>sq',
        function()
          Snacks.picker.qflist()
        end,
        desc = 'Quickfix List',
      },
      {
        '<leader>sl',
        function()
          Snacks.picker.loclist()
        end,
        desc = 'Location List',
      },
      {
        '<leader>sm',
        function()
          Snacks.picker.marks()
        end,
        desc = 'Marks',
      },

      -- LSP
      {
        '<leader>ss',
        function()
          Snacks.picker.lsp_symbols()
        end,
        desc = 'LSP Symbols',
      },
      {
        '<leader>sS',
        function()
          Snacks.picker.lsp_workspace_symbols()
        end,
        desc = 'LSP Workspace Symbols',
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
