return {
  -- "gc" to comment visual regions/lines
  'numToStr/Comment.nvim',
  opts = {
    toggler = {
      -- Line-comment toggle keymap
      line = 'gc',
    },
  },
  dependencies = 'JoosepAlviste/nvim-ts-context-commentstring',
  config = function()
    require('Comment').setup {
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    }
  end,
}
