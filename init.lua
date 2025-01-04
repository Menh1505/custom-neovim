require "plugins" -- Load plugins from plugins/
require "colorscheme" -- Autoload theme
require "options"
require "keymaps"
require("lspconfig.health").check()
require("nvim-lsp-installer.health").check()
