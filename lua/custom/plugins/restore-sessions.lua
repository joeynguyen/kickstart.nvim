return {
  'folke/persistence.nvim',
  lazy = false,
  config = function()
    require("persistence").setup()

    -- Automatically load the session for the current directory when Neovim starts
    vim.api.nvim_create_autocmd("VimEnter", {
      once = true,
      callback = function()
        -- Load session if no args, or the only arg is a directory (e.g. nvim . from shell wrapper)
        local argc = vim.fn.argc()
        if argc == 0 or (argc == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1) then
          require("persistence").load()
        end
      end,
    })

    -- Fix for syntax highlighting when restoring sessions
    -- Session restoration can sometimes bypass the FileType autocmd or timing issues
    -- can cause Treesitter to not attach correctly. This forces a refresh.
    vim.api.nvim_create_autocmd("User", {
      pattern = "PersistenceLoadPost",
      callback = function()
        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_is_loaded(bufnr) then
            local ft = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
            if ft ~= "" and ft ~= "lazy" and ft ~= "alpha" and ft ~= "NvimTree" and ft ~= "neo-tree" then
              pcall(vim.treesitter.stop, bufnr)
              pcall(vim.treesitter.start, bufnr)
            end
          end
        end
      end,
    })
  end,
}
