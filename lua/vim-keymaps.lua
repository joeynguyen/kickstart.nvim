-- [[ Basic Keymaps ]]
local keymap = vim.keymap

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', {
  silent = true,
})

-- navigate buffers
keymap.set('n', '<Tab>', ':bnext<CR>', {})
keymap.set('n', '<S-Tab>', ':bprevious<CR>', {})

-- Use ctrl-[hjkl] to navigate windows/panes/splits
vim.keymap.set('n', '<C-k>', '<cmd>wincmd k<CR>', {})
vim.keymap.set('n', '<C-j>', '<cmd>wincmd j<CR>', {})
vim.keymap.set('n', '<C-h>', '<cmd>wincmd h<CR>', {})
vim.keymap.set('n', '<C-l>', '<cmd>wincmd l<CR>', {})

-- Remap for dealing with word wrap
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", {
  expr = true,
  silent = true,
})
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", {
  expr = true,
  silent = true,
})

-- Diagnostic keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev, {
  desc = 'Go to previous diagnostic message',
})
keymap.set('n', ']d', vim.diagnostic.goto_next, {
  desc = 'Go to next diagnostic message',
})
keymap.set('n', '<leader>e', vim.diagnostic.open_float, {
  desc = 'Open floating diagnostic message',
})
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, {
  desc = 'Open diagnostics list',
})
