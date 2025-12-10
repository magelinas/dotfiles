return {
    "obsidian-nvim/obsidian.nvim",
    dependencies = {
        "MeanderingProgrammer/render-markdown.nvim",
    },
    ft = "markdown",
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
        legacy_commands = false,

        workspaces = {
            {
                name = "notes",
                path = "~/notes",
            },
        },

        log_level = vim.log.levels.INFO,

        completion = {
            nvim_cmp = false,
            blink = true,
            min_chars = 2,
            -- Set to false to disable new note creation in the picker
            create_new = true,
        },

        new_notes_location = "notes_subdir",

        frontmatter = {
            enable = false,
            func = function(note)
                -- Add the title of the note as an alias.
                if note.title then
                    note:add_alias(note.title)
                end

                local out = {
                    id = note.id,
                    title = note.title,
                    path = note.path.filename,
                    tags = note.tags,
                    date = os.date("%Y-%m-%d"),
                }

                if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                    for k, v in pairs(note.metadata) do
                        out[k] = v
                    end
                end

                return out
            end,
        },

        ---@param title string|?
        ---@return string
        note_id_func = function(title)
            -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
            -- In this case a note with the title 'My new note' will be given an ID that looks
            -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'.
            local suffix = ""
            if title ~= nil then
                suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
                for _ = 1, 4 do
                    suffix = suffix .. string.char(math.random(65, 90))
                end
            end
            return tostring(os.time()) .. "-" .. suffix
        end,

        prefered_link_style = "wiki",

        ---@param url string
        follow_url_func = function(url)
            vim.ui.open(url)
        end,

        ---@param img string
        follow_img_func = function(img)
            vim.ui.open(img)
        end,

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
            enable = true, -- set to false to disable all additional syntax features
            ignore_conceal_warn = false, -- set to true to disable conceallevel specific warning
            update_debounce = 200, -- update delay after a text change (in milliseconds)
            max_file_length = 5000, -- disable UI features for files with more than this many lines
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
    keys = {
        { "<leader>on", "<Cmd>Obsidian new<CR>", desc = "[O]bsidian [N]ew note" },
        { "<leader>ob", "<Cmd>Obsidian backlinks<CR>", desc = "[O]bsidian [B]acklinks" },
        { "<leader>oen", "<Cmd>Obsidian extract_note<CR>", desc = "[O]bsidian [E]xtract [N]ote" },
        { "<CR>", "<Cmd>Obsidian follow_link<CR>", desc = "Obsidian Follow Link" },
        {
            "<leader>on",
            "<Cmd>Obsidian link_new<CR>",
            desc = "[O]bsidian Visual selection [N]ew Link",
            mode = "v",
        },
        { "<leader>ol", "<Cmd>Obsidian links<CR>", desc = "[O]bsidian [L]ist Links" },
        { "<leader>oo", "<Cmd>Obsidian quick_switch<CR>", desc = "[O]bsidian [O]pen Notes" },
        { "<leader>of", "<Cmd>Obsidian search<CR>", desc = "[O]bsidian [F]ind" },
        { "<leader>ot", "<Cmd>Obsidian tags<CR>", desc = "[O]bsidian [T]ags" },
        { "<leader>oc", "<Cmd>Obsidian toc<CR>", desc = "[O]bsidian Table of [C]ontents" },
        { "<C-space>", "<Cmd>Obsidian toggle_checkbox<CR>", desc = "Obsidian Toggle Checkbox" },
    },
}
