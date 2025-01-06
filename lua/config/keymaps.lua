local opts = { noremap = true, silent = true }
local nowaitOpts = { noremap = true, silent = true, nowait = true }
local keymap = vim.keymap.set

-- Copy - Past - Select all
keymap("n", "<C-a>", "ggVG$", nowaitOpts)
keymap("i", "<C-a>", "<ESC>ggVG$i", nowaitOpts)
keymap("v", "<C-c>", "y", { noremap = true, nowait = true })
keymap("n", "<C-v>", "p", nowaitOpts)
keymap("i", "<C-v>", "<ESC>pi", nowaitOpts)

-- Press `` fast to exit insert mode
keymap("i", "``", "<ESC>", opts)
keymap("v", "``", "<ESC>", opts)
keymap("n", "<C-q>", ":q<CR>", nowaitOpts)
keymap("t", "<C-q>", [[<C-\><C-n>]], opts) -- Exit insert mode interminal

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
