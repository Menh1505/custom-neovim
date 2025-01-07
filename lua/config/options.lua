local opt = vim.opt -- setting
local g = vim.g --setting global

vim.g.lazyvim_picker = "telescope"

-- Padding
if vim.g.neovide then
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0

  g.neovide_transparency = 0.95 -- Transparent
  g.neovide_window_blurred = true

  g.neovide_floating_blur_amount_x = 2.0
  g.neovide_floating_blur_amount_y = 2.0

  g.neovide_scroll_animation_length = 0.5
  g.neovide_scroll_animation_far_lines = 1

  g.neovide_cursor_animation_length = 0.3
  g.neovide_cursor_trail_size = 0.5
  g.neovide_cursor_vfx_mode = "railgun"
  g.neovide_cursor_vfx_opacity = 500.0
  g.neovide_cursor_vfx_particle_lifetime = 5.0
  g.neovide_cursor_vfx_particle_phase = 1.5
end

opt.guifont = "0xProto Nerd Font" -- Font

opt.backup = false -- creates a backup file
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard

scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.title = true
opt.autoindent = true
opt.smartindent = true
opt.hlsearch = true
opt.showcmd = true
opt.cmdheight = 0
opt.laststatus = 0
opt.expandtab = true
opt.scrolloff = 10
opt.inccommand = "split"
opt.ignorecase = true
opt.smarttab = true
opt.breakindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.wrap = false
opt.backspace = { "start", "eol", "indent" }
opt.path:append({ "**" })
opt.wildignore:append({ "*/node_modules/*" })
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "cursor"
opt.mouse = ""

opt.formatoptions:append({ "r" })

-- Powershell for window
opt.shell = "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"
opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
opt.shellquote = '"'
opt.shellxquote = ""
