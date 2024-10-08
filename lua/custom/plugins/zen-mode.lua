return {
  'folke/zen-mode.nvim',
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    window = {
      width = 320,
      -- options = {
      -- signcolumn = 'no',      -- disable signcolumn
      -- number = false,         -- disable number column
      -- relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
      -- },
    },
    plugins = {
      -- disable some global vim options (vim.o...)
      -- comment the lines to not apply the options
      options = {
        enabled = true,
        -- unforuntately, this won't work because we're using the lualine plugin and not the
        -- builtin Neovim statusline
        -- statusline will be shown only if 'laststatus' == 3
        -- laststatus = 3,
      },
      tmux = { enabled = true }, -- disables the tmux statusline
      wezterm = {
        enabled = true,
        -- can be either an absolute font size or the number of incremental steps
        font = '+8', -- (10% increase per step)
      },
    },
    -- on_open = function(win)
    --   lualine.hide()
    --   vim.o.statusline = ''
    -- end,
    -- on_close = function()
    --   lualine.hide { unhide = true }
    -- end,
  },
  config = function()
    vim.keymap.set('n', '<leader>z', '<cmd>ZenMode<CR>', { desc = '[Z]enMode' })
  end,
}
