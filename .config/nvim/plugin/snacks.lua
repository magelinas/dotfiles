vim.pack.add({
    "https://github.com/folke/snacks.nvim"
})

require("snacks").setup({
    opts = {
        picker = {
            enabled = true,
            layout = {
                preset = "telescope",
            },
        },
        matcher = {
            frecency = true,
            cwd_bonus = true,
        },
        filter = {
            cwd = true,
        },
        image = {
            enabled = true,
        },
    }
})

vim.keymap.set("n", "<leader>sf", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
vim.keymap.set("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, { desc = "LSP buffer symbols" })
vim.keymap.set("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end,
    { desc = "LSP workspace symbols" })
vim.keymap.set("n", "<leader>/", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set("n", "<leader>:", function() Snacks.picker.command_history() end, { desc = "Command history" })
vim.keymap.set("n", "<leader><leader>", function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find files" })
vim.keymap.set("n", "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer lines" })
vim.keymap.set("n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "Help pages" })
vim.keymap.set("n", "<leader>sr", function() Snacks.picker.lsp_references() end, { desc = "References" })
vim.keymap.set("n", "<leader>sd", function() Snacks.picker.diagnostics_buffer() end, { desc = "Buffer diagnostics" })
vim.keymap.set("n", "<leader>sD", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>sm", function() Snacks.picker.marks() end, { desc = "Marks" })
