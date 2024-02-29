-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return { -- NOTE: First, some plugins that don't require any configuration
    -- Git related plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb', -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    -- NOTE: This is where your plugins related to LSP can be installed.
    --  The configuration is done below. Search for lspconfig to find it below.
    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = { -- Automatically install LSPs to stdpath for neovim
            {
                'williamboman/mason.nvim',
                config = true
            },
            'williamboman/mason-lspconfig.nvim', -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            {
                'j-hui/fidget.nvim',
                opts = {}
            },
            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim'
        }
    },
    {
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
                end)()
            },
            'saadparwaiz1/cmp_luasnip',                 -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path', -- Adds a number of user-friendly snippets
            'rafamadriz/friendly-snippets'
        }
    },
    {
        -- Useful plugin to show you pending keybinds.
        'folke/which-key.nvim',
        opts = {}
    },
    {
        -- "gc" to comment visual regions/lines
        'numToStr/Comment.nvim',
        opts = {}
    },
    -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
    --       These are some example plugins that I've included in the kickstart repository.
    --       Uncomment any of the lines below to enable them.
    require 'kickstart.plugins.autoformat',
    -- require 'kickstart.plugins.debug',
}
