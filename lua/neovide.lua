vim.g.neovide_input_macos_option_key_is_meta = 'only_left'
vim.g.neovide_fullscreen = true

if vim.g.neovide then
  vim.keymap.set('n', '<M-h>', '<cmd>wincmd h<CR>', {})
  vim.keymap.set('n', '<M-j>', '<cmd>wincmd j<CR>', {})
  vim.keymap.set('n', '<M-k>', '<cmd>wincmd k<CR>', {})
  vim.keymap.set('n', '<M-l>', '<cmd>wincmd l<CR>', {})

  vim.keymap.set('i', '<D-v>', '<C-r><C-o>+') -- paste (insert)

  --[[ others
  -- command mapping
  vim.keymap.set({ 'i', 'n' }, '<D-a>', '<ESC>ggVG')                              -- select all
  vim.keymap.set({ 'i', 'n' }, '<D-w>', function() close_tab() end)               -- close tab
  vim.keymap.set({ 'i', 'n' }, '<D-[>', function() vim.cmd('BufferPrevious') end) -- previous tab
  vim.keymap.set({ 'i', 'n' }, '<D-]>', function() vim.cmd('BufferNext') end)     -- next tab
  vim.keymap.set('i', '<D-t>', '<C-o>:tabnew<CR><ESC>')                           -- new tab (insert)
  vim.keymap.set('n', '<D-t>', ':tabnew<CR>')                                     -- new tab (insert)
  vim.keymap.set('i', '<D-s>', '<C-o>:w<CR>')                                     -- save (insert)
  vim.keymap.set('n', '<D-s>', ':w<CR>')                                          -- save (normal)
  vim.keymap.set('x', '<D-x>', '"+d')                                             -- cut
  vim.keymap.set('x', '<D-c>', '"+y')                                             -- copy
  vim.keymap.set('i', '<D-v>', '<C-r><C-o>+')                                     -- paste (insert)
  vim.keymap.set('n', '<D-v>', 'i<C-r><C-o>+<ESC>l')                              -- paste (normal)
  vim.keymap.set('x', '<D-v>', '"+P')                                             -- paste (visual)
  vim.keymap.set('c', '<D-v>', '<C-r>+')                                          -- paste (command)
  vim.keymap.set('n', '<D-q>', ':q<CR>')
  ]]
end
