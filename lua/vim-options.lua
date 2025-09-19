-- for conciseness
local g = vim.g
local o = vim.o
local wo = vim.wo

-- Performance optimizations
o.updatetime = 250
o.timeoutlen = 300
o.redrawtime = 10000
o.maxmempattern = 20000

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

-- Set completeopt to have a better completion experience
o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
o.termguicolors = true

o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- [[ Highlight on yank ]]
-- See `:help vim.hl.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', {
  clear = true,
})
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.hl.on_yank()
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

-- Create an autocmd group for Markdown-specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- set `wrap` to true
    vim.opt.wrap = true
  end,
  desc = "Enable line wrapping for Markdown files",
})

vim.api.nvim_create_autocmd("FileType", {
  -- pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  callback = function()
    vim.api.nvim_set_hl(0, "TelescopeSelection", { link = "Visual" })
  end,
  desc = "Use the current color theme's setting for Visual selection",
})

------------------------------------------------------------------------------
-- Treat all files that don't have a file extension in their name
-- as shell script files for syntax highlighting purposes.

-- 1. Create an autocommand group for filetype detection
vim.api.nvim_create_augroup("FileTypeNoExtension", { clear = true })

-- 2. Autocommand to set filetype to 'sh' for files with no extension
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = "FileTypeNoExtension",
  desc = "Set filetype to sh for files with no extension",
  pattern = "*",
  callback = function()
    local filename = vim.fn.expand("%:t")
    if filename:match("^[^%.]+$") and vim.bo.filetype == "" then
      vim.bo.filetype = "sh"
    end
  end,
})
------------------------------------------------------------------------------
