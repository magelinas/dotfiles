vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter"
})

require("nvim-treesitter").setup({
        opts = {
            ensure_installed = { "c", "cpp", "lua", "go", "python", "vimdoc", "python", "markdown", "markdown_inline" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        },
})
