return {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
        options = {
            icons_enabled = false,
            theme = 'dracula',
            component_separators = '|',
            section_separators = '',
        },
        sections = {
            lualine_a = { 'buffers' },
            lualine_b = {},
            lualine_c = {},
        },
    },
}
