return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" }, -- Загружать только когда открыли файл
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    opts = {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
    },
    config = function(_, opts)
        -- ВАЖНО: Проверяем, загрузился ли модуль перед использованием
        local ok, configs = pcall(require, "nvim-treesitter.configs")
        if not ok then
            return
        end
        configs.setup(opts)
    end,
}
