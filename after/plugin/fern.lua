vim.g["fern#renderer"] = "nerdfont"
vim.api.nvim_set_keymap('n', '<leader>e', ':Fern %:h<CR>', { noremap = true, silent = true })


vim.api.nvim_create_augroup("my_glyph_palette", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "my_glyph_palette",
  pattern = { "fern" },
  callback = function()
    vim.fn["glyph_palette#apply"]()
  end,
})
