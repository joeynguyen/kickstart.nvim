return {
  -- EasyMotion replacement written in Lua for Neovim
  'smoka7/hop.nvim',
  version = '*',
  opts = {},
  config = function()
    require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
    local hop = require 'hop'
    local directions = require('hop.hint').HintDirection

    -- unbind default semicolon repeat navigation
    vim.keymap.set('', ';', '<nop>')
    vim.keymap.set('', ';f', function()
      hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true }
    end, { remap = true, desc = 'Hop forward to char at hint' })

    vim.keymap.set('', ';F', function()
      hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true }
    end, { remap = true, desc = 'Hop backward to char at hint' })

    vim.keymap.set('', ';t', function()
      hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }
    end, { remap = true, desc = 'Hop forward to char before hint' })

    vim.keymap.set('', ';T', function()
      hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }
    end, { remap = true, desc = 'Hop backward to char before hint' })

    vim.keymap.set('', ';w', '<cmd>HopWordAC<CR>', { desc = 'Hop word after cursor' })
    vim.keymap.set('', ';b', '<cmd>HopWordBC<CR>', { desc = 'Hop word before cursor' })
    vim.keymap.set('', ';j', '<cmd>HopLineStartAC<CR>', { desc = 'Hop line down' })
    vim.keymap.set('', ';k', '<cmd>HopLineStartBC<CR>', { desc = 'Hop line up' })
  end,
}
