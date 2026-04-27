return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'

    lint.linters_by_ft = {
      python = { 'ruff' },
      html = { 'djlint' },
      jinja2 = { 'djlint' },
    }

    -- Prefer the project-local ruff from the uv virtualenv if it exists
    vim.api.nvim_create_autocmd('BufEnter', {
      pattern = '*.py',
      callback = function()
        local venv_ruff = vim.fn.getcwd() .. '/.venv/bin/ruff'
        if vim.fn.filereadable(venv_ruff) == 1 then
          lint.linters.ruff.cmd = venv_ruff
        else
          lint.linters.ruff.cmd = 'ruff' -- fall back to system/Mason ruff
        end
      end,
    })

    -- Run linter on enter, after write, and after leaving insert mode
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      callback = function()
        -- Only lint if the filetype has a linter configured
        if lint.linters_by_ft[vim.bo.filetype] then
          lint.try_lint()
        end
      end,
    })
  end,
}
