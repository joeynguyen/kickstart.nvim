return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  ---@type Flash.Config
  opts = {
    modes = {
      -- Flash-powered regular search with `/` or `?`
      search = {
        enabled = true,
      },
      -- Flash-powered `f`, `F`, `t`, `T`, `;` and `,` motions
      char = {
        enabled = false,
      },
    },
  },
  -- stylua: ignore
  keys = {
    -- { "<leader>jj", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash Jump" },
    { "<leader><leader>B", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Text [B]lock" },
    {
      "<leader><leader>/",
      mode = { "n", "x", "o" },
      function()
        require("flash").toggle()
        vim.notify("Flash Search toggled")
      end,
      desc = "Toggle Flash Search"
    },
    -- line jump
    -- {
    --   "<leader>jl",
    --   mode = { "n", "x", "o" },
    --   function()
    --     require("flash").jump({
    --       search = { mode = "search", max_length = 0 },
    --       label = { after = { 0, 0 } },
    --       pattern = "^"
    --     })
    --   end,
    --   desc = "Flash Line Jump"
    -- },
    -- 2-char jump
    -- {
    --   "<leader>jw",
    --   mode = { "n", "x", "o" },
    --   function()
    --     local Flash = require("flash")
    --
    --     ---@param opts Flash.Format
    --     local function format(opts)
    --       -- always show first and second label
    --       return {
    --         { opts.match.label1, "FlashMatch" },
    --         { opts.match.label2, "FlashLabel" },
    --       }
    --     end
    --
    --     Flash.jump({
    --       search = { mode = "search" },
    --       label = { after = false, before = { 0, 0 }, uppercase = false, format = format },
    --       pattern = [[\<]],
    --       action = function(match, state)
    --         state:hide()
    --         Flash.jump({
    --           search = { max_length = 0 },
    --           highlight = { matches = false },
    --           label = { format = format },
    --           matcher = function(win)
    --             -- limit matches to the current label
    --             return vim.tbl_filter(function(m)
    --               return m.label == match.label and m.win == win
    --             end, state.results)
    --           end,
    --           labeler = function(matches)
    --             for _, m in ipairs(matches) do
    --               m.label = m.label2 -- use the second label
    --             end
    --           end,
    --         })
    --       end,
    --       labeler = function(matches, state)
    --         local labels = state:labels()
    --         for m, match in ipairs(matches) do
    --           match.label1 = labels[math.floor((m - 1) / #labels) + 1]
    --           match.label2 = labels[(m - 1) % #labels + 1]
    --           match.label = match.label1
    --         end
    --       end,
    --     })
    --   end,
    --   desc = "Flash Word Jump"
    -- },

    -- { "r",          mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
    -- { "R",          mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  },
}
