local M = {}

M.setup = function()
    local Plug = vim.fn["plug#"]

    if vim.fn.has("unix") == 1 then
        vim.call("plug#begin", "~/.config/nvim/plugged")
    elseif vim.fn.has("win32") == 1 then
        vim.call("plug#begin", "~/AppData/Local/nvim/plugged")
    end

    Plug 'lewis6991/impatient.nvim'
    Plug 'elihunter173/dirbuf.nvim'
    Plug 'neoclide/coc.nvim'
    Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'goolord/alpha-nvim'
    Plug 'mcauley-penney/tidy.nvim'
    Plug 'folke/which-key.nvim'
    Plug 'folke/zen-mode.nvim'
    Plug 'folke/twilight.nvim'
    Plug 'beauwilliams/focus.nvim'
    Plug 'xiyaowong/nvim-cursorword'
    Plug 'jghauser/mkdir.nvim'
    Plug 'max397574/better-escape.nvim'
    Plug 'numToStr/FTerm.nvim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'terrortylor/nvim-comment'

    Plug 'kg8m/vim-simple-align'
    Plug 'terryma/vim-multiple-cursors'

    vim.call("plug#end")

    require("impatient")

    require("dirbuf").setup({
        hash_padding = 2,
        show_hidden = true,
        sort_order = "default",
        write_cmd = "DirbufSync",
    })

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

    require("plugins/lualine").setup()
    require("plugins/mappings").setup()
    require("plugins/splash_screen").setup()
end

return M
