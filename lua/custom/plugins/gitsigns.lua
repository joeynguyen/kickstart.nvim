return {
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  opts = {
    current_line_blame = true,
    -- See `:help gitsigns.txt`
    signs = {
      add = {
        text = '+',
      },
      change = {
        text = '~',
      },
      delete = {
        text = '_',
      },
      topdelete = {
        text = '‾',
      },
      changedelete = {
        text = '~',
      },
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map({ 'n', 'v' }, ']c', function()
        if vim.wo.diff then
          return ']c'
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return '<Ignore>'
      end, {
        expr = true,
        desc = 'Jump to next hunk',
      })

      map({ 'n', 'v' }, '[c', function()
        if vim.wo.diff then
          return '[c'
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return '<Ignore>'
      end, {
        expr = true,
        desc = 'Jump to previous hunk',
      })

      -- Actions
      -- visual mode
      map('v', '<leader>gs', function()
        gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, {
        desc = '[s]tage git hunk',
      })
      map('v', '<leader>gr', function()
        gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, {
        desc = '[r]eset git hunk',
      })
      -- normal mode
      map('n', '<leader>gs', gs.stage_hunk, {
        desc = '[s]tage hunk',
      })
      map('n', '<leader>gr', gs.reset_hunk, {
        desc = '[r]eset hunk',
      })
      map('n', '<leader>gS', gs.stage_buffer, {
        desc = '[S]tage buffer',
      })
      map('n', '<leader>gu', gs.undo_stage_hunk, {
        desc = '[U]ndo stage hunk',
      })
      map('n', '<leader>gR', gs.reset_buffer, {
        desc = '[R]eset buffer',
      })
      map('n', '<leader>gp', gs.preview_hunk, {
        desc = '[p]review git hunk',
      })
      map('n', '<leader>gb', function()
        gs.blame_line {
          full = false,
        }
      end, {
        desc = '[b]lame line',
      })
      map('n', '<leader>gB', gs.toggle_current_line_blame, {
        desc = '[B]lame line toggle',
      })
      map('n', '<leader>gd', gs.diffthis, {
        desc = '[d]iff against index',
      })
      map('n', '<leader>gD', function()
        gs.diffthis '~'
      end, {
        desc = '[D]iff against last commit',
      })
      map('n', '<leader>gt', gs.toggle_deleted, {
        desc = '[T]oggle git show deleted',
      })

      -- Text object
      map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', {
        desc = 'select git hunk',
      })
    end,
  },
}
