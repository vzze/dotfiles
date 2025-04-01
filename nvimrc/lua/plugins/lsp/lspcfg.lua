return {
    "neovim/nvim-lspconfig",

    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")

        local function deep_copy(cfg, obj)
            for key, value in pairs(obj) do
                if type(value) == "table" and type(cfg[key]) == "table" then
                    deep_copy(cfg[key], value)
                else
                    cfg[key] = value
                end
            end
        end

        require("mason-lspconfig").setup_handlers({
            function(server)
                local cfg = {
                    on_attach = function(client, buf)
                        require("which-key").add(V.mappings.lsp(buf))

                        -- client.server_capabilities.semanticTokensProvider = nil
                    end,

                    capabilities = capabilities
                }

                if V.lsp.custom_configs[server] then
                    deep_copy(cfg, V.lsp.custom_configs[server])
                end

                lspconfig[server].setup(cfg)
            end
        })
    end
}
