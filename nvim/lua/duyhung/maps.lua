vim.g.mapleader = " "
-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }
local maps = { i = {}, n = {}, v = {}, t = {} }

-- Telescope
--keymap("n", ';f', ":Telescope find_files<CR>", opts)
--keymap("n", ";t", ":Telescope live_grep<CR>", opts)
--keymap("n", ";p", ":Telescope projects<CR>", opts)
--keymap("n", ";;", ":Telescope buffers<CR>", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Split window
keymap("n", "ss", ":split<Return><C-w>w")
keymap("n", "sv", ":vsplit<Return><C-w>w")
keymap("n", "sc", ":close<CR>") --close current split window

-- Move window
-- keymap("n", "<Space>", "<C-w>w")
-- keymap("", "<C-h>", "<C-w>h")
-- keymap("", "<C-k>", "<C-w>k")
-- keymap("", "<C-j>", "<C-w>j") --cant use dont know why
-- keymap("", "<C-l>", "<C-w>l")

-- Insert --
keymap("i", "jj", "<ESC>")
-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Select all
keymap("n", "<C-a>", "gg<S-v>G")

-- Copy and Paste to clipboard
vim.api.nvim_set_keymap("n", "<c-c>", '"+y :let @+=@*<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<c-c>", '"+y :let @+=@*<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<c-v>", '"+p', { noremap = true, silent = true })

--clear search highlighting
vim.api.nvim_set_keymap("n", "<leader>h", ":noh<cr>", { noremap = true })

--toggle term
keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>")
keymap("n", "<leader>th", "<cmd>ToggleTerm size=15 direction=horizontal<cr>")
keymap("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>")
