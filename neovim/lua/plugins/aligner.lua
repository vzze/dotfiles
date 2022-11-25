return {
    'vzze/aligner.nvim',
    opt = true,
    cmd = "Align",
    config = function()
        vim.api.nvim_create_user_command("Align", "lua require(\"aligner\").align(<line1>, <line2>, <f-args>)",
            { ["range"] = 1, ["nargs"] = 1 })
    end
}
