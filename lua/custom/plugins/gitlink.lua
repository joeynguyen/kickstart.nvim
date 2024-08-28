return {
  'pabloariasal/webify.nvim',
  opts = {},
  config = function()
    vim.keymap.set('n', '<leader>gl', '<CMD>YankLineUrl +<CR>', {
      desc = 'Yank Git [L]ink',
    })
  end,
}
