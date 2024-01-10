local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
 nvim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	"nvim-telescope/telescope.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-treesitter/nvim-treesitter",
    
    --LaTeX
    "lervag/vimtex",

    -- lsp stuff
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },

    -- flutter
    {
        'akinsho/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim',
        },
        config = true,
    },

    "ThePrimeagen/harpoon",
    "ThePrimeagen/vim-be-good",
    "numToStr/Comment.nvim",

    -- colors
    { "rose-pine/neovim", name = "rose-pine" },
    { "navarasu/onedark.nvim", name = "onedark" },
    { "bluz71/vim-moonfly-colors", name = "moonfly" },
    { "miikanissi/modus-themes.nvim", name = "modus" },
}

require("lazy").setup(plugins)
