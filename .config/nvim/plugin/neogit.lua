vim.pack.add(
    {
        "https://github.com/sindrets/diffview.nvim",
        "https://github.com/nvim-lua/plenary.nvim",
        "https://github.com/ibhagwan/fzf-lua",
        "https://github.com/NeogitOrg/neogit",
    }
)

require("neogit").setup({
    cmd = "Neogit",
})

vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Show Neogit UI" })
