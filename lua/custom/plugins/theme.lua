return {
  -- https://github.com/folke/tokyonight.nvim
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    -- require("tokyonight").setup({
    --   style = "moon",
    -- })
    vim.cmd [[colorscheme tokyonight]]
  end,
}
-- return {
--   -- Theme inspired by Atom
--   'navarasu/onedark.nvim',
--   priority = 1000,
--   lazy = false,
--   config = function()
--     require('onedark').setup {
--       -- Set a style preset. 'dark' is default.
--       style = 'dark', -- dark, darker, cool, deep, warm, warmer, light
--     }
--     require('onedark').load()
--   end,
-- }
-- Other themes I tried but I still prefer OneDark over:
--   - https://github.com/sontungexpt/witch
--   - https://github.com/oxfist/night-owl.nvim
--   - https://github.com/folke/tokyonight.nvim

-- Attempt at overriding colors with Ultraviolent theme
-- return {
--   "olimorris/onedarkpro.nvim",
--   priority = 1000, -- Ensure it loads first
--   config = function()
--     require("onedarkpro").setup({
--       highlights = {
--         ["@property"] = { fg = "#0effbb" },
--         ["@string"] = { link = "String" },
--         ["@constant.builtin"] = { fg = "${cyan}" },
--         ["@constant.conditional"] = { fg = "${cyan}" },
--         ["@character.special"] = { fg = "${cyan}" },
--         ["@keyword.function"] = { fg = "${cyan}" },
--         ["@keyword.operator"] = { fg = "${cyan}" },
--         ["@keyword.conditional"] = { fg = "${cyan}" },
--         ["@keyword.return"] = { fg = "${red}" },
--         ["@function"] = { fg = "${green}" },
--         ["@function.method"] = { fg = "#f9f9f5" },
--         String = { fg = { onedark = "${yellow}" } },
--         Comment = { fg = "#636667" },
--         Number = { fg = "${purple}" },
--         -- Function = { fg = "#b6ff00" },
--         -- Identifier = { fg = "#b6ff00" },
--         -- String = { fg = "#fff727", extend = true }
--         -- String = { fg = "#fff727", bg = "#FFFF00", italic = true }
--       },
--       colors = {
--         -- my_new_red = "#f44336",
--         red = "#ff0090",
--         -- orange = "",
--         yellow = "#fff727",
--         green = "#b6ff00",
--         -- blue = "",
--         cyan = "#47e0fb",
--         purple = "#d731ff",
--         dark = { bg = "#242728" },
--         -- light = { bg = "#00FF00" }, -- green
--       },
--     })
--
--     vim.cmd("colorscheme onedark")
--   end,
-- }

-- palette = 0=#242728
-- palette = 1=#ff0090
-- palette = 2=#b6ff00
-- palette = 3=#fff727
-- palette = 4=#47e0fb
-- palette = 5=#d731ff
-- palette = 6=#0effbb
-- palette = 7=#e1e1e1
-- palette = 8=#636667
-- palette = 9=#fb58b4
-- palette = 10=#deff8c
-- palette = 11=#ebe087
-- palette = 12=#7fecff
-- palette = 13=#e681ff
-- palette = 14=#69fcd3
-- palette = 15=#f9f9f5
-- background = #242728
-- foreground = #c1c1c1
-- cursor-color = #c1c1c1
-- selection-background = #574c49
-- selection-foreground = #c3c7cb
