return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  dependencies = {
    'folke/noice.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {},
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'dracula',
        component_separators = '|',
        section_separators = '',
      },
      tabline = {
        -- lualine_a = { 'buffers' },
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {
          -- {
          --   -- Show last line of the last message (event=show_msg)
          --   require("noice").api.status.message.get_hl,
          --   cond = require("noice").api.status.message.has,
          -- },
          -- {
          --   -- Show Vim commands performed `showcmd`
          --   require("noice").api.status.command.get,
          --   cond = require("noice").api.status.command.has,
          --   color = { fg = "#ff9e64" },
          -- },
          {
            -- Show macros '@recording' messages in the statusline (showmode)
            require("noice").api.status.mode.get,
            cond = require("noice").api.status.mode.has,
            color = { fg = "#ff9e64" },
          },
          -- {
          --   -- Show search count messages
          --   require("noice").api.status.search.get,
          --   cond = require("noice").api.status.search.has,
          --   color = { fg = "#ff9e64" },
          -- },
        },
        lualine_x = { 'diagnostics', 'encoding', 'filetype' },
        lualine_y = {},
        lualine_z = { 'location' },
      },
      -- disable default statusline
      sections = {
        -- lualine_a = { 'mode' },
        -- lualine_b = { 'branch', 'diff', 'diagnostics' },
        -- lualine_c = { 'filename' },
        -- lualine_x = { 'encoding', 'fileformat', 'filetype' },
        -- lualine_y = { 'progress' },
        -- lualine_z = { 'location' },
      },
      -- hide statusline
      inactive_sections = {},
    }
  end,
}
