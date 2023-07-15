return {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local lspconfig = require("lspconfig")

        require("mason-lspconfig").setup_handlers {
            function(server)
                local config = {
                    on_attach = function(_ --[[client]], bufnr)
                        local wk = require("which-key")
                        wk.register(V.mappings.lsp.normal  , { mode = "n", prefix = "", buffer = bufnr, silent = true, noremap = true, nowait = false })
                        wk.register(V.mappings.lsp.visual  , { mode = "v", prefix = "", buffer = bufnr, silent = true, noremap = true, nowait = false })
                        wk.register(V.mappings.lsp.insert  , { mode = "i", prefix = "", buffer = bufnr, silent = true, noremap = true, nowait = false })
                        wk.register(V.mappings.lsp.terminal, { mode = "t", prefix = "", buffer = bufnr, silent = true, noremap = true, nowait = false })
                    end,
                    capabilities = capabilities
                }

                -- if(server == "clangd") then
                --     config.root_dir = require("lspconfig").util.root_pattern(
                --         '.clangd',
                --         '.clang-tidy',
                --         '.clang-format',
                --         'compile_commands.json',
                --         'build/compile_commands.json',
                --         'compile_flags.txt',
                --         'configure.ac',
                --         '.git'
                --     )
                -- end

                if V.lsp[server] then
                    for key, value in pairs(V.lsp[server]) do
                        config[key] = value
                    end
                end

                lspconfig[server].setup(config)
            end,
        }
    end
}
