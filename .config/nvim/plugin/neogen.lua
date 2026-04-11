vim.pack.add(
    {
        "https://github.com/danymat/neogen",
    }
)

require("neogen").setup({
    config = true,
})

vim.keymap.set("n", "<leader>ng", function() require("neogen").generate() end, { desc = "Generate annotation"})

-- return {
--     "danymat/neogen",
--     config = true,
--     version = "*",
--     keys = {
--         {
--             "<leader>ng",
--             function()
--                 require("neogen").generate()
--             end,
--             desc = "Generate annotation"
--         }
--     }
-- }
