-- [[ Basic Keymaps ]]
local keymap = vim.keymap

function Map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', {
  silent = true,
})

-- navigate buffers
keymap.set('n', '<Tab>', '<CMD>bnext<CR>', {})
keymap.set('n', '<S-Tab>', '<CMD>bprevious<CR>', {})

-- close buffer
keymap.set('n', '<C-x>', '<CMD>bd<CR>', {
  desc = 'Close current buffer',
})
-- save buffer
keymap.set('n', '<C-s>', '<CMD>w<CR>', {
  desc = 'Save current buffer',
})
-- quit Neovim
keymap.set('n', '<C-q>', '<CMD>q<CR>', {
  desc = 'Quit Neovim',
})

-- TODO: figure why using leader key doesn't work
-- keymap.set('n', '<leader>x', ':bd<CR>', { desc = 'Close current buffer' })
-- unbind default comma repeat navigation
-- Map('n', ',', '<CMD>nop<CR>', {})
vim.keymap.set('', ',', '<nop>')
Map('n', ',d', '<CMD>bd<CR>', { desc = 'Close current buffer' })
Map('n', ',D', '<CMD>bd!<CR>', { desc = 'Close current buffer' })
Map('n', ',w', '<CMD>w<CR>', { desc = 'Save current buffer' })
Map('n', ',wq', '<CMD>wq<CR>', { desc = 'Save and quit' })
Map('n', ',q', '<CMD>q<CR>', { desc = '[Q]uit Neovim' })
Map('n', ',Q', '<CMD>q!<CR>', { desc = '[Q]uit! Neovim' })
Map('n', ',h', '<CMD>nohl<CR>', { desc = 'No [H]ighlight' })

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
keymap.set('n', '<leader>Dd', vim.diagnostic.open_float, {
  desc = 'Open floating diagnostic message',
})
keymap.set('n', '<leader>Dq', vim.diagnostic.setloclist, {
  desc = 'Open diagnostics list',
})

-- use 'p' to paste over text without copying that text to your clipboard
-- (sends it to the void register)
-- keymap.set('x', 'p', [["_dP]])
-- keymap.set('x', 'p', [[pgv'@=v:register.'y'<Esc>]])
-- keymap.set('x', 'p', 'pgvy')                   -- https://stackoverflow.com/a/5093286
-- keymap.set('x', 'p', "pgv\"'.v:register.'y`><C-c>") -- https://vi.stackexchange.com/a/25260
-- keymap.set('x', 'p', function()
--   -- https://neovim.discourse.group/t/exiting-visual-mode-with-vim-keymap-set/2551/2
--   vim.api.nvim_input  "pgv\"'.v:register.'y`><C-c>"
-- end)
Map('x', 'p', "pgv\"'.v:register.'y`>", {})

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

--[[
-- sourcing a file is not supported in lazy.nvim
-- source the current file (update nvim with latest changes)
keymap.set('n', '<leader>u', '<cmd>luafile $MYVIMRC<CR>', {
  desc = '[U]pdate - Nvim source current file',
  noremap = true,
  silent = true,
})
--]]

-- add empty line below
-- the `cc` command deletes any possible characters added like comment strings)
-- the `mz` creates a mark at the current cursor position and the '`z' navigates back to it
Map('n', '<leader>O', 'mz<Esc>O<Esc>cc<Esc>`z', { desc = '[O]pen empty line above' })
Map('n', '<leader>o', 'mz<Esc>o<Esc>cc<Esc>`z', { desc = '[o]pen empty line below' })

-- the code below is equivalent to the Map function call above
--[[
keymap.set('n', '<leader>o', 'mz<Esc>o<Esc>cc<Esc>`z', {
  desc = 'Add empty line below',
  noremap = true,
  silent = true,
})
--]]

-- " adds a carriage return at the current position and add Tab indent
--  inoremap <leader>o <esc>o
--  inoremap <leader>O <esc>ko

-- disables Vim Ex (batch processing) mode shortcut
keymap.set('n', 'Q', '<nop>')

-- Fast Navigation
Map('', ';l', '$', { desc = 'End of Line' })
Map('', ';h', '^', { desc = 'Beginning of Line' })

-- QuickFix navigation
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- in Visual mode, use "J" and "K" to move the selected text up and down the file
-- keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--[[ My commonly unused keys
-- Q, R, t, T, Y, U,
-- S, D, semicolon
-- Z, X, C, comma
--]]
