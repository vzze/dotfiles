return {
    'rmagatti/auto-session',
    opt = true,
    cmd = { "SaveSession", "RestoreSession" },
    config = function()
        require("auto-session").setup({
            log_level = 'none',
            auto_restore_enabled = false,
            auto_save_enabled = false
        })
    end
}
