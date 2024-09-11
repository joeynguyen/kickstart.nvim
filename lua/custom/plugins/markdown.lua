return {
  {
    -- MarkDown preview in editor
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {},
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  },
  {
    -- MarkDown preview window
    'toppair/peek.nvim',
    event = { 'VeryLazy' },
    build = 'deno task --quiet build:fast', -- requires that deno be installed on this system first
    config = function()
      require('peek').setup()
      -- refer to `configuration to change defaults`
      vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
      vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    end,
  },
}

-- another Markdown Preview plugin
-- {"ellisonleao/glow.nvim", config = true, cmd = "Glow"}

-- {
-- -- install with yarn or npm
--   'iamcco/markdown-preview.nvim',
--   cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
--   build = 'cd app && yarn install',
--   init = function()
--     vim.g.mkdp_filetypes = { 'markdown' }
--   end,
--   ft = { 'markdown' },
-- },
