--- Removes the ••• part.
vim.o.fillchars = "fold: "

vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

--- Disables fold text.
vim.o.foldtext = ""

vim.keymap.set("n", "<leader>on", "<Cmd>Obsidian new<CR>", { desc = "[O]bsidian [N]ew note", buffer = true })
vim.keymap.set("n", "<leader>ob", "<Cmd>Obsidian backlinks<CR>", { desc = "[O]bsidian [B]acklinks", buffer = true })
vim.keymap.set(
    "n",
    "<leader>oen",
    "<Cmd>Obsidian extract_note<CR>",
    { desc = "[O]bsidian [E]xtract [N]ote", buffer = true }
)
vim.keymap.set("n", "<CR>", "<Cmd>Obsidian follow_link<CR>", { desc = "Obsidian Follow Link", buffer = true })
vim.keymap.set(
    "v",
    "<leader>on",
    "<Cmd>Obsidian link_new<CR>",
    { desc = "[O]bsidian Visual selection [N]ew Link", buffer = true }
)
vim.keymap.set("n", "<leader>ol", "<Cmd>Obsidian links<CR>", { desc = "[O]bsidian [L]ist Links", buffer = true })
vim.keymap.set("n", "<leader>oo", "<Cmd>Obsidian quick_switch<CR>", { desc = "[O]bsidian [O]pen Notes", buffer = true })
vim.keymap.set("n", "<leader>of", "<Cmd>Obsidian search<CR>", { desc = "[O]bsidian [F]ind", buffer = true })
vim.keymap.set("n", "<leader>ot", "<Cmd>Obsidian tags<CR>", { desc = "[O]bsidian [T]ags", buffer = true })
vim.keymap.set("n", "<leader>oc", "<Cmd>Obsidian toc<CR>", { desc = "[O]bsidian Table of [C]ontents", buffer = true })
vim.keymap.set(
    "n",
    "<C-space>",
    "<Cmd>Obsidian toggle_checkbox<CR>",
    { desc = "Obsidian Toggle Checkbox", buffer = true }
)
