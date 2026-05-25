vim.pack.add({
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/echasnovski/mini.icons"
})

require("oil").setup(
    {
        view_options = {
            case_insensitive = true,
        },
        columns      = {
            "icon",
            "permissions",
            "size",
            "mtime"
        },
        keymaps      = {
            ["-"] = { "actions.parent", mode = "n" },
        },
    }
)

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
