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

-- close buffer
keymap.set('n', '<C-x>', ':bd<CR>', {
  desc = 'Close current buffer',
})
-- TODO: figure why using leader key doesn't work
-- keymap.set('n', '<leader>x', ':bd<CR>', {})
-- keymap.set('n', '<leader>x', '<cmd>bd<CR>', {})

-- moved this functionality to nvim-tmux-navigation plugin
-- Use alt-[hjkl] to navigate windows/panes/splits
-- keymap.set('n', '<M-h>', '<cmd>wincmd h<CR>', {})
-- keymap.set('n', '<M-j>', '<cmd>wincmd j<CR>', {})
-- keymap.set('n', '<M-k>', '<cmd>wincmd k<CR>', {})
-- keymap.set('n', '<M-l>', '<cmd>wincmd l<CR>', {})

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

-- use 'p' to paste over text without copying that text to your clipboard
-- (sends it to the void register)
keymap.set('x', 'p', [["_dP]])

-- delete to void register in Normal and Visual modes
-- keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])
-- keymap.set({ 'n', 'v' }, '<leader>c', [["_c]])

-- make <C-c> behave exactly like <Esc>
keymap.set('i', '<C-c>', '<Esc>')

-- keeps cursor in the same place while using "J"
keymap.set('n', 'J', 'mzJ`z')

-- keeps cursor in the same place while using <C-d> and <C-u>
keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')

-- keeps cursor in the same place while searching
keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

-- source the current file (update nvim with latest changes)
keymap.set('n', '<leader>u', function()
  vim.cmd 'so'
end)

-- disables Vim Ex (batch processing) mode shortcut
keymap.set('n', 'Q', '<nop>')

-- QuickFix navigation
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- in Visual mode, use "J" and "K" to move the selected text up and down the file
-- keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- keymap.set("v", "K", ":m '<-2<CR>gv=gv")
