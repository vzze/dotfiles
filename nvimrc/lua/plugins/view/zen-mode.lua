return {
    'folke/zen-mode.nvim',
    lazy = true,
    cmd = "ZenMode",
    config = function()
        require("zen-mode").setup({ window = { backdrop = 1, width = 1, height = 1 } })
    end
}
