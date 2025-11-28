vim.lsp.config.clangd = {
    cmd = { "clangd", "--clang-tidy", "--experimental-modules-support" },
    filetypes = { "c", "cpp", "h", "hpp", "ixx", "cc", "inl" },
    root_markers = {
        ".clangd",
        ".clang-tidy",
        ".clang-format",
        "compile_commands.json",
        "compile_flags.txt",
        "configure.ac",
        ".git",
    },
}

vim.lsp.enable("clangd")
