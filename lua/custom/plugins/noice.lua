return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    'rcarriga/nvim-notify',
  },
  config = function()
    require('noice').setup {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = false,        -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
      },
      cmdline = {
        format = {
          cmdline = {
            icon = ' :',
          },
        },
      },
      routes = {
        -- disable text search confirmation
        { filter = { event = 'msg_show', find = '/' },               skip = true },
        { filter = { event = 'msg_show', find = 'lines yanked' },    skip = true },
        { filter = { event = 'msg_show', find = 'more line' },       skip = true },
        { filter = { event = 'msg_show', find = 'line less' },       skip = true },
        { filter = { event = 'msg_show', find = 'changes; before' }, skip = true },
        { filter = { event = 'msg_show', find = 'changes; after' },  skip = true },
        -- { filter = { event = 'emsg', find = 'E486' }, skip = true },
        -- { filter = { find = 'E486' }, skip = true },
        -- {
        --   filter = {
        --     event = 'msg_show',
        --     kind = 'search_count',
        --   },
        --   opts = { skip = true },
        -- },
        -- { filter = { event = "msg_show", kind = "", find = "written" }, view = "mini" },
        -- { filter = { event = "msg_show", find = "search hit BOTTOM" }, skip = true },
        -- { filter = { event = "msg_show", find = "search hit TOP" }, skip = true },
        -- { filter = { event = "emsg", find = "E23" }, skip = true },
        -- { filter = { event = "emsg", find = "E20" }, skip = true },
        -- { filter = { find = "No signature help" }, skip = true },
        -- { filter = { find = "E37" }, skip = true },
      },
    }
    require('notify').setup {
      timeout = 1500,
      stages = 'static',
    }
  end,
}
