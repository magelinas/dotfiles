return {
    cmd = {
        "clangd",
        "--clang-tidy",
        "--background-index",
        "--completion-style=detailed",
        "--header-insertion=iwyu",
        "--experimental-modules-support",
    },
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
