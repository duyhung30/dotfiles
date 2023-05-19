-- local map = vim.keymap.set
-- local present, saga = pcall(require, "lspsaga")
--
-- if not present then
-- 	return
-- end
--
-- saga.init_lsp_saga({
-- 	border_style = "rounded",
-- 	symbol_in_winbar = {
-- 		enable = false,
-- 	},
-- })
--
-- -- Lsp finder find the symbol definition implement reference
-- -- if there is no implement it will hide
-- -- when you use action in finder like open vsplit then you can
-- -- use <C-t> to jump back
-- map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
--
-- -- Rename
-- map("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
-- --
-- -- Outline
-- map("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", { silent = true })
--
-- -- Hover Doc
-- map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
--

local present, saga = pcall(require, "lspsaga")

if not present then
	return
end

saga.setup({
	ui = {
		winblend = 10,
		border = "rounded",
		colors = {
			normal_bg = "#303446",
		},
		-- kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
	},
})

-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back

local diagnostic = require("lspsaga.diagnostic")
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)

vim.keymap.set("n", "gl", "<Cmd>Lspsaga show_diagnostic<CR>", opts)
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", opts)
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)

vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)

-- code action
local codeaction = require("lspsaga.codeaction")
vim.keymap.set("n", "<leader>ca", function()
	codeaction:code_action()
end, { silent = true })
vim.keymap.set("v", "<leader>ca", function()
	vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))

	codeaction:range_code_action()
end, { silent = true })
