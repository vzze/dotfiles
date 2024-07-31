return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local lspconfig = require("lspconfig")

        require("mason-lspconfig").setup_handlers {
            function(server)
                local config = {
                    -- it seems that which-key has removed per
                    -- buffer mappings in v3, at least i think
                    -- didnt find shit in the docs
                    -- oh well
                    on_attach = function(client, _ --[[bufnr]])
                        local wk = require("which-key")

                        wk.add(V.mappings.lsp)

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
