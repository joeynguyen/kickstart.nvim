return {
  'nvim-neo-tree/neo-tree.nvim',
  version = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      window = {
        mappings = {
          ['Z'] = 'expand_all_nodes',
        },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every time
        },
      },
    }
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle left<CR>', {})
    vim.keymap.set('n', '<C-m>', ':Neotree buffers reveal float<CR>', {})
  end,
}
