return {
    'sindrets/diffview.nvim',
    lazy = true,
    cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewRefresh" },
    config = function()
        require("diffview").setup({
            use_icons = false
        })
    end
}
