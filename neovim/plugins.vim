call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'vim-airline/vim-airline'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'neoclide/coc.nvim'
Plug 'terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/zen-mode.nvim'
Plug 'tpope/vim-surround'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'goolord/alpha-nvim'
Plug 'tpope/vim-repeat'
Plug 'lewis6991/impatient.nvim'
Plug 'mcauley-penney/tidy.nvim'
Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
Plug 'folke/twilight.nvim'
Plug 'beauwilliams/focus.nvim'
Plug 'NMAC427/guess-indent.nvim'
Plug 'kg8m/vim-simple-align'
Plug 'preservim/tagbar'
Plug 'yamatsum/nvim-cursorline'
Plug 'jghauser/mkdir.nvim'
Plug 'max397574/better-escape.nvim'

call plug#end()
