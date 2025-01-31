return {
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  dependencies = { -- Snippet Engine & its associated nvim-cmp source
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        -- Build Step is needed for regex support in snippets
        -- This step is not supported in many windows environments
        -- Remove the below condition to re-enable on windows
        if vim.fn.has 'win32' == 1 then
          return
        end
        return 'make install_jsregexp'
      end)(),
    },
    'saadparwaiz1/cmp_luasnip', -- Adds LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',         -- Adds a number of user-friendly snippets
    'rafamadriz/friendly-snippets',
  },
  config = function()
    -- [[ Configure nvim-cmp ]]
    -- See `:help cmp`
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    -- local s = luasnip.snippet
    -- local t = luasnip.text_node
    -- local i = luasnip.insert_node

    -- luasnip.add_snippets({ "javascript", "typescript", "javascriptreact", "typescriptreact" },
    --   {                                    -- Add support for .js, .ts, .jsx, and .tsx
    --     s("cl", {                          -- Trigger: 'cl'
    --       t("console.log("),
    --       t('"'), i(1, "message"), t('"'), -- $1 with placeholder "message"
    --       t(", "), i(2, "value"),          -- $2 with placeholder "value"
    --       t(");"),
    --     }),
    --   })
    luasnip.add_snippets('javascript', require 'custom.snippets.typescript')
    luasnip.add_snippets('javascriptreact', require 'custom.snippets.typescript')
    luasnip.add_snippets('typescript', require 'custom.snippets.typescript')
    luasnip.add_snippets('typescriptreact', require 'custom.snippets.typescript')
    -- luasnip.add_snippets({ "javascript", "typescript", "javascriptreact", "typescriptreact" },
    --   require 'custom.snippets.typescript')

    -- Debug: Print all loaded snippets for the current filetype
    -- print(vim.inspect(luasnip.snippets.typescriptreact)) -- Change `javascript` to the relevant filetype

    -- require('luasnip.loaders.from_vscode').lazy_load()
    luasnip.config.setup({
      history = true,                            -- Allows jumping back to previous nodes
      updateevents = "TextChanged,TextChangedI", -- Updates as you type
      region_check_events = "InsertEnter",       -- Ensures Insert mode stays active
      delete_check_events = "InsertLeave",       -- Avoids glitches when leaving insert
    })


    cmp.setup {
      formatting = {
        format = require("nvim-highlight-colors").format
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false, -- Avoids auto-selecting
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            -- Debugging: Print state if needed
            print("Expanding or jumping LuaSnip")
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = {
        {
          name = 'lazydev',
          -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
          group_index = 0,
        },
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'path' },
      },
      -- sources = cmp.config.sources({
      --   { name = 'luasnip',  group_index = 1 },
      --   { name = 'nvim_lsp', group_index = 2 },
      --   { name = 'path',     group_index = 3 },
      -- }),
    }
  end,
}
