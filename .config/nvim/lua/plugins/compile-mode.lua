return {
    "ej-shafran/compile-mode.nvim",
    version = "^5.0.0",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- { "m00qek/baleia.nvim", tag = "v1.3.0" },
    },
    config = function()
        ---@type CompileModeOpts
        vim.g.compile_mode = {
            default_command = "",
            focus_compilation_buffer = true,
            input_word_completion = true,

            -- to add ANSI escape code support, add:
            -- baleia_setup = true,

            -- to make `:Compile` replace special characters (e.g. `%`) in
            -- the command (and behave more like `:!`), add:
            -- bang_expansion = true,
        }
    end,
    keys = {
        {
            "<leader>cc",
            "<cmd>Compile<cr>",
            desc = "Compile prompt",
        },
        {
            "<leader>cC",
            "<cmd>Recompile<cr>",
            desc = "Recompile",
        },
    },
}
