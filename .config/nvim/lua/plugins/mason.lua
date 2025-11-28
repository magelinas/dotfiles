return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        dependencies = {
            "williamboman/mason-lspconfig",
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-dap",
            "jay-babu/mason-nvim-dap.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                automatic_installation = false,
                ensure_installed = {
                    "gopls",
                    "pyright",
                    "clangd",
                    "harper_ls",
                },
            })
            require("mason-nvim-dap").setup({
                automatic_installation = false,
                ensure_installed = {
                    "debugpy",
                    "delve",
                    "codelldb",
                },
            })
        end,
    },
}
