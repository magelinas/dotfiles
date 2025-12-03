local lsp_path = vim.fn.stdpath("config") .. "/lua/lsp/"

vim.diagnostic.config({
    float = {
        border = "rounded",
    },
    underline = {
        severity = { min = vim.diagnostic.severity.HINT },
    },
    virtual_text = {
        current_line = true,
        severity = { min = vim.diagnostic.severity.WARN },
    },
    virtual_lines = false,
})

vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "[G]et [D]efinitions" })
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "[G]et [R]eferences" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })

vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover({ border = "single", max_height = 14, max_width = 100 })
end, { desc = "Hover" })

-- Auto formating on save
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("my.lsp", {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if
            not client:supports_method("textDocument/willSaveWaitUntil")
            and client:supports_method("textDocument/formatting")
        then
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                end,
            })
        end
    end,
})

for _, file in ipairs(vim.fn.readdir(lsp_path)) do
    if file:match("%.lua$") and file ~= "init.lua" then
        local module_name = "lsp." .. file:gsub("%.lua$", "")
        require(module_name)
    end
end
