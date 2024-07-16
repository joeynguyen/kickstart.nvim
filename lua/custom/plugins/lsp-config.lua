return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = { -- Automatically install LSPs to stdpath for neovim
    -- needs to be before mason-lspconfig so that this plugin detects and assigns the 'helm' filetype
    {
      -- Helm Language Server - Yaml
      'towolf/vim-helm',
      config = function()
        local lspconfig = require 'lspconfig'

        -- setup helm-ls
        lspconfig.helm_ls.setup {
          settings = {
            ['helm-ls'] = {
              yamlls = {
                path = 'yaml-language-server',
              },
            },
          },
        }

        -- setup yamlls
        lspconfig.yamlls.setup {}
      end,
    },
    -- mason-lspconfig requires that these plugins are called in this order
    {
      'williamboman/mason.nvim',
      config = function()
        -- before setting up the servers.
        require('mason').setup()
      end,
    },
    {
      'williamboman/mason-lspconfig.nvim', -- Useful status updates for LSP
      dependencies = {
        'hrsh7th/cmp-nvim-lsp',
      },
      config = function()
        --  This function gets run when an LSP connects to a particular buffer.
        local on_attach = function(_, bufnr)
          -- NOTE: Remember that lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself
          -- many times.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local nmap = function(keys, func, desc)
            if desc then
              desc = 'LSP: ' .. desc
            end

            vim.keymap.set('n', keys, func, {
              buffer = bufnr,
              desc = desc,
            })
          end

          nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          -- nmap('<leader>rn', ':IncRename ', '[R]e[n]ame')
          nmap('<leader>ca', function()
            vim.lsp.buf.code_action {
              context = {
                only = { 'quickfix', 'refactor', 'source' },
              },
            }
          end, '[C]ode [A]ction')

          nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          -- nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
          -- nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
          -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols,
          --     '[W]orkspace [S]ymbols')

          -- See `:help K` for why this keymap
          nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
          nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

          -- Lesser used LSP functionality
          nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          -- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
          -- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
          -- nmap('<leader>wl', function()
          --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          -- end, '[W]orkspace [L]ist Folders')

          -- Create a command `:Format` local to the LSP buffer
          vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
            vim.lsp.buf.format()
          end, {
            desc = 'Format current buffer with LSP',
          })

          -- if vim.bo[bufnr].buftype ~= '' or vim.bo[bufnr].filetype == 'helm' then
          --   vim.diagnostic.disable()
          -- end
          if vim.bo[bufnr].buftype ~= '' or vim.bo[bufnr].filetype == 'helm' then
            vim.diagnostic.disable(bufnr)
            vim.defer_fn(function()
              vim.diagnostic.reset(nil, bufnr)
            end, 1000)
          end
        end

        -- Enable the following language servers
        --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
        --
        --  Add any additional override configuration in the following tables. They will be passed to
        --  the `settings` field of the server config. You must look up that documentation yourself.
        --
        --  If you want to override the default filetypes that your language server will attach to you can
        --  define the property 'filetypes' to the map in question.
        local servers = {
          -- gopls = {},
          pyright = {},
          -- rust_analyzer = {},
          tsserver = {},
          html = { filetypes = { 'html', 'twig', 'hbs' } },

          lua_ls = {
            Lua = {
              diagnostics = {
                globals = { 'vim' },
              },
              workspace = {
                checkThirdParty = false,
              },
              telemetry = {
                enable = false,
              },
              -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        }

        -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        -- Ensure the servers above are installed
        local mason_lspconfig = require 'mason-lspconfig'

        mason_lspconfig.setup {
          ensure_installed = vim.tbl_keys(servers),
        }

        -- set up every language server specified in the `servers` table variable
        mason_lspconfig.setup_handlers {
          function(server_name)
            require('lspconfig')[server_name].setup {
              capabilities = capabilities,
              on_attach = on_attach,
              settings = servers[server_name],
              filetypes = (servers[server_name] or {}).filetypes,
            }
          end,
        }
      end,
    },
    {
      'j-hui/fidget.nvim',
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      opts = {},
    },
    -- this plugin is nice but currently has issues with renaming variables exported and imported
    -- in React/Typescript
    -- {
    --   'smjonas/inc-rename.nvim',
    --   config = function()
    --     require('inc_rename').setup()
    --   end,
    -- },
    {
      'folke/lazydev.nvim',
      ft = 'lua', -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = 'luvit-meta/library', words = { 'vim%.uv' } },
        },
      },
    },
    { 'Bilal2453/luvit-meta', lazy = true }, -- optional `vim.uv` typings
    {                                        -- optional completion source for require statements and module annotations
      'hrsh7th/nvim-cmp',
      opts = function(_, opts)
        opts.sources = opts.sources or {}
        table.insert(opts.sources, {
          name = 'lazydev',
          group_index = 0, -- set group index to 0 to skip loading LuaLS completions
        })
      end,
    },
  },
}
