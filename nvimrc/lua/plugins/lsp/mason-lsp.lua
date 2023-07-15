return {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        require("mason-lspconfig").setup({
            ensured_installed = {
                "bashls", "pyright", "vimls", "html", "cssls",
                "cmake", "tsserver", "jsonls", "clangd", "lua_ls"
            },
        })
    end
}
