vim.pack.add({
    { src = "https://github.com/ibhagwan/fzf-lua", version = vim.version.range('*') },
})

require("fzf-lua").setup({
    winopts = {
        preview = {
            default = "bat",
            --         border = function(_, m)
            --             -- NOTE: will err on `FzfLua ... winopts.toggle_behavior=extend`
            --             -- assert(m.type == "fzf")
            --             if FzfLua.utils.has(m.opts, "fzf", { 0, 63 }) then
            --                 return "border-line"
            --             else
            --                 return "border-sharp"
            --             end
            --         end
        }
    },
    manpages = { previewer = "man_native" },
    helptags = { previewer = "help_native" },
    undotree = { previewer = "undo_native" },
    lsp = { code_actions = { previewer = "codeaction_native" } },
    tags = { previewer = "bat" },
    btags = { previewer = "bat" },

    fzf_opts = {
        ["--tiebreak"] = "index",
    },

    files = {
        cwd_prompt = false,
        git_icons = true,
    },

    grep = {
        rg_opts = "--column --line-number --no-heading --color=always --smart-case",
    },
    fzf_colors = {
        true,
    },
}
)

vim.keymap.set("n", "<leader>sf", "<cmd>FzfLua files cwd=" .. vim.loop.cwd() .. "<CR>", { desc = "Find Files" })

vim.keymap.set("n", "<leader>ss", "<cmd>FzfLua lsp_document_symbols<CR>", { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>sS", "<cmd>FzfLua lsp_workspace_symbols<CR>", { desc = "LSP workspace Symbols" })

vim.keymap.set("n", "<leader>/", "<cmd>FzfLua live_grep<CR>", { desc = "Grep" })

vim.keymap.set("n", "<leader>:", "<cmd>FzfLua command_history<CR>", { desc = "Command History" })

vim.keymap.set("n", "<leader><leader>", "<cmd>FzfLua buffers<CR>", { desc = "Buffers" })

vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Find Files" })

vim.keymap.set("n", "<leader>sb", "<cmd>FzfLua lines<CR>", { desc = "Buffer Lines" })

vim.keymap.set("n", "<leader>sk", "<cmd>FzfLua keymaps<CR>", { desc = "Keymaps" })

vim.keymap.set("n", "<leader>sh", "<cmd>FzfLua help_tags<CR>", { desc = "Help Pages" })

vim.keymap.set("n", "<leader>sm", "<cmd>FzfLua marks<CR>", { desc = "Marks" })
