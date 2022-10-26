local M = {}

M.plugins = {
    'lewis6991/impatient.nvim'       ,

    'wbthomason/packer.nvim'         ,

    'elihunter173/dirbuf.nvim'       ,
    'neoclide/coc.nvim'              ,
    'nvim-treesitter/nvim-treesitter',
    'nvim-lua/plenary.nvim'          ,
    'nvim-telescope/telescope.nvim'  ,
    'goolord/alpha-nvim'             ,
    'mcauley-penney/tidy.nvim'       ,
    'folke/which-key.nvim'           ,
    'folke/zen-mode.nvim'            ,
    'folke/twilight.nvim'            ,
    'beauwilliams/focus.nvim'        ,
    'xiyaowong/nvim-cursorword'      ,
    'jghauser/mkdir.nvim'            ,
    'max397574/better-escape.nvim'   ,
    'numToStr/FTerm.nvim'            ,
    'nvim-lualine/lualine.nvim'      ,
    'terrortylor/nvim-comment'       ,
    'nacro90/numb.nvim'              ,
    'ggandor/leap.nvim'              ,
    'rmagatti/auto-session'          ,

    'mg979/vim-visual-multi'         ,
}

M.setup = function(use)
    for _, plugin in pairs(M.plugins) do
        use(plugin)
    end
end

return M
