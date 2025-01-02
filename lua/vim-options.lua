-- for conciseness
local g = vim.g
local o = vim.o
local wo = vim.wo

-- https://github.com/neovim/neovim/issues/31675#issuecomment-2558405042
vim.hl = vim.highlight

-- o.guifont = 'Rec Mono Semicasual:h20'
-- o.guifont = 'InconsolataGo Nerd Font:h20'

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
g.mapleader = ' '
g.maplocalleader = ' '

-- disable statusline
o.laststatus = 0
-- add window/split specific tab line
-- %= : float text to right
-- %m : display if file has been modified
-- %f : show file name
-- o.winbar = '%=%m %f'

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- live preview when performing text replace commands, e.g. `:%s/tab/space`
o.inccommand = 'split'

-- Set highlight on search
o.hlsearch = true

-- Set highlight current line
o.cursorline = true

-- Make line numbers default
wo.number = true

-- Enable mouse mode
o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
o.clipboard = 'unnamedplus'

-- tabs & indentation
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
-- use spaces instead of tabs
o.expandtab = true
o.smartindent = true

o.wrap = false
o.lazyredraw = false

-- Enable break indent
o.breakindent = true

-- Save undo history
o.undofile = true

-- search settings
o.swapfile = false
o.backup = false
o.hlsearch = true
o.incsearch = true
o.scrolloff = 8
o.colorcolumn = '100'

-- Case-insensitive searching UNLESS \C or capital in search
o.ignorecase = true
o.smartcase = true

-- Keep signcolumn on by default
wo.signcolumn = 'yes'

-- Decrease update time
o.updatetime = 250
o.timeoutlen = 300

-- Set completeopt to have a better completion experience
o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
o.termguicolors = true

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', {
  clear = true,
})
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- open buffer at the same line number as last time exited
vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
  pattern = { '*' },
  callback = function()
    if vim.fn.line '\'"' > 1 and vim.fn.line '\'"' <= vim.fn.line '$' then
      vim.api.nvim_exec2('normal! g\'"', {})
    end
  end,
})
