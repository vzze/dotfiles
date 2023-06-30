return {
    'mcauley-penney/tidy.nvim',
    event = "BufWritePre",
    lazy = true,
    config = function ()
        require("tidy").setup()
    end
}
