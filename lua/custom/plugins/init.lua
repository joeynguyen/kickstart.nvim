-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return { -- NOTE: First, some plugins that don't require any configuration
  -- Git related plugins
  -- 'tpope/vim-fugitive',
  'tpope/vim-rhubarb', -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  'fatih/vim-go',
  -- Additional useful plugins
  --[[ {
    -- Better quickfix window
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
    config = function()
      require('bqf').setup({
        auto_enable = true,
        magic_window = true,
        auto_resize_height = false,
      })
    end,
  }, ]]
  {
    -- Improved folding
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      vim.o.foldcolumn = '1'
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true

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
  },
  {
    -- Smart text objects
    'echasnovski/mini.ai',
    config = function()
      require('mini.ai').setup()
    end,
  },
  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.debug',
}
