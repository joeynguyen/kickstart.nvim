-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
local g = vim.g
local opt = vim.opt

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
g.mapleader = ' '
g.maplocalleader = ' '

-- Performance optimizations
opt.updatetime = 250
opt.timeoutlen = 300
opt.redrawtime = 10000
opt.maxmempattern = 20000

-- for GUIs like Neovide
-- opt.guifont = 'Rec Mono Semicasual:h20'
-- opt.guifont = 'InconsolataGo Nerd Font:h20'

-- disable statusline
opt.laststatus = 0

-- add window/split specific tab line
-- %= : float text to right
-- %m : display if file has been modified
-- %f : show file name
-- o.winbar = '%=%m %f'

-- live preview when performing text replace commands, e.g. `:%s/tab/space`
opt.inccommand = 'split'

-- Set highlight on search
opt.hlsearch = true

-- Set highlight current line
opt.cursorline = true

-- Make line numbers default
opt.number = true

-- Enable mouse mode
opt.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- o.clipboard = 'unnamedplus'

-- tabs & indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
-- use spaces instead of tabs
opt.expandtab = true
opt.smartindent = true

opt.wrap = false
opt.lazyredraw = false

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- search settings
opt.swapfile = false
opt.backup = false
opt.hlsearch = true
opt.incsearch = true
opt.scrolloff = 8
opt.colorcolumn = '100'

-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
opt.signcolumn = 'yes'

-- Set completeopt to have a better completion experience
opt.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
opt.termguicolors = true

opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

require 'utils/visual-sort'

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
