require("nvim-devdocs").setup({
    float_win = { -- passed to nvim_open_win(), see :h api-floatwin
        relative = "editor",
        row = 2,
        col = 17,
        height = 35,
        width = 140,
        border = "rounded",
    },
    previewer_cmd = "glow",
    cmd_args = { "-s", "dark", "-w", "125" },
    picker_cmd = "glow",
    picker_cmd_args = { "-s", "dark", "-w", "50" },
})
