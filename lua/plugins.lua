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

require("lazy").setup({
  {
    "nvim-lualine/lualine.nvim", 
    config = function()
      require("lualine").setup()
    end,
  },
  {
    "nvim-tree/nvim-tree.lua", 
    config = function()
      require("nvim-tree").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter", 
    run = ":TSUpdate",
  },
})

