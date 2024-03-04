return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require 'null-ls'

    null_ls.setup {
      sources = {
        -- Lua
        null_ls.builtins.formatting.stylua,
        -- JS/TS
        -- null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.prettier,
        -- Python
        -- null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        -- null_ls.builtins.completion.spell,
      },
    }

    vim.keymap.set('n', '<leader>ff', vim.lsp.buf.format, {
      desc = '[F]ile [F]ormat',
    })
  end,
}
