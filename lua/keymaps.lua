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
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)
keymap("i", "<A-h>", "<ESC><C-w>h", opts)
keymap("i", "<A-j>", "<ESC><C-w>j", opts)
keymap("i", "<A-k>", "<ESC><C-w>k", opts)
keymap("i", "<A-l>", "<ESC><C-w>l", opts)
keymap('t', '<A-h>', [[<Cmd>wincmd h<CR>]], opts)
keymap('t', '<A-j>', [[<Cmd>wincmd j<CR>]], opts)
keymap('t', '<A-k>', [[<Cmd>wincmd k<CR>]], opts)
keymap('t', '<A-l>', [[<Cmd>wincmd l<CR>]], opts)

-- Press jkl fast to exit insert mode 
keymap("i", "``", "<ESC>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +3<CR>", opts)
keymap("n", "<C-Down>", ":resize -3<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -3<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +3<CR>", opts)

-- Quick exit terminal mode
keymap('t', '<C-x>', [[<C-\><C-n>]], opts)

-- Quick split terminal
keymap("n", "<leader>th", ":split | term<CR>", opts)
keymap("n", "<leader>tv", ":vsplit | term<CR>", opts)

-- Neovim tree
keymap("n", "<leader>e", ":NvimTreeFocus<CR>", opts)
