return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
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
    },
}
