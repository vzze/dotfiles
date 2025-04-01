return {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",

    config = function()
        require("gitsigns").setup({
            on_attach = function(buf)
                require("which-key").add(V.mappings.git(buf))
            end
        })
    end
}
