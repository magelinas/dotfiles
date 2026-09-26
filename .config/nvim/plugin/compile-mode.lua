vim.pack.add(
    {
        "https://github.com/nvim-lua/plenary.nvim",
        "https://github.com/ej-shafran/compile-mode.nvim"
    }
)

---@module "compile-mode"
---@type CompileModeOpts
vim.g.compile_mode = {
    input_word_completion = true,
    focus_compilation_buffer = true,
    default_command = ""
}

vim.keymap.set({ "n" }, "<leader>cC", "<cmd>:Compile<CR>", { desc = "Compile" })
vim.keymap.set({ "n" }, "<leader>cc", "<cmd>:Recompile<CR>", { desc = "Recompile" })
