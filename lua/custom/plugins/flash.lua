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
    { "<leader><leader>g", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Code [G]roup" },
    {
      "<leader><leader>/",
      mode = { "n", "x", "o" },
      function()
        require("flash").toggle()
        vim.notify("Flash Search toggled")
      end,
      desc = "Toggle Flash Search"
    },
  },
}
