return {
  'folke/zen-mode.nvim',
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    window = {
      width = 320,
    },
    plugins = {
      -- disable some global vim options (vim.o...)
      -- comment the lines to not apply the options
      options = {
        enabled = true,
      },
      tmux = { enabled = true }, -- disables the tmux statusline
      wezterm = {
        enabled = true,
        -- can be either an absolute font size or the number of incremental steps
        font = '+8', -- (10% increase per step)
      },
    },
  },
  config = function()
    vim.keymap.set('n', '<leader>z', '<cmd>ZenMode<CR>', { desc = '[Z]enMode' })
  end,
}
