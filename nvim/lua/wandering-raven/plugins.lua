local plugins = {
	-- Appearance
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = "nvim-lua/plenary.nvim",
	},
	"shaunsingh/nord.nvim",

	-- Completers
	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			{ "neovim/nvim-lspconfig" },

			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	},

	-- Formatters
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	},

	-- Navigation
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
	},
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
}

require("lazy").setup(plugins, {})
