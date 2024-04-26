return {
  -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  opts = {},
  config = function()
    -- document existing key chains
    require('which-key').register {
      ['<leader>c'] = {
        name = '[C]ode',
        _ = 'which_key_ignore',
      },
      ['<leader>d'] = {
        name = '[D]ashboard',
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
      -- ['<leader>t'] = {
      --   name = '[T]oggle',
      --   _ = 'which_key_ignore',
      -- },
      -- ['<leader>w'] = {
      --     name = '[W]orkspace',
      --     _ = 'which_key_ignore'
      -- }
      ['<leader><leader>'] = {
        name = 'Hop',
        _ = 'which_key_ignore',
      },
      -- ['<leader>x'] = {
      --   name = 'Close current buffer',
      --   _ = 'which_key_ignore',
      -- },
      ['<leader>z'] = {
        name = '[Z]enMode',
        _ = 'which_key_ignore',
      },
    }
    -- register which-key VISUAL mode
    -- required for visual <leader>hs (hunk stage) to work
    require('which-key').register({
      ['<leader>'] = {
        name = 'VISUAL <leader>',
      },
      ['<leader><leader>'] = { 'Hop' },
      ['<leader>g'] = { '[G]it' },
      -- ['<leader>h'] = { 'Git [H]unk' },
    }, {
      mode = 'v',
    })
  end,
}