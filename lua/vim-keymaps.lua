--[[ How to find the mapping key code for any key in Vim

From Normal mode, you can type : then Press Ctrl+k followed by any key,
and Vim will tell you how to reference it. For example, from normal mode
typing : then pressing Ctrl+k and pressing Backspace results in:

:<BS>

]]

-- [[ Basic Keymaps ]]
local keymap = vim.keymap

-- Clipboard interaction
-- Sync yank to system clipboard
vim.keymap.set({ 'n', 'v' }, 'y', '"+y', { desc = 'Yank to system clipboard' })
vim.keymap.set('n', 'Y', '"+Y', { desc = 'Yank line to system clipboard' })
vim.keymap.set('n', 'yy', '"+yy', { desc = 'Yank line to system clipboard' })

function Map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- function Nmap(shortcut, command)
--   vim.api.nvim_set_keymap('n', shortcut, command, {})
-- end
--
-- function Imap(shortcut, command)
--   vim.api.nvim_set_keymap('i', shortcut, command, {})
-- end

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', {
  silent = true,
})
-- keymap.set({ 'n', 'v' }, '<BS>', '<Space>', {
--   silent = true,
-- })
-- Map({ 'n', 'v' }, '<BS>', '<Leader>')
-- Nmap('<BS>', '<Leader>')

-- Ctrl-l toggle search highlight - https://www.reddit.com/r/neovim/comments/sd7bmv/comment/hubkeix/
Map("n", "<leader>h", [[ (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n" <BAR> redraw<CR>]],
  { silent = true, expr = true, desc = 'Toggle Search [H]ighlight' }
)
Map({ 'n', 'v' }, '<leader>,a', '<CMD>e $HOME/.config/aerospace/aerospace.toml<CR>', { desc = '[A]erospace' })

-- Window navigation
Map('n', '<C-h>', '<cmd>wincmd h<CR>', { desc = 'Move to left window' })
Map('n', '<C-l>', '<cmd>wincmd l<CR>', { desc = 'Move to right window' })
Map('n', '<C-j>', '<cmd>wincmd j<CR>', { desc = 'Move to bottom window' })
Map('n', '<C-k>', '<cmd>wincmd k<CR>', { desc = 'Move to top window' })

-- Alternative: use < and > for character search repeats
-- removed because it conflicts with indent and unindent
-- Map('n', '>', ';', { desc = 'Repeat last character search forward' })
-- Map('n', '<', ',', { desc = 'Repeat last character search backward' })

-- edit config files
-- Map({ 'n', 'v' }, '<leader>,a', '<CMD>e $HOME/.config/aerospace/aerospace.toml<CR>', { desc = '[A]erospace' })
Map({ 'n', 'v' }, '<leader>,a', '<CMD>e $HOME/.aws/config<CR>', { desc = '[A]WS' })
Map({ 'n', 'v' }, '<leader>,c', '<CMD>e $HOME/.config/containers/containers.conf<CR>', { desc = '[C]ontainers' })
Map({ 'n', 'v' }, '<leader>,g', '<CMD>e $HOME/.config/ghostty/config<CR>', { desc = '[G]hostty' })
Map({ 'n', 'v' }, '<leader>,k', '<CMD>e $HOME/.config/karabiner/karabiner.json<CR>', { desc = '[K]arabiner' })
Map({ 'n', 'v' }, '<leader>,K', '<CMD>e $HOME/.kube/config<CR>', { desc = '[K]ubectl' })
Map({ 'n', 'v' }, '<leader>,p', '<CMD>e $HOME/.profile<CR>', { desc = '[P]rofile' })
Map({ 'n', 'v' }, '<leader>,n', '<CMD>e $HOME/.config/nvim/init.lua<CR>', { desc = '[N]eovim' })
Map({ 'n', 'v' }, '<leader>,s', '<CMD>e $HOME/.config/sesh/sesh.toml<CR>', { desc = '[S]esh' })
Map({ 'n', 'v' }, '<leader>,t', '<CMD>e $HOME/.config/tmux/tmux.conf.local<CR>', { desc = '[T]mux' })
-- Map({ 'n', 'v' }, '<leader>,w', '<CMD>e $WEZTERM_CONFIG_FILE<CR>', { desc = '[W]ezTerm' })
Map({ 'n', 'v' }, '<leader>,z', '<CMD>e $HOME/.zshrc<CR>', { desc = '[Z]shrc' })

-- navigate buffers
keymap.set('n', '<Tab>', '<CMD>bnext<CR>', {})
keymap.set('n', '<S-Tab>', '<CMD>bprevious<CR>', {})
keymap.set('n', '<BS>', '<CMD>b#<CR>', { desc = 'Go to previous buffer' })

-- close buffer
keymap.set('n', '<C-x>', '<CMD>bd<CR>', {
  desc = 'Close current buffer',
})
-- save buffer
keymap.set('n', '<C-s>', '<CMD>w<CR>', {
  desc = 'Save current buffer',
})
-- quit Neovim
-- keymap.set('n', '<C-q>', '<CMD>q<CR>', {
--   desc = 'Quit Neovim',
-- })

--[[ Fast Navigation ]]
Map('', ';l', '$', { desc = 'End of Line' })
Map('', ';h', '^', { desc = 'Beginning of Line' })
Map('', '<Del>l', '$', { desc = 'End of Line' })
Map('', '<Del>h', '^', { desc = 'Beginning of Line' })

--[[ Vim editor commands ]]
-- unbind default comma repeat navigation
-- Map('n', ',', '<CMD>nop<CR>', {}) -- using Map doesn't work for this
vim.keymap.set('', ',', '<nop>')
Map('n', ',d', '<CMD>bd<CR>', { desc = 'Close current buffer' })
Map('n', ',D', '<CMD>bd!<CR>', { desc = 'Close! current buffer' })
Map('n', ',a', '<CMD>%bd|e#|bd #<CR>', { desc = 'Close all buffers except current' })
Map('n', ',A', '<CMD>%bd<CR>', { desc = 'Close all buffers' })
Map('n', ',,', '<CMD>w<CR>', { desc = 'Save current buffer' })
Map('n', ',.', '<CMD>b#<CR>', { desc = 'Go to previous buffer' })
Map('n', ',w', '<CMD>w<CR>', { desc = 'Save current buffer' })
Map('n', ',ww', '<CMD>w<CR>', { desc = 'Save current buffer' })
Map('n', ',wq', '<CMD>wq<CR>', { desc = 'Save and quit' })
Map('n', ',q', '<CMD>qa<CR>', { desc = '[Q]uit Neovim' })
Map('n', ',Q', '<CMD>qa!<CR>', { desc = '[Q]uit! Neovim' })
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
keymap.set('n', '<leader>dd', vim.diagnostic.open_float, {
  desc = 'Open floating diagnostic message',
})
keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, {
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
-- Map('x', 'p', "pgv\"'.v:register.'y`>", {})
keymap.set('x', 'p', '"_c<Esc>p')

-- In Select mode (used by Snippet autocompletion), paste into placeholders without leaving insert
keymap.set('s', 'p', function()
  local reg = vim.v.register ~= '' and vim.v.register or '+'
  return vim.api.nvim_replace_termcodes('<BS><C-r>' .. reg, true, false, true)
end, { expr = true, desc = 'Paste into selection and stay in Insert' })
keymap.set('s', 'P', function()
  local reg = vim.v.register ~= '' and vim.v.register or '+'
  return vim.api.nvim_replace_termcodes('<BS><C-r>' .. reg, true, false, true)
end, { expr = true, desc = 'Paste into selection and stay in Insert' })

-- delete to void register in Normal and Visual modes
-- keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])
-- keymap.set({ 'n', 'v' }, '<leader>c', [["_c]])

-- make <C-c> behave exactly like <Esc>, but snippet-aware
keymap.set('i', '<C-c>', function()
  local luasnip = require('luasnip')
  -- If we're in a snippet, don't force Esc, let LuaSnip handle it
  if luasnip.in_snippet() then
    return '<C-c>'
  else
    return '<Esc>'
  end
end, { expr = true })

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

-- edit to black hole register with hyphen prefix
Map({ 'n', 'v' }, '-c', '"_c', { desc = '[c] edit to black hole register' })
Map({ 'n', 'v' }, '-d', '"_d', { desc = '[d] delete to black hole register' })
Map({ 'n', 'v' }, '<leader><leader>c', '"_c', { desc = '[c] edit to black hole register' })
Map({ 'n', 'v' }, '<leader><leader>d', '"_d', { desc = '[d] delete to black hole register' })

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

--[[ Vim keys I typically don't use
-- Q, R, t, T, Y, U,
-- S, D, semicolon
-- Z, X, C, comma
--]]

vim.api.nvim_create_user_command('CopyRelativePath', function()
  local path = vim.fn.expand '%:.'
  vim.fn.setreg('+', path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command('CopyAbsolutePath', function()
  local path = vim.fn.expand '%:p'
  vim.fn.setreg('+', path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.api.nvim_create_user_command('CopyFilename', function()
  local filename = vim.fn.expand '%:t'
  vim.fn.setreg('+', filename)
  vim.notify('Copied "' .. filename .. '" to the clipboard!')
end, {})

vim.keymap.set('n', '<leader>fp', '<CMD>CopyRelativePath<CR>', { desc = '[F]ile [P]ath copy', })
vim.keymap.set('n', '<leader>fn', '<CMD>CopyFilename<CR>', { desc = '[F]ile [N]ame copy', })
