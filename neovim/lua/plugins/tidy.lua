return {
    'mcauley-penney/tidy.nvim',
    event = "BufWritePre",
    opt = true,
    config = function ()
        require("tidy").setup()
    end
}
