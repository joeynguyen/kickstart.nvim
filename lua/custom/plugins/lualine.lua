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
        tabline = {
            lualine_a = { 'buffers' },
            lualine_b = { 'diagnostics' },
            lualine_c = {},
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
    },
}
