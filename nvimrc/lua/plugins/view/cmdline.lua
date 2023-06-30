return {
    "vzze/cmdline.nvim",
    event = "VeryLazy",
    config = function()
        require("cmdline")()
    end
}
