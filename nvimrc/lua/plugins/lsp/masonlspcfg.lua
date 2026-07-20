return {
    "mason-org/mason-lspconfig.nvim",
    lazy = true,

    config = function()
        require("mason-lspconfig").setup({
            automatic_enable = false
        })
    end
}
