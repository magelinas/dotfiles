vim.pack.add(
    {
        "https://github.com/obsidian-nvim/obsidian.nvim"
    }
)

---@module 'obsidian'
---@type 'obsidian.config'
require("obsidian").setup(
    {
        legacy_commands = false,

        workspaces = {
            {
                name = "notes",
                path = "~/notes",
            },
        },

        log_level = vim.log.levels.INFO,

        completion = {
            min_chars = 2,
            -- Set to false to disable new note creation in the picker
            create_new = true,
        },

        new_notes_location = "notes_subdir",

        frontmatter = {
            enabled = true,
            func = function(note)
                -- Add the title of the note as an alias.
                if note.title then
                    note:add_alias(note.title)
                end

                local out = { id = note.id, path = note.path.filename, tags = note.tags, date = os.date("%Y-%m-%d") }

                if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                    for k, v in pairs(note.metadata) do
                        out[k] = v
                    end
                end

                return out
            end,
        },

        prefered_link_style = "wiki",

        picker = {
            name = "snacks.pick",
            note_mappings = {
                -- Create a new note from your query.
                new = "<C-x>",
                -- Insert a link to the selected note.
                insert_link = "<C-l>",
            },
            tag_mappings = {
                -- Add tag(s) to current note.
                tag_note = "<C-x>",
                -- Insert a tag at the current location.
                insert_tag = "<C-l>",
            },
        },

        ui = {
            enable = true,               -- set to false to disable all additional syntax features
            ignore_conceal_warn = false, -- set to true to disable conceallevel specific warning
            update_debounce = 200,       -- update delay after a text change (in milliseconds)
            max_file_length = 5000,      -- disable UI features for files with more than this many lines
            -- Use bullet marks for non-checkbox lists.
            bullets = { char = "•", hl_group = "ObsidianBullet" },
            external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
            -- Replace the above with this if you don't have a patched font:
            -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
            reference_text = { hl_group = "ObsidianRefText" },
            highlight_text = { hl_group = "ObsidianHighlightText" },
            tags = { hl_group = "ObsidianTag" },
            block_ids = { hl_group = "ObsidianBlockID" },
            hl_groups = {
                -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
                ObsidianTodo = { bold = true, fg = "#f78c6c" },
                ObsidianDone = { bold = true, fg = "#89ddff" },
                ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
                ObsidianTilde = { bold = true, fg = "#ff5370" },
                ObsidianImportant = { bold = true, fg = "#d73128" },
                ObsidianBullet = { bold = true, fg = "#89ddff" },
                ObsidianRefText = { underline = true, fg = "#c792ea" },
                ObsidianExtLinkIcon = { fg = "#c792ea" },
                ObsidianTag = { italic = true, fg = "#89ddff" },
                ObsidianBlockID = { italic = true, fg = "#89ddff" },
                ObsidianHighlightText = { bg = "#75662e" },
            },
        },

        checkbox = {
            order = { " ", "~", "!", ">", "x" },
        },
    },

    vim.keymap.set("n", "<leader>on", "<Cmd>Obsidian new ''<CR>", { desc = "[O]bsidian [N]ew note", silent = true }),
    vim.keymap.set("n", "<leader>ob", "<Cmd>Obsidian backlinks<CR>", { desc = "[O]bsidian [B]acklinks" }),
    vim.keymap.set("v", "<leader>oen", "<Cmd>Obsidian extract_note<CR>", { desc = "[O]bsidian [E]xtract [N]ote" }),
    vim.keymap.set("n", "<CR>", "<Cmd>Obsidian follow_link<CR>", { desc = "Obsidian Follow Link" }),
    vim.keymap.set(
        "v",
        "<leader>on",
        "<Cmd>Obsidian link_new<CR>",
        { desc = "[O]bsidian Visual selection [N]ew Link" }
    ),
    vim.keymap.set("n", "<leader>ol", "<Cmd>Obsidian links<CR>", { desc = "[O]bsidian [L]ist Links" }),
    vim.keymap.set("n", "<leader>oo", "<Cmd>Obsidian quick_switch<CR>", { desc = "[O]bsidian [O]pen Notes" }),
    vim.keymap.set("n", "<leader>of", "<Cmd>Obsidian search<CR>", { desc = "[O]bsidian [F]ind" }),
    vim.keymap.set("n", "<leader>ot", "<Cmd>Obsidian tags<CR>", { desc = "[O]bsidian [T]ags" }),
    vim.keymap.set("n", "<leader>oc", "<Cmd>Obsidian toc<CR>", { desc = "[O]bsidian Table of [C]ontents" }),
    vim.keymap.set("n", "<C-space>", "<Cmd>Obsidian toggle_checkbox<CR>", { desc = "Obsidian Toggle Checkbox" })
)
