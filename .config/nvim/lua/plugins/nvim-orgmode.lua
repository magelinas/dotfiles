return {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    config = function()
        require("orgmode").setup({
            org_agenda_files = "~/org/**/*",
            org_default_notes_file = "~/org/refile.org",
            org_capture_templates = {
                t = {
                    description = "Tasks",
                    template = "* TODO %?\n %u",
                    target = "~/org/refile.org",
                },
                n = {
                    description = "Notes",
                    template = "* %?\n\n %u",
                    target = "~/org/notes.org",
                },
                c = {
                    description = "Commands",
                    template = "* %?\n #+begin_src shell \n #+end_src \n %u",
                    target = "~/org/commands.org",
                },
            },
        })
    end,
}
