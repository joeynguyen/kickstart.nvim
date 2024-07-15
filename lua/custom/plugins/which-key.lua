return {
  -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  dependencies = { 'echasnovski/mini.nvim', version = false },
  opts = {},
  config = function()
    -- https://github.com/folke/which-key.nvim?tab=readme-ov-file#-operators-motions-and-text-objects
    -- disable visual operator
    local presets = require 'which-key.plugins.presets'
    presets.operators['v'] = nil

    -- document existing key chains
    local wk = require 'which-key'
    wk.add {
      -- NORMAL mode
      { ',',          group = 'Editor' },
      { ';',          group = 'Fast Navigation' },
      { '<Del>',      group = 'Fast Navigation' },
      { '<leader>D',  group = '[D]iagnostics' },
      { '<leader>D_', hidden = true },
      { '<leader>c',  group = '[C]ode' },
      { '<leader>c_', hidden = true },
      { '<leader>f',  group = '[F]ile' },
      { '<leader>f_', hidden = true },
      { '<leader>g',  group = '[G]it' },
      { '<leader>g_', hidden = true },
      { '<leader>r',  group = '[R]ename' },
      { '<leader>r_', hidden = true },
      { '<leader>s',  group = '[S]earch' },
      { '<leader>s_', hidden = true },
      { '<leader>t',  group = '[T]rouble' },
      { '<leader>t_', hidden = true },

      -- VISUAL mode
      { '<leader>',   group = 'VISUAL <leader>', mode = 'v' },
      { '<leader>g',  desc = '[G]it',            mode = 'v' },
    }
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
