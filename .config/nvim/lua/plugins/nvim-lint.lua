return {
    "mfussenegger/nvim-lint",
    lazy = true,
    opts = {
        linters_by_ft = {
            go = { "golangcilint" },
            python = { "ruff" },
        },
    },
    config = function()
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                require("lint").try_lint()
                require("lint").try_lint("cspell")
            end,
        })
    end,
}
