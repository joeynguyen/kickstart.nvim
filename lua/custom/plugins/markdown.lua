return {
    'toppair/peek.nvim',
    event = { 'VeryLazy' },
    build = 'deno task --quiet build:fast', -- requires that deno be installed on this system first
    config = function()
        require('peek').setup()
        -- refer to `configuration to change defaults`
        vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
        vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    end,
}

-- another Markdown Preview plugin
-- {"ellisonleao/glow.nvim", config = true, cmd = "Glow"}
