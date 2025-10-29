return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    latex = { enabled = false },
  },

  config = function()
    local render_markdown = require 'render-markdown'
    vim.api.nvim_create_user_command('MarkdownRenderToggle', function()
      render_markdown.toggle()
    end, {})
    vim.api.nvim_create_user_command('MarkdownRenderPreview', function()
      render_markdown.preview()
    end, {})
  end,
}
