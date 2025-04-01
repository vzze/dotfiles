V.lsp = {}

V.lsp.custom_configs = {}

V.lsp.diagnostics = {
    virtual_lines = true
}

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
