return {
    "vzze/cmdline.nvim",
    config = function()
        require("cmdline").setup({
            hl = {
                default   = "Pmenu",
                selection = "Keyword",
                directory = "Directory",
                substr    = "Normal"
            }
        })
    end
}
