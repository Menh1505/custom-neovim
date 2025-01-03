local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Do not save data to clipboard when delete
keymap("n", "c", '"_c', opts)
keymap("n", "d", '"_d', opts)    

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Press jkl fast to exit insert mode 
keymap("i", "``", "<ESC>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +1<CR>", opts)
keymap("n", "<C-Down>", ":resize -1<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -1<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +1<CR>", opts)

-- Quick exit terminal mode
keymap('t', '<C-x>', [[<C-\><C-n>]], opts)

-- Quick split terminal
keymap("n", "<Space>th", ":split | term<CR>", opts)
keymap("n", "<Space>tv", ":vsplit | term<CR>", opts)
