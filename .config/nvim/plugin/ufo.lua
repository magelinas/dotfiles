vim.pack.add({
    "https://github.com/kevinhwang91/promise-async",
    "https://github.com/kevinhwang91/nvim-ufo"
})

require("ufo").setup({
    provider_selector = function()
        return { "lsp", "indent" }
    end,
})

vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
