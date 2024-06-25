return {
    "numToStr/FTerm.nvim",
    lazy = true,
    config = function()
        local osShell = function()
            if vim.fn.has("win32") == 1 then
                return V.terminal.win32
            else
                return V.terminal.linux
            end
        end

        require("FTerm").setup({
            cmd = osShell()
        })
    end
}
