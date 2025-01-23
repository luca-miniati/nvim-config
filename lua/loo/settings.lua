vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.swapfile = false

vim.opt.wrap = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 10

vim.g.mapleader = " "

vim.api.nvim_command("highlight ColorColumn ctermbg=darkgrey guibg=#3a3a3a")
vim.api.nvim_command("set colorcolumn=100")
vim.api.nvim_command("set cursorline")
vim.cmd([[ command! -nargs=0 W w ]])

vim.api.nvim_command("set foldmethod=marker")
