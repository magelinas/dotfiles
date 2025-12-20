vim.lsp.config("rust_analyzer", {
    filetypes = { "rust" },
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },
        },
    },
})

vim.lsp.enable("rust_analyzer")
