vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" }
})

require("nvim-treesitter").setup({
    opts = {
        ensure_installed = { "c", "cpp", "lua", "go", "python", "vimdoc", "python", "markdown", "markdown_inline", "zig" },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
    },
})
