return {
  'johmsalas/text-case.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    require('textcase').setup {
      prefix = "<leader>t"
    }
    require('telescope').load_extension 'textcase'
    -- `cr` shortcut inspired by https://github.com/gregorias/coerce.nvim
    -- vim.api.nvim_set_keymap('n', 'cr', '<cmd>TextCaseOpenTelescope<CR>', { desc = 'TextCase [R]eplace' })
    -- vim.api.nvim_set_keymap('v', 'cr', '<cmd>TextCaseOpenTelescope<CR>', { desc = 'TextCase [R]eplace' })
    -- vim.api.nvim_set_keymap('n', 'ga.', '<cmd>TextCaseOpenTelescope<CR>', { desc = 'Telescope' })
    -- vim.api.nvim_set_keymap('v', 'ga.', '<cmd>TextCaseOpenTelescope<CR>', { desc = 'Telescope' })
    -- vim.api.nvim_set_keymap('n', 'gaa', '<cmd>TextCaseOpenTelescopeQuickChange<CR>', { desc = 'Telescope Quick Change' })
    -- vim.api.nvim_set_keymap('n', 'gai', '<cmd>TextCaseOpenTelescopeLSPChange<CR>', { desc = 'Telescope LSP Change' })
  end,
  keys = {
    -- 'ga', -- Default invocation prefix
    '<leader>t', -- Default invocation prefix
    -- { 'ga.', '<cmd>TextCaseOpenTelescope<CR>', mode = { 'n', 'x' }, desc = 'Telescope' },
  },
  cmd = {
    -- NOTE: The Subs command name can be customized via the option "substitude_command_name"
    'Subs',
    'TextCaseOpenTelescope',
    'TextCaseOpenTelescopeQuickChange',
    'TextCaseOpenTelescopeLSPChange',
    'TextCaseStartReplacingCommand',
  },
  -- If you want to use the interactive feature of the `Subs` command right away, text-case.nvim
  -- has to be loaded on startup. Otherwise, the interactive feature of the `Subs` will only be
  -- available after the first executing of it or after a keymap of text-case.nvim has been used.
  lazy = false,
}
