return {
    'nvimtools/none-ls.nvim',
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.diagnostics.rubocop,
                null_ls.builtins.formatting.rubocop,
                null_ls.builtins.formatting.tidy,
                null_ls.builtins.diagnostics.djlint,
                null_ls.builtins.diagnostics.markuplint,
                null_ls.builtins.formatting.biome,
                null_ls.builtins.diagnostics.phpcs,
               null_ls.builtins.diagnostics.stylelint,
            },
        })
        vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
    end
}
