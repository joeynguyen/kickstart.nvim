return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  -- ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
    'BufReadPre '
      .. vim.fn.expand '~'
      .. '/git/notable-data/**/*',
    'BufReadPre ' .. vim.fn.expand '~' .. '/git/obsidian-data/**/*',
    -- 'BufReadPre '
    --   .. vim.fn.expand '~'
    --   .. '/git/notable-data/notes/*.md',
    -- 'BufReadPre ' .. vim.fn.expand '~' .. '/git/obsidian-data/notes/*.md',
  },
  dependencies = {
    -- REQUIRED
    'nvim-lua/plenary.nvim',

    -- OPTIONAL
    -- completion of note references
    'hrsh7th/nvim-cmp',

    -- search and quick-switch functionality
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'Code Snippets',
        path = '~/git/notable-data',
      },
      {
        name = 'Notes',
        path = '~/git/obsidian-notes',
      },
    },
    ui = {
      enable = false,
    },
    attachments = {
      img_folder = 'attachments/imgs',
    },
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ['gf'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ['<leader>ch'] = {
        action = function()
          return require('obsidian').util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      -- Smart action depending on context, either follow link or toggle checkbox.
      -- ["<cr>"] = {
      --   action = function()
      --     return require("obsidian").util.smart_action()
      --   end,
      --   opts = { buffer = true, expr = true },
      -- }
    },
  },
}
