return {
  {
    'keaising/im-select.nvim',
    opts = {
      default_im_select = 'com.apple.keylayout.US',
      default_command = 'macism',

      set_default_events = {
        'InsertLeave',
        'CmdlineEnter',
        'CmdlineLeave',
      },

      set_previous_events = {
        'InsertEnter',
      },
    },
  },
}
