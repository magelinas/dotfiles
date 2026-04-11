vim.pack.add({
    "https://github.com/folke/tokyonight.nvim"
})

require("tokyonight").setup({
    opts = {
        transparent = true,
        styles = {
            sidebars = "transparent",
            floats = "transparent",
        },
    },
})

vim.cmd([[colorscheme tokyonight]])
