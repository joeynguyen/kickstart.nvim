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
g.autoformat = true
g.trouble_lualine = true

-- Behavior settings
opt.mouse = 'a'    -- Enable mouse mode
opt.laststatus = 0 -- Disable statusline
-- Live preview when performing text replace commands, e.g. `:%s/tab/space`
opt.inccommand = 'split'
opt.errorbells = false               -- No error bells
opt.iskeyword:append("-")            -- Treat dash as part of word
opt.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Visual settings
opt.termguicolors = true -- Enable 24-bit colors (make sure your terminal supports this)

-- Lines and columns
opt.cursorline = true      -- Highlight current line
opt.number = true          -- Make line numbers default
opt.relativenumber = false -- Relative line numbers
opt.scrolloff = 4          -- Keep n lines above/below cursor (have context around what you're editing)
opt.signcolumn = 'yes'     -- Always show sign column
opt.colorcolumn = '100'    -- Add a vertical line visualizing the column at this number
opt.wrap = false           -- Don't wrap lines

opt.showmatch = true       -- Highlight matching brackets
opt.matchtime = 2          -- How long to show matching bracket

-- File handling
opt.undofile = true  -- Save undo history
opt.swapfile = false -- Disable swap files
opt.backup = false   -- Don't create backup files
opt.autoread = true  -- Auto reload files changed outside vim

-- Performance optimizations
opt.updatetime = 250 -- Faster completion and git signs
opt.timeoutlen = 300
opt.redrawtime = 10000
opt.maxmempattern = 20000
opt.synmaxcol = 300 -- Syntax highlighting limit (prevents freezes on minified files)

-- tabs & indentation
opt.tabstop = 2        -- Tab width
opt.softtabstop = 2    -- Soft tab stop
opt.shiftwidth = 2     -- Indent width
opt.expandtab = true   -- Use spaces instead of tabs
opt.smartindent = true -- Smart auto-indenting
opt.autoindent = true  -- Copy indent from current line

-- Enable break indent
opt.breakindent = true

-- Search settings
opt.ignorecase = true -- Case insensitive search
opt.smartcase = true  -- Case sensitive if uppercase in search
opt.hlsearch = true   -- Highlight search results
opt.incsearch = true  -- Show matches as you type

-- Command-line completion
opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- o.clipboard = 'unnamedplus'

-- add window/split specific tab line
-- %= : float text to right
-- %m : display if file has been modified
-- %f : show file name
-- opt.winbar = '%=%m %f'

-- for GUIs like Neovide
-- opt.guifont = 'Rec Mono Semicasual:h20'
-- opt.guifont = 'InconsolataGo Nerd Font:h20'

-- Custom filetype definitions
vim.filetype.add({
  extension = {
    env = "dotenv",
    jinja = "jinja2",
    jinja2 = "jinja2",
    j2 = "jinja2",
  },
  filename = {
    [".env"] = "dotenv",
    ["env"] = "dotenv",
  },
  pattern = {
    ["[jt]sconfig.*.json"] = "jsonc",
    ["%.env%.[%w_.-]+"] = "dotenv",
    ["templates/.*%.html"] = "jinja2",
  },
})
