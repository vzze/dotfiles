V.lsp = {}

V.lsp.capabilities = nil

V.lsp.apply_custom_config = function(cfg, obj)
    for key, value in pairs(obj) do
        if type(value) == "table" and type(cfg[key]) == "table" then
            V.lsp.apply_custom_config(cfg[key], value)
        else
            cfg[key] = value
        end
    end
end

V.lsp.setup_server = function(server, capabilities, bind_manager)
    local cfg = {
        on_attach = function(client, buf)
            bind_manager.add(V.mappings.lsp(buf))

            -- client.server_capabilities.semanticTokensProvider = nil
        end,

        capabilities = capabilities
    }

    if V.lsp.custom_configs[server] then
        V.lsp.apply_custom_config(
            cfg,
            V.lsp.custom_configs[server]
        )
    end

    vim.lsp.config(server, cfg)
end

V.lsp.diagnostics = {
    virtual_lines = true
}

V.lsp.custom_configs = {}

V.lsp.custom_configs["lua_ls"] = {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT"
            },
            diagnostics = {
                globals = {"vim", "V"}
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true)
            },
            telemetry = {
                enable = false
            }
        }
    }
}
