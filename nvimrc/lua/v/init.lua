V = {}

require("v.bootstrap")
require("v.mappings")
require("v.settings")
require("v.terminal")
require("v.lazy")
require("v.lsp")
require("v.art")

require("config")

V.init = function()
    vim.diagnostic.config(V.lsp.diagnostics)

    for key, value in pairs(V.providers) do
        vim.g["loaded_" .. key .. "_provider"] = value
    end

    for key, value in pairs(V.opts) do
        vim.opt[key] = value
    end

    for key, value in pairs(V.g) do
        vim.g[key] = value
    end

    vim.api.nvim_create_autocmd("FileType", {
        command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o"
    })
end

V.setup = function()
    V.bootstrap()
    V.init()
    V.lazy()

    vim.api.nvim_command([[colorscheme ]] .. V.colorscheme)
end
