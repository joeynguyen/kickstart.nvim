return {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    dependencies = {
        'folke/noice.nvim',
    },
    opts = {},
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = false,
                theme = 'dracula',
                component_separators = '|',
                section_separators = '',
            },
            tabline = {
                lualine_a = { 'buffers' },
                lualine_b = { 'diagnostics' },
                lualine_c = {
                    {
                        -- Show macros '@recording' messages in the statusline
                        require('noice').api.statusline.mode.get,
                        cond = require('noice').api.statusline.mode.has,
                        color = { fg = '#ff9e64' },
                    },
                },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' },
            },
            sections = {
                -- lualine_a = { 'mode' },
                -- lualine_b = { 'branch', 'diff', 'diagnostics' },
                -- lualine_c = { 'filename' },
                -- lualine_x = { 'encoding', 'fileformat', 'filetype' },
                -- lualine_y = { 'progress' },
                -- lualine_z = { 'location' },
            },
        }
    end,
}
