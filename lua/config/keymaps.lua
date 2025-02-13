local opts = { noremap = true, silent = true }
local nowaitOpts = { noremap = true, silent = true, nowait = true }
local map = vim.keymap.set

-- Do not save data to clipboard when delete
map("n", "c", '"_c', opts)
map("v", "c", '"_c', opts)
map("n", "d", '"_d', opts)
map("v", "d", '"_d', opts)

-- Enter conmmand
map("n", ";", ":", { desc = "CMD enter conmmand mode" })

-- Press `` fast to exit insert mode
map("n", "<C-q>", ":q<CR>", nowaitOpts)
map("t", "<C-q>", [[<C-\><C-n>]], opts) -- Exit insert mode interminal

-- Diagnostics
map("n", "<leader>xo", vim.diagnostic.open_float, { desc = "Show Diagnostic Float" })

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
