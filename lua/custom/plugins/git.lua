return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',  -- required
    'sindrets/diffview.nvim', -- optional - Diff integration

    -- Only one of these is needed, not both.
    'nvim-telescope/telescope.nvim', -- optional
  },
  keys = {
    { '<leader>gn', '<CMD>Neogit<CR>', desc = '[N]eogit open' },
    { '<leader>gg', '<CMD>Neogit<CR>', desc = '[G]UI - Neogit ' },
  },
  config = true,
}
