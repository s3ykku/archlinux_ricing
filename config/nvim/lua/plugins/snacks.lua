return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = {
        enabled = true,
        timeout = 4000,
        },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
        dashboard = {
            sections = {
            { section = "header" },
            { section = "keys", gap = 1, padding = 1 },
            { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
            { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
            {
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
                return Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
            },
            { section = "startup" },
            },
        },
    },
    lazygit = {
            
    },
}
