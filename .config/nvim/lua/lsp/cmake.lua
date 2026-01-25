vim.lsp.config.cmake = {
    cmd = { "cmake-language-server" },
    filetypes = { "cmake" },
    root_markers = {
        "CMakePresets.json",
        "CTestConfig.cmake",
        ".git",
        "build",
        "cmake",
    },
    settings = {
        Lua = {
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                },
            },
        },
    },
}

-- vim.lsp.enable("cmake")
