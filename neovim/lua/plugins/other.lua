local M = {}

M.setup = function()
    require("impatient")

    vim.api.nvim_create_autocmd("vimenter", {
        command = "TSEnable highlight"
    })

    require("dirbuf").setup({
        hash_padding = 2,
        show_hidden = true,
        sort_order = "default",
        write_cmd = "DirbufSync",
    })

    require("auto-session").setup({
        log_level = 'none',
        auto_restore_enabled = false,
        auto_save_enabled = true,
        cwd_change_handling = {
            post_cwd_changed_hook = function()
                require("lualine").refresh()
            end
        },
    })

    require("numb").setup({})
    require("tidy").setup({})
    require("zen-mode").setup({ window = { backdrop = 1, width = 1, height = 1 } })
    require("twilight").setup({})
    require("focus").setup({})

    if vim.fn.has("unix") == 1 then
        require("FTerm").setup({ cmd = "bash" })
    elseif vim.fn.has("win32") == 1 then
        require("FTerm").setup({ cmd = "pwsh.exe" })
    end

    require("nvim_comment").setup({
        marker_padding = true,
        comment_empty = false,
        comment_empty_trim_whitespace = true,
        create_mappings = false
    })
end

return M
