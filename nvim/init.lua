require("duyhung.options")
require("duyhung.plugins")
require("duyhung.maps")
require("duyhung.colorscheme")

if vim.g.neovide then
	-- Put anything you want to happen only in Neovide here
	vim.opt.guifont = { "JetbrainsMono Nerd Font", "h14", "b" }
	vim.g.neovide_scale_factor = 1.0
	vim.g.neovide_transparency = 0.0
	vim.g.neovide_background_color = "#1E1E2E"
	vim.api.nvim_set_keymap("n", "<c-c>", '"+y :let @+=@*<CR>', { noremap = true, silent = true })
	vim.api.nvim_set_keymap("v", "<c-c>", '"+y :let @+=@*<CR>', { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<c-v>", '"+p', { noremap = true, silent = true })
end
