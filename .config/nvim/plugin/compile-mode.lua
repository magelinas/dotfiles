vim.pack.add(
    {
        "https://github.com/nvim-lua/plenary.nvim",
        "https://github.com/ej-shafran/compile-mode.nvim",
    }
)

vim.g.compile_mode = {
    default_command = "",
    focus_compilation_buffer = true,
    input_word_completion = true,
}

vim.keymap.set("n", "<leader>cc", "<cmd>Compile<CR>", { desc = "Compile prompt" })
vim.keymap.set("n", "<leader>cC", "<cmd>Recompile<CR>", { desc = "Recompile" })
