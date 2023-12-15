return {
    "numToStr/FTerm.nvim",
    lazy = true,
    config = function()
        local osShell = function()
            if vim.fn.has("win32") == 1 then
                return V.terminal.windows
            else
                return V.terminal.unix
            end
        end

        require("FTerm").setup({
            cmd = osShell()
        })
    end
}
