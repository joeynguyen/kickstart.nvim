-- Simple health check for your Neovim setup
local M = {}

function M.check_startup_time()
  local start_time = vim.fn.reltime()
  -- Simulate some work
  vim.wait(10)
  local elapsed = vim.fn.reltimestr(vim.fn.reltime(start_time))
  print("Startup check completed in: " .. elapsed .. "s")
end

function M.check_plugins()
  local lazy_ok, lazy = pcall(require, 'lazy')
  if not lazy_ok then
    print("❌ Lazy.nvim not loaded")
    return false
  end
  
  local stats = lazy.stats()
  print("✅ Plugins loaded: " .. stats.loaded .. "/" .. stats.count)
  print("⏱️  Startup time: " .. math.floor(stats.startuptime * 100) / 100 .. "ms")
  
  if stats.startuptime > 100 then
    print("⚠️  Startup time is high (>100ms)")
  end
  
  return true
end

function M.check_lsp()
  local clients = vim.lsp.get_active_clients()
  if #clients == 0 then
    print("⚠️  No LSP clients active")
    return false
  end
  
  print("✅ Active LSP clients:")
  for _, client in ipairs(clients) do
    print("  - " .. client.name)
  end
  return true
end

function M.run_all()
  print("🔍 Running Neovim Health Check...")
  print("================================")
  
  M.check_startup_time()
  M.check_plugins()
  M.check_lsp()
  
  print("================================")
  print("✅ Health check completed!")
end

-- Command to run health check
vim.api.nvim_create_user_command('HealthCheck', M.run_all, {})

return M 
