return {
    "neovim/nvim-lspconfig",

    config = function()
        local capabilities = require("cmp_nvim_lsp")
            .default_capabilities()

        local servers = require("mason-lspconfig")
            .get_installed_servers()

        local wk = require("which-key")

        for _, server in ipairs(servers) do
            V.lsp.setup_server(server, capabilities, wk)
        end
    end
}
