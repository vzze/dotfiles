V = {}

require("v.settings")
require("v.providers")
require("v.bootstrap")
require("v.statusline")
require("v.mappings")
require("v.lsp")
require("v.lazy")

V.colorscheme = "monokai-pro"

V.terminal = {
    win32 = "pwsh.exe",
    linux = "zsh"
}

V.greeter = {
    info = true,
    separator = 1
}

V.init = function()
    for key, value in pairs(V.providers) do
        if value == true then
            vim.api.nvim_set_var("loaded_" .. key .. "_provider", 1)
        else
            vim.api.nvim_set_var("loaded_" .. key .. "_provider", 0)
        end
    end

    for key, value in pairs(V.settings) do
        vim.opt[key] = value
    end

    vim.api.nvim_create_autocmd("FileType", {
        command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o"
    })

    vim.api.nvim_command([[autocmd BufRead,BufNewFile *.fell set filetype=fell]])
    vim.api.nvim_command([[set laststatus=1]])

    vim.api.nvim_command([[colorscheme ]] .. V.colorscheme)
end

V.setup = function()
    require("config")
    V.bootstrap()
    V.lazy()
    V.init()
end
