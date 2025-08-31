return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        config = function()
            require("bufferline").setup{
                options = {
                    hover = {
                    enabled = true,
                    delay = 200,
                    reveal = {'close'}
                    },
                    mode = "tabs",
                }
            }
        end,
    }
}
