return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        branch = "main",
        lazy = false,
        opts = {
            ensure_installed = { "c", "cpp", "lua", "go", "python", "vimdoc", "python", "markdown", "markdown_inline" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        },
    },
}
