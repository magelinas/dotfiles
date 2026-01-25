vim.keymap.set("n", "<leader>cg", "<cmd>CMakeGenerate<CR>", { desc = "CMake Generate", buffer = true })
vim.keymap.set("n", "<leader>cb", "<cmd>CMakeBuild<CR>", { desc = "CMake Build", buffer = true })
vim.keymap.set("n", "<leader>cr", "<cmd>CMakeRun<CR>", { desc = "CMake Run", buffer = true })
vim.keymap.set("n", "<leader>cd", "<cmd>CMakeDebug<CR>", { desc = "CMake Debug", buffer = true })
vim.keymap.set("n", "<leader>cs", "<cmd>CMakeSelectBuildType<CR>", { desc = "CMake Select Build Type", buffer = true })
vim.keymap.set(
    "n",
    "<leader>ct",
    "<cmd>CMakeSelectBuildTarget<CR>",
    { desc = "CMake Select Build Target", buffer = true }
)
