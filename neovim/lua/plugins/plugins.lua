local M = {}

M.setup = function()
    local Plug = vim.fn["plug#"]

    vim.call("plug#begin", "~/AppData/Local/nvim/plugged")

    Plug 'elihunter173/dirbuf.nvim'
    Plug 'tpope/vim-commentary' -- For Commenting gcc & gc
    Plug 'vim-airline/vim-airline'
    Plug 'rafi/awesome-vim-colorschemes'
    Plug 'neoclide/coc.nvim'
    Plug 'terryma/vim-multiple-cursors' -- CTRL + N for multiple cursors
    Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
    Plug 'folke/zen-mode.nvim'
    Plug 'tpope/vim-surround'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'goolord/alpha-nvim'
    Plug 'tpope/vim-repeat'
    Plug 'lewis6991/impatient.nvim'
    Plug 'mcauley-penney/tidy.nvim'
    Plug 'folke/which-key.nvim'
    Plug 'folke/twilight.nvim'
    Plug 'beauwilliams/focus.nvim'
    Plug 'kg8m/vim-simple-align'
    Plug 'preservim/tagbar'
    Plug 'xiyaowong/nvim-cursorword'
    Plug 'jghauser/mkdir.nvim'
    Plug 'max397574/better-escape.nvim'
    Plug 'numToStr/FTerm.nvim'

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

    require("FTerm").setup({ cmd = "Powershell.exe" })

    require("plugins/mappings").setup()
    require("plugins/splash_screen").setup()
end

return M
