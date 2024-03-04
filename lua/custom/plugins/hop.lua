return {
  -- EasyMotion replacement written in Lua for Neovim
  'smoka7/hop.nvim',
  version = '*',
  opts = {},
  config = function()
    require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
    local hop = require 'hop'
    local directions = require('hop.hint').HintDirection

    vim.keymap.set('', '<leader><leader>f', function()
      hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true }
    end, { remap = true, desc = 'Hop forward to char at hint' })

    vim.keymap.set('', '<leader><leader>F', function()
      hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true }
    end, { remap = true, desc = 'Hop backward to char at hint' })

    vim.keymap.set('', '<leader><leader>t', function()
      hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }
    end, { remap = true, desc = 'Hop forward to char before hint' })

    vim.keymap.set('', '<leader><leader>T', function()
      hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }
    end, { remap = true, desc = 'Hop backward to char before hint' })

    vim.keymap.set('', '<leader><leader>w', '<cmd>HopWordAC<CR>', { desc = 'Hop word after cursor' })
    vim.keymap.set('', '<leader><leader>b', '<cmd>HopWordBC<CR>', { desc = 'Hop word before cursor' })
    vim.keymap.set('', '<leader><leader>j', '<cmd>HopLineStartAC<CR>', { desc = 'Hop line down' })
    vim.keymap.set('', '<leader><leader>k', '<cmd>HopLineStartBC<CR>', { desc = 'Hop line up' })

    -- vim.keymap.set("n", "<leader><leader>b", function()
    --     hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })
    -- end, { remap = true })
  end,
}
