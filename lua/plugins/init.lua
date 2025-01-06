-- check lazy.nvim existed? Install when non exist
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", 
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugin_configs = {}

-- Get all lua files in plugins
local plugin_files = vim.fn.globpath(vim.fn.stdpath("config") .. "/lua/plugins", "*.lua", false, true)

for _, file in ipairs(plugin_files) do
  -- Ignore file plugins/init.lua
  if not file:match("init.lua$") then
    local plugin = dofile(file)
    table.insert(plugin_configs, plugin)
  end
end

require("lazy").setup(plugin_configs)
