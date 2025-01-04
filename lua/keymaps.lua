local opts = { noremap = true, silent = true }
local nowaitOpts = {noremap = true, silent = true, nowait = true}
local keymap = vim.keymap.set
local builtin = require('telescope.builtin')

-- keymap("", "", "", opts)
-- Do not save data to clipboard when delete
keymap("n", "c", '"_c', opts)
keymap("n", "d", '"_d', opts)    

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

-- Copy - Past - Select all
keymap("n", "<C-a>", "ggVG$", nowaitOpts) 
keymap("v", "<C-c>", "y", {noremap = true, nowait = true})
keymap("n", "<C-v>", "p", nowaitOpts)

-- Undo - Redo
keymap("n", "<C-z>", "u", nowaitOpts)
keymap("n", "<C-y>", "<C-r>", nowaitOpts)

-- Save
keymap("n", "<C-s>", ":w<CR>", nowaitOpts)

-- Quit
keymap("n", "<C-q>", ":q<CR>", nowaitOpts)
keymap('t', '<C-q>', [[<C-\><C-n>]], opts) -- For terminal

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

-- Tab
keymap("n", "<leader>ta", ":tabnew<CR>", opts)
keymap("n", "<leader>tn", ":tabNext<CR>", opts)
keymap("n", "<leader>to", ":tabonly<CR>", opts)

-- Buffer
keymap("n", "<leader>ba", ":badd<CR>", opts)
keymap("n", "<leader>bd", ":bdelete<CR>", opts)
keymap("n", "<leader>bo", ":%bd|edit#|bd#<CR>", opts)
keymap("n", "<tab>", ":bNext<CR>", opts)
keymap("n", "<S-tab>", ":bprevious", opts)

-- Press `` fast to exit insert mode 
keymap("i", "``", "<ESC>", opts)
keymap("v", "``", "<ESC>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv^", opts)
keymap("v", ">", ">gv^", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +3<CR>", opts)
keymap("n", "<C-Down>", ":resize -3<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -3<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +3<CR>", opts)

-- Quick split terminal
keymap("n", "<leader>th", ":split | term<CR>", opts)
keymap("n", "<leader>tv", ":vsplit | term<CR>", opts)

-- Neovim tree
keymap("n", "<leader>e", ":NvimTreeFocus<CR>", opts)

-- Find
keymap('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
keymap('n', '<leader>fg', builtin.live_grep, { desc = 'Find live grep' })
keymap('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
keymap('n', '<leader>fh', builtin.help_tags, { desc = 'Find help tags' })
keymap('n', '<leader>fm', builtin.keymaps, {desc = 'Find keymaps'})
