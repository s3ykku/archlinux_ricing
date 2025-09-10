return {
    {
    'mason-org/mason.nvim',
    config = function()
        require('mason').setup()
    end
    },
    {
        'mason-org/mason-lspconfig.nvim',
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { 'lua_ls', 'cssls', 'html', 'css_variables', 'ast_grep', 'lwc_ls', 'ts_ls' }
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup({})
            lspconfig.cssls.setup({})
            lspconfig.html.setup({})
            lspconfig.css_variables.setup({})
            lspconfig.ast_grep.setup({})
            lspconfig.lwc_ls.setup({})
            lspconfig.ts_ls.setup({})

            vim.keymap.set('n', '<leader>li', vim.lsp.buf.hover, {})
            vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, {})
            vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, opts)
        end
    }
}
