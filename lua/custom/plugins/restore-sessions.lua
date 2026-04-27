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
  end,
}
