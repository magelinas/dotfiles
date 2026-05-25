vim.pack.add({
    "https://github.com/rebelot/kanagawa.nvim"
})

require("kanagawa").setup({
    opts = {
        transparent = false,
        theme = "dragon",
    },
})

vim.cmd("colorscheme kanagawa")
