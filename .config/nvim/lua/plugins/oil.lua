return {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        view_options = {
            show_hidden = true,
            case_insensitive = true,
        },
    },
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },

    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Oil" }),
}
