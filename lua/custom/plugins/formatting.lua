return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>ff',
      function()
        require('conform').format {
          async = true,
          lsp_format = 'fallback',
        }
      end,
      mode = '',
      desc = '[F]ormat [F]ile',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- List of filenames and paths to ignore
      local ignore_patterns = {
        '^lazy%-lock%.json$', -- Lazy.nvim lock file
        '^node_modules/',     -- any file under a node_modules folder
        '^%.git/',            -- any .git‑internal file
        -- add more patterns as you need
        -- '/path/to/ignored/file.txt',
        -- '/path/to/ignored/directory/',
        -- 'specific_filename_to_ignore.py',
      }

      -- Helper that decides whether the current buffer should be skipped
      local function should_ignore()
        local rel_path = vim.fn.expand('%:.') -- path relative to cwd
        -- vim.notify("Checking file: " .. rel_path) -- uncomment to debug print
        for _, pat in ipairs(ignore_patterns) do
          -- vim.notify("Testing pattern: " .. pat)  -- uncomment to debug print
          if string.find(rel_path, pat) then
            -- vim.notify("MATCHED: " .. rel_path)   -- uncomment to debug print
            return true
          end
        end
        return false
      end

      if should_ignore() then
        -- tell the plugin “don’t run any formatter for this buffer”,
        -- not returning a Lua table == no formatting
        return nil
      end
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      local lsp_format_opt
      if disable_filetypes[vim.bo[bufnr].filetype] then
        lsp_format_opt = 'never'
      else
        lsp_format_opt = 'fallback'
      end
      return {
        lsp_format = lsp_format_opt,
        timeout_ms = 1000,
      }
    end,
    formatters = {
      ['markdown-toc'] = {
        condition = function(_, ctx)
          for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
            if line:find '<!%-%- toc %-%->' then
              return true
            end
          end
        end,
      },
      ['markdownlint-cli2'] = {
        condition = function(_, ctx)
          local diag = vim.tbl_filter(function(d)
            return d.source == 'markdownlint'
          end, vim.diagnostic.get(ctx.buf))
          return #diag > 0
        end,
      },
    },
    formatters_by_ft = {
      kotlin = { 'ktlint' },
      -- disabled stylua because it conflicts with lua_ls's align_continuous_rect_table_field
      -- lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      python = { 'isort', 'black' },
      --
      -- You can use 'stop_after_first' to run the first available formatter from the list
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
      javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      typescript = { 'prettierd', 'prettier', stop_after_first = true },
      typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },

      json = { 'prettierd', 'prettier', stop_after_first = true },

      ['markdown'] = { 'prettier', 'markdownlint-cli2', 'markdown-toc' },
      ['markdown.mdx'] = { 'prettier', 'markdownlint-cli2', 'markdown-toc' },
      -- yaml = { 'yamlfix' },
    },
  },
}
