return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
        "davidmh/cspell.nvim",
    },
    opts = function(_, opts)
        local cspell = require("cspell")
        opts.sources = opts.sources or {}
        table.insert(
            opts.sources,
            cspell.diagnostics.with({
                diagnostics_postprocess = function(diagnostic)
                    diagnostic.severity = vim.diagnostic.severity.HINT
                end,
            })
        )
        table.insert(opts.sources, cspell.code_actions)
    end,
    config = function()
        local null_ls = require("null-ls")
        local cspell = require("cspell")
        null_ls.setup({
            sources = {
                cspell.diagnostics,
                cspell.code_actions,
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.gofumpt,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.goimports,
                null_ls.builtins.diagnostics.golangci_lint,
                require("none-ls.diagnostics.ruff"),
            },
        })
    end,
    keys = {
        {
            "<leader>gf",
            vim.lsp.buf.format,
            desc = "Buffer format",
        },
    },
}
