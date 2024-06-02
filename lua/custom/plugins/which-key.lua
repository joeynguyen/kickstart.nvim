return {
  -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  opts = {},
  config = function()
    -- https://github.com/folke/which-key.nvim?tab=readme-ov-file#-operators-motions-and-text-objects
    -- disable visual operator
    local presets = require 'which-key.plugins.presets'
    presets.operators['v'] = nil

    -- document existing key chains
    local wk = require 'which-key'
    wk.register {
      [';'] = {
        name = 'Fast Navigation',
      },
      [','] = {
        name = 'editor',
      },
      ['<leader>c'] = {
        name = '[C]ode',
        _ = 'which_key_ignore',
      },
      ['<leader>D'] = {
        name = '[D]iagnostics',
        _ = 'which_key_ignore',
      },
      ['<leader>f'] = {
        name = '[F]ile',
        _ = 'which_key_ignore',
      },
      ['<leader>g'] = {
        name = '[G]it',
        _ = 'which_key_ignore',
      },
      -- ['<leader>h'] = {
      --     name = 'Git [H]unk',
      --     _ = 'which_key_ignore',
      -- },
      ['<leader>r'] = {
        name = '[R]ename',
        _ = 'which_key_ignore',
      },
      ['<leader>s'] = {
        name = '[S]earch',
        _ = 'which_key_ignore',
      },
      ['<leader>t'] = {
        name = '[T]rouble',
        _ = 'which_key_ignore',
      },
      -- ['<leader>t'] = {
      --   name = '[T]oggle',
      --   _ = 'which_key_ignore',
      -- },
      -- ['<leader>w'] = {
      --     name = '[W]orkspace',
      --     _ = 'which_key_ignore'
      -- }
      -- ['<leader>x'] = {
      --   name = 'Close current buffer',
      --   _ = 'which_key_ignore',
      -- },
    }
    -- register which-key VISUAL mode
    -- required for visual <leader>hs (hunk stage) to work
    wk.register({
      ['<leader>'] = {
        name = 'VISUAL <leader>',
      },
      ['<leader>g'] = { '[G]it' },
      -- ['<leader>h'] = { 'Git [H]unk' },
    }, {
      mode = 'v',
    })
  end,
}

--[[

all of the mappings below are equivalent

method 2:

wk.register({
  ["<leader>"] = {
    f = {
      name = "+file",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      n = { "<cmd>enew<cr>", "New File" },
    },
  },
})

method 3:
wk.register({
  ["<leader>f"] = {
    name = "+file",
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    n = { "<cmd>enew<cr>", "New File" },
  },
})

method 4:
wk.register({
  ["<leader>f"] = { name = "+file" },
  ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find File" },
  ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
  ["<leader>fn"] = { "<cmd>enew<cr>", "New File" },
})

--]]
