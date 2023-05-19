local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local ok, lazy = pcall(require, "lazy")
if not ok then
	return
end

lazy.setup({
	-- "ellisonleao/gruvbox.nvim",
	-- "rose-pine/neovim",
	-- { "catppuccin/nvim", name = "catppuccin" },
	-- "navarasu/onedark.nvim",
	"rebelot/kanagawa.nvim",
	-- { "AstroNvim/astrotheme" },
	-- { "decaycs/decay.nvim", name = "decay" },
	"goolord/alpha-nvim",

	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
	"christoomey/vim-tmux-navigator",
	"nvim-tree/nvim-tree.lua",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"nvim-treesitter/nvim-treesitter-textobjects",
	"nvim-lua/plenary.nvim",
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({})
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = true,
	},

	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		lazy = true,
	},

	{
		"akinsho/bufferline.nvim",
		-- event = "VeryLazy",
		lazy = true,
	},

	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
		},
		opts = {
			theme = "catppuccin",
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
	},
	-- {
	-- 	"feline-nvim/feline.nvim",
	-- 	config = function()
	-- 		require("feline").setup({
	-- 			components = require("catppuccin.groups.integrations.feline").get(),
	-- 		})
	-- 	end,
	-- },
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
	},
	"rafamadriz/friendly-snippets",
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"glepnir/lspsaga.nvim",
	{
		"jose-elias-alvarez/null-ls.nvim",
		commit = "76d0573fc159839a9c4e62a0ac4f1046845cdd50",
	},
	"folke/trouble.nvim",

	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-path",
	{ "saadparwaiz1/cmp_luasnip" },
	{
		"akinsho/toggleterm.nvim",
	},
	"lewis6991/impatient.nvim",
	"norcalli/nvim-colorizer.lua",
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"dinhhuy258/git.nvim",
		lazy = true,
	},
})
