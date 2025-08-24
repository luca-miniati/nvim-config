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
    {
        "lervag/vimtex",
        lazy = false,     -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        init = function()
            -- VimTeX configuration goes here, e.g.
            vim.g.vimtex_view_method = "zathura"
        end
    },

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
    -- { "aktersnurra/no-clown-fiesta.nvim", name = "no-clown-fiesta" },
    { "rose-pine/neovim", name = "rose-pine" },
    -- { "L-Colombo/atlantic-dark.nvim" },
}

require("lazy").setup(plugins)
