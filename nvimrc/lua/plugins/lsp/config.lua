return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local lspconfig = require("lspconfig")

        require("mason-lspconfig").setup_handlers {
            function(server)
                local config = {
                    on_attach = function(client, bufnr)
                        local wk = require("which-key")

                        wk.register(V.mappings.lsp.normal  , { mode = "n", prefix = "", buffer = bufnr, silent = true, noremap = true, nowait = false })
                        wk.register(V.mappings.lsp.visual  , { mode = "v", prefix = "", buffer = bufnr, silent = true, noremap = true, nowait = false })
                        wk.register(V.mappings.lsp.insert  , { mode = "i", prefix = "", buffer = bufnr, silent = true, noremap = true, nowait = false })
                        wk.register(V.mappings.lsp.terminal, { mode = "t", prefix = "", buffer = bufnr, silent = true, noremap = true, nowait = false })

                        client.server_capabilities.semanticTokensProvider = nil
                    end,
                    capabilities = capabilities
                }

                local function copyObj(cfg, obj)
                    for key, value in pairs(obj) do
                        if type(value) == "table" and type(cfg[key]) == "table" then
                            copyObj(cfg[key], value)
                        else
                            cfg[key] = value
                        end
                    end
                end

                if V.lsp[server] then
                    copyObj(config, V.lsp[server])
                end

                lspconfig[server].setup(config)
            end,
        }
    end
}
