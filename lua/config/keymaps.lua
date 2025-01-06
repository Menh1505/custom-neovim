local opts = { noremap = true, silent = true }
local nowaitOpts = { noremap = true, silent = true, nowait = true }
local map = vim.keymap.set

-- Enter conmmand
map("n", ";", ":", { desc = "CMD enter conmmand mode" })

-- Copy - Past - Select all
map("n", "<C-a>", "ggVG$", nowaitOpts)
map("i", "<C-a>", "<ESC>ggVG$i", nowaitOpts)
map("v", "<C-c>", "y", { noremap = true, nowait = true })
map("n", "<C-v>", "p", nowaitOpts)
map("i", "<C-v>", "<ESC>pi", nowaitOpts)
map("", "<C-z>", "<ESC>u", nowaitOpts)
map("i", "<C-z>", "<ESC>u", nowaitOpts)

-- Press `` fast to exit insert mode
map("i", "``", "<ESC>", opts)
map("v", "``", "<ESC>", opts)
map("n", "<C-q>", ":q<CR>", nowaitOpts)
map("t", "<C-q>", [[<C-\><C-n>]], opts) -- Exit insert mode interminal

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
