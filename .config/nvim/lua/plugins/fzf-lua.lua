return {
    "ibhagwan/fzf-lua",
    lazy = false,
    priority = 1000,
    opts = {
        winopts = {
            preview = {
                default = "bat",
                border = function(_, m)
                    -- NOTE: will err on `FzfLua ... winopts.toggle_behavior=extend`
                    -- assert(m.type == "fzf")
                    if FzfLua.utils.has(m.opts, "fzf", { 0, 63 }) then
                        return "border-line"
                    else
                        return "border-sharp"
                    end
                end
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
            file_icons = true,
        },

        grep = {
            rg_opts = "--column --line-number --no-heading --color=always --smart-case",
        },
    },
    keys = {
        {
            "<leader>sf",
            function()
                require("fzf-lua").files({ cwd = vim.loop.cwd() })
            end,
            desc = "Find Files",
        },
        {
            "<leader>ss",
            function()
                require("fzf-lua").lsp_document_symbols()
            end,
            desc = "LSP Symbols",
        },
        {
            "<leader>/",
            function()
                require("fzf-lua").live_grep()
            end,
            desc = "Grep",
        },
        {
            "<leader>:",
            function()
                require("fzf-lua").command_history()
            end,
            desc = "Command History",
        },

        {
            "<leader><leader>",
            function()
                require("fzf-lua").buffers()
            end,
            desc = "Buffers",
        },
        {
            "<leader>ff",
            function()
                require("fzf-lua").files()
            end,
            desc = "Find Files",
        },

        -- Grep / misc
        {
            "<leader>sb",
            function()
                require("fzf-lua").lines()
            end,
            desc = "Buffer Lines",
        },
        {
            "<leader>sk",
            function()
                require("fzf-lua").keymaps()
            end,
            desc = "Keymaps",
        },
        {
            "<leader>sh",
            function()
                require("fzf-lua").help_tags()
            end,
            desc = "Help Pages",
        },
        {
            "<leader>sm",
            function()
                require("fzf-lua").marks()
            end,
            desc = "Marks",
        },
    },
    fzf_colors = {
        true,
    }
}
