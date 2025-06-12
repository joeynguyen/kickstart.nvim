return {
  -- Improved folding
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  config = function()
    -- displays fold markers in the gutter
    vim.o.foldcolumn = '1'
    -- controls which folds are automatically closed based on their nesting depth.
    -- By setting it to 99, we're essentially telling Neovim to keep all folds open by default
    vim.o.foldlevel = 99
    -- same as foldlevel, but for new buffers
    vim.o.foldlevelstart = 99
    -- controls whether folds are enabled in the current buffer
    vim.o.foldenable = false

    -- Using ufo provider need remap `zR` and `zM`.
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    vim.keymap.set('n', 'zK', function()
      local winid = require('ufo').peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end, { desc = "Peek Fold" })

    require('ufo').setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
      end
    })
  end,
}
