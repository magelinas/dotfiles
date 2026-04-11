vim.pack.add({
    { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('*') },
})

require("blink.cmp").setup(
    {
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
    }
)
