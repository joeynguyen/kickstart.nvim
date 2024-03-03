return {
    -- EasyMotion replacement written in Lua for Neovim
    'smoka7/hop.nvim',
    version = "*",
    opts = {},
    config = function()
        require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        local hop = require("hop")
        local directions = require("hop.hint").HintDirection

        -- these are set in mappings.lua because
        vim.keymap.set("", "f", function()
            hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
        end, { remap = true })

        vim.keymap.set("", "F", function()
            hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
        end, { remap = true })

        vim.keymap.set("", "t", function()
            hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
        end, { remap = true })

        vim.keymap.set("", "T", function()
            hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
        end, { remap = true })

        vim.keymap.set("n", "<leader>w", ":HopWordAC<CR>", {})

        vim.keymap.set("n", "<leader>b", ":HopWordBC<CR>", {})

        vim.keymap.set("n", "<leader>j", ":HopLineStartAC<CR>", {})
        vim.keymap.set("n", "<leader>k", ":HopLineStartBC<CR>", {})

        -- vim.keymap.set("n", "<leader><leader>b", function()
        --     hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })
        -- end, { remap = true })
    end,
}
