return {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },

    version = "*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = { preset = "default" },

        appearance = {
            nerd_font_variant = "mono",
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
            per_filetype = {
                org = { "orgmode" },
            },
            providers = {
                orgmode = {
                    name = "Orgmode",
                    module = "orgmode.org.autocompletion.blink",
                    fallbacks = { "buffer" },
                },
            },
        },

        completion = {
            documentation = {
                window = {
                    border = "single",
                },
                auto_show = true,
            },
            menu = {
                border = "single",
            },
        },

        signature = {
            enabled = true,
            window = {
                show_documentation = true,
                border = "single",
            },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
}
