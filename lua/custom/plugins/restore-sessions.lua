return {
  'folke/persistence.nvim',
  lazy = false,
  init = function()
    -- Automatically load the session for the current directory when Neovim starts
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        -- Only load if no arguments were passed
        if vim.fn.argc() == 0 then
          require("persistence").load()
        end
      end,
    })
  end
}
