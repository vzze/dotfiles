return {
    "williamboman/mason.nvim",

    build = function()
        pcall(vim.api.nvim_command, [[MasonUpdate]])
    end,

    config = function()
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "*",
                    package_pending = ">",
                    package_uninstalled = "X"
                }
            }
        })
    end
}
