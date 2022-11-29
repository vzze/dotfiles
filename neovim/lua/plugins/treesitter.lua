return {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate all",
    config = function()
        vim.api.nvim_create_autocmd("vimenter", { command = "TSEnable highlight" })
    end
}
