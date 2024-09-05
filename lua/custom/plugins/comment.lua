return {
  -- "gc" to comment visual regions/lines
  'numToStr/Comment.nvim',
  dependencies = 'JoosepAlviste/nvim-ts-context-commentstring', -- support for JSX
  config = function()
    require('Comment').setup {
      toggler = {
        -- Line-comment toggle keymap
        line = 'gc',
      },
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    }
  end,
}
