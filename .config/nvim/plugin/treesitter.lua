vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" }
})

require('nvim-treesitter').install {
    "c", "cpp", "lua", "go", "vimdoc", "python", "markdown", "markdown_inline", "zig", "rust", "bash"
}

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("treesitter.setup", {}),
    callback = function(args)
        local filetype = args.match
        local buf = args.buf
        local lang = vim.treesitter.language.get_lang(filetype) or filetype

        if vim.treesitter.language.add(lang) then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.wo.foldmethod = "expr"

            vim.treesitter.start(buf, lang)
        end
    end,
})

vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == "nvim-treesitter" and kind == "update" then
            vim.cmd("TSUpdate")
        end
    end,
})
