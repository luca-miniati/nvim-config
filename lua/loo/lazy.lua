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

local plugins = {
	"nvim-telescope/telescope.nvim",
	"nvim-lua/plenary.nvim",
	"nvim-treesitter/nvim-treesitter",
    "MunifTanjim/nui.nvim",
    "VonHeikemen/fine-cmdline.nvim",

    --LaTeX
    "lervag/vimtex",

    -- lsp stuff
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },

    {
        "vidocqh/data-viewer.nvim",
        opts = {},
        dependencies = {
            "nvim-lua/plenary.nvim",
        }
    },

    "ThePrimeagen/harpoon",
    "ThePrimeagen/vim-be-good",
    "numToStr/Comment.nvim",

    -- colors
    { "aktersnurra/no-clown-fiesta.nvim", name = "no-clown-fiesta" },
    { "rose-pine/neovim", name = "rose-pine" },
}

require("lazy").setup(plugins)
