local plugins = {
    -- Appearance
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    'shaunsingh/nord.nvim',

    -- Completers
    'windwp/nvim-autopairs',
    'windwp/nvim-ts-autotag',
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            { 'neovim/nvim-lspconfig' },

            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    },

    -- Formatters
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup()
        end,
    },

    -- Navigation
    'theprimeagen/harpoon',
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    'tpope/vim-fugitive',
    { 'akinsho/toggleterm.nvim',         version = "*",      config = true },
}

local opts = {}

require("lazy").setup(plugins, opts)

