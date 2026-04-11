vim.pack.add(
    {
        "https://github.com/nvim-lua/plenary.nvim",
        "https://github.com/nvim-treesitter/nvim-treesitter",
        "https://github.com/olimorris/codecompanion.nvim",
    }
)

require("codecompanion").setup(
    {
        strategies = {
            -- Change the default chat adapter and model
            chat = {
                adapter = "qwen",
            },
        },
        adapters = {
            http = {
                qwen = function()
                    return require("codecompanion.adapters").extend("ollama", {
                        name = "qwen",
                        schema = {
                            model = {
                                default = "qwen3-coder:30b",
                            },
                            keep_alive = {
                                default = "30m",
                            },
                        },
                    })
                end,
            },
        },
        -- NOTE: The log_level is in `opts.opts`
        opts = {
            log_level = "DEBUG",
        },
    }
)

vim.keymap.set("n", "<leader>ai", "<cmd>CodeCompanionChat<CR>", { desc = "Toggle Code Companion Chat" })
