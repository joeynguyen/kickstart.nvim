-- Fuzzy Finder (files, lsp, etc)
return {
  { 'nvim-telescope/telescope-ui-select.nvim' },
  {
    'nvim-telescope/telescope-frecency.nvim',
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim', -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    config = function()
      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        defaults = {
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
            '--glob=!**/.git/*',
            '--glob=!**/node_modules/*',
            '--glob=!**/patches/*',
            '--glob=!**/dist/*',
            '--glob=!**/build/*',
            '--glob=!**/.next/*',
            '--glob=!**/coverage/*',
          },
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
            },
            n = {
              -- alternative to "Esc" for quitting/closing Telescope
              ['q'] = require('telescope.actions').close,
              ['d'] = require('telescope.actions').delete_buffer,
              ['J'] = require('telescope.actions').preview_scrolling_down,
              ['K'] = require('telescope.actions').preview_scrolling_up,
            },
          },
          -- workspace_scan_cmd = 'LUA',
          file_ignore_patterns = {
            '*.git',
            '*.css.map',
            '*.js.map',
            '*.min.css',
            '*.min.js',
            '*.svg',
            'public/@apollographql/*',
            'node_modules',
          },
          ignore_patterns = { '^.git/' },
          layout_config = {
            -- full screen
            width = { padding = 0 },
            height = { padding = 0 },
            preview_width = 0.55,
          },
          path_display = {
            -- shorten = 5,
            'tail',
            -- `filename_first` doesn't seem to work - https://github.com/nvim-telescope/telescope.nvim/issues/3157
            -- "filename_first",
            filename_first = {
              reverse_directories = true,
            },
          },
        },
        extensions = {
          ['ui-select'] = { require('telescope.themes').get_dropdown {} },
          frecency = {
            -- https://github.com/nvim-telescope/telescope-frecency.nvim/blob/master/doc/telescope-frecency.txt
            -- initial_mode = 'normal',
            prompt_title = 'telescope-frecency',
            default_workspace = 'CWD',
            -- don't show the CWD path at the beginning of results
            show_filter_column = false,
            show_unindexed = true,
            -- workspace_scan_cmd = 'LUA', -- fix for https://github.com/nvim-telescope/telescope-frecency.nvim/issues/211
            show_scores = false,
            db_safe_mode = false,
            auto_validate = false,
            recency_values = {
              { age = 1, value = 10000 }, -- past 1 mins
              { age = 5, value = 7000 }, -- past 5 mins
              { age = 30, value = 3000 }, -- past 30 mins
              { age = 60, value = 1000 }, -- past 1 hour
              { age = 120, value = 500 }, -- past 2 hours
              { age = 240, value = 100 }, -- past 4 hours
              { age = 1440, value = 80 }, -- past day
              { age = 4320, value = 60 }, -- past 3 days
              { age = 10080, value = 40 }, -- past week
              { age = 43200, value = 20 }, -- past month
              { age = 129600, value = 10 }, -- past 90 days
            },
            -- ignore_patterns = { '*.git' },
          },
        },
        pickers = {
          buffers = {
            -- ignore_current_buffer = true,
            sort_mru = true,
            sort_lastused = true,
            initial_mode = 'normal',
            -- theme = 'ivy',
          },
          oldfiles = {
            initial_mode = 'normal',
          },
        },
      }
      require('telescope').load_extension 'ui-select'
      require('telescope').load_extension 'frecency'
      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')

      local builtin = require 'telescope.builtin'

      -- Telescope live_grep in git root
      -- Function to find the git root directory based on the current buffer's path
      local function find_git_root()
        -- Use the current buffer's path as the starting point for the git search
        local current_file = vim.api.nvim_buf_get_name(0)
        local current_dir
        local cwd = vim.fn.getcwd()
        -- If the buffer is not associated with a file, return nil
        if current_file == '' then
          current_dir = cwd
        else
          -- Extract the directory from the current file's path
          current_dir = vim.fn.fnamemodify(current_file, ':h')
        end

        -- Find the Git root directory from the current file's path
        local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
        if vim.v.shell_error ~= 0 then
          print 'Not a git repository. Searching on current working directory'
          return cwd
        end
        return git_root
      end

      -- Custom live_grep function to search in git root
      local function live_grep_git_root()
        local git_root = find_git_root()
        if git_root then
          builtin.live_grep {
            search_dirs = { git_root },
          }
        end
      end

      vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

      vim.keymap.set('n', '<leader>k', builtin.keymaps, { desc = '[K]eymaps' })

      -- See `:help telescope.builtin`
      vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Find file by name' })
      vim.keymap.set('n', '<leader>j', function()
        require('telescope').extensions.frecency.frecency {}
      end, { desc = 'Frecency search' })

      -- Return/Enter key (also Ctrl+m)
      vim.keymap.set('n', '<CR>', builtin.buffers, { desc = 'View current open buffers' })
      -- vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'View current open buffers' })

      -- to exclude multiple folders: additional_args = { '-g', '!node_modules/', '-g', '!dist/', '-g', '!vendor/' }
      vim.keymap.set('n', '<C-f>', function()
        builtin.live_grep {
          additional_args = function()
            return { '-g', '!patches/' }
          end,
        }
      end, { desc = 'Search for text in project (excluding patches/)' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ile [G]rep' })
      vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = '[F]iles [R]ecently opened' })

      -- vim.keymap.set('n', '<leader><space>', builtin.buffers, {
      --   desc = '[ ] View current buffers',
      -- })
      -- vim.keymap.set('n', '<C-m>', builtin.buffers, { desc = 'Select from current buffers' })
      -- vim.keymap.set('n', '<C-g>', builtin.oldfiles, { desc = 'Select from recent files' })
      -- vim.keymap.set('n', '<BS>', builtin.oldfiles, { desc = 'Select from recent files' })

      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, {
        desc = '[/] Fuzzily search in current buffer',
      })

      local function telescope_live_grep_open_files()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end
      vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, {
        desc = '[S]earch [/] in Open Files',
      })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, {
        desc = '[S]earch [S]elect Telescope',
      })
      vim.keymap.set('n', '<leader>gf', builtin.git_files, {
        desc = 'Search Git [F]iles',
      })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, {
        desc = '[S]earch [F]iles',
      })
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, {
        desc = '[S]earch [H]elp',
      })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, {
        desc = '[S]earch current [W]ord',
      })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, {
        desc = '[S]earch by [G]rep',
      })
      vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', {
        desc = '[S]earch by [G]rep on Git Root',
      })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, {
        desc = '[S]earch [D]iagnostics',
      })
      vim.keymap.set('n', '<leader>sr', builtin.resume, {
        desc = '[S]earch [R]esume',
      })
    end,
  },
}
