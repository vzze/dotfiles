return {
    "neovim/nvim-lspconfig",
    config = function()
        require("mason-lspconfig").setup_handlers {
            function (server_name)
                local config = {
                    on_attach = function(client, bufnr)
                        local wk = require("which-key")
                        wk.register(V.mappings.lsp.normal  , { mode = "n", prefix = "", buffer = bufnr, silent = true, noremap = true, nowait = false })
                        wk.register(V.mappings.lsp.visual  , { mode = "v", prefix = "", buffer = bufnr, silent = true, noremap = true, nowait = false })
                        wk.register(V.mappings.lsp.insert  , { mode = "i", prefix = "", buffer = bufnr, silent = true, noremap = true, nowait = false })
                        wk.register(V.mappings.lsp.terminal, { mode = "t", prefix = "", buffer = bufnr, silent = true, noremap = true, nowait = false })
                    end,
                }

                if V.lspconfig[server_name] then
                    for key, value in pairs(V.lspconfig[server_name]) do
                        config[key] = value
                    end
                end

                require("lspconfig")[server_name].setup(
                    require("coq").lsp_ensure_capabilities(config)
                )
            end
        }
    end
}
