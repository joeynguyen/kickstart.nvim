return {
  'kaplanz/retrail.nvim',
  config = function()
    require('retrail').setup()
    vim.keymap.set('n', '<leader>ft', '<CMD>RetrailTrimWhitespace<CR>', { desc = '[T]rim Whitespace' })
  end,
}
