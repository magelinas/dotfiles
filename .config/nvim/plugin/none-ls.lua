vim.pack.add(
    {
        "https://github.com/nvimtools/none-ls-extras.nvim",
        "https://github.com/davidmh/cspell.nvim",
        "https://github.com/nvimtools/none-ls.nvim",
    }
)

require("null-ls").setup({
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
})

local null_ls = require("null-ls")
local cspell = require("cspell")
null_ls.setup({
    sources = {
        cspell.diagnostics,
        cspell.code_actions,
        null_ls.builtins.formatting.stylua,
        require("none-ls.diagnostics.ruff"),
    },
})

vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Buffer format" })
