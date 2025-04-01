return {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewRefresh" },

    config = function()
        require("diffview").setup({
            use_icons = false
        })
    end
}
