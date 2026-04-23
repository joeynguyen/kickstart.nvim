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
