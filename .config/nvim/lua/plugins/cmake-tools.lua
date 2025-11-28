return {
    "Civitasv/cmake-tools.nvim",
    ft = { "c", "cpp", "cmake" },
    opts = {},
    keys = {
        {
            "<leader>cg",
            "<cmd>CMakeGenerate<CR>",
            desc = "CMake Generate",
        },
        {
            "<leader>cb",
            "<cmd>CMakeBuild<CR>",
            desc = "CMake Build",
        },
        {
            "<leader>cr",
            "<cmd>CMakeRun<CR>",
            desc = "CMake Run",
        },
        {
            "<leader>cd",
            "<cmd>CMakeDebug<CR>",
            desc = "CMake Debug",
        },
        {
            "<leader>cs",
            "<cmd>CMakeSelectBuildType<CR>",
            desc = "CMake Select Build Type",
        },
        {
            "<leader>ct",
            "<cmd>CMakeSelectBuildTarget<CR>",
            desc = "CMake Select Build Target",
        },
    },
}
