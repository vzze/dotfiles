require("settings.theme")
require("settings.settings")

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        _G.V.post_setup_callback()
    end
})
