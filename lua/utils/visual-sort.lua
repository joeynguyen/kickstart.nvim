-- Function that sorts the current visual selection
local function visual_sort()
  -- Save the current view (cursor position, folds, etc.) so we can restore it later
  local view       = vim.fn.winsaveview()

  -- Get the start and end line numbers of the visual selection.
  -- '< and '> are marks set by entering visual mode.
  local start_line = vim.fn.getpos("'<")[2]
  local end_line   = vim.fn.getpos("'>")[2]

  -- Ensure start <= end (the user might have selected backwards)
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end

  -- Build the range string for the :sort command, e.g. "10,20"
  local range = string.format("%d,%d", start_line, end_line)

  -- Execute the sort command on that range.
  -- The 'i' flag makes the sort case‑insensitive; remove it if you want case‑sensitive.
  vim.cmd(string.format("%s sort i", range))

  -- Restore the view so the cursor stays where it was before sorting.
  vim.fn.winrestview(view)
end

-- Create a user command that can be called from visual mode
vim.api.nvim_create_user_command(
  "VisualSort",
  visual_sort,
  { range = true, desc = "Sort the currently selected lines" }
)

-- Optional: map it to a convenient key in visual mode.
-- Here we bind <leader>s (you can change the lhs to whatever you like).
vim.keymap.set("v", "<leader>s", ":<C-u>VisualSort<CR>", { silent = true, noremap = true })
