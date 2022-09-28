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
Plug 'NMAC427/guess-indent.nvim'
Plug 'kg8m/vim-simple-align'
Plug 'preservim/tagbar'
Plug 'xiyaowong/nvim-cursorword'
Plug 'jghauser/mkdir.nvim'
Plug 'max397574/better-escape.nvim'

vim.call("plug#end")

require("impatient")

require("tidy").setup {}

require("zen-mode").setup {
    window = {
        backdrop = 1,
        width = 1,
        height = 1
    },
}

require("twilight").setup {}

require("focus").setup {}

require("better_escape").setup {
    mapping = {"jk", "jj"},
    timeout = vim.o.timeoutlen,
    clear_empty_lines = false,
    keys = "<Esc>",
}

require("dirbuf").setup {
    hash_padding = 2,
    show_hidden = true,
    sort_order = "default",
    write_cmd = "DirbufSync",
}

require('guess-indent').setup {}

local wk = require("which-key")

local mappings = require("mappings")

wk.register(mappings.normal, { mode = "n", prefix = "", buffer = nil, silent = true, noremap = true, nowait = false })
wk.register(mappings.visual, { mode = "v", prefix = "", buffer = nil, silent = true, noremap = true, nowait = false })
wk.register(mappings.insert, { mode = "i", prefix = "", buffer = nil, silent = true, noremap = true, nowait = false })
wk.register(mappings.termin, { mode = "t", prefix = "", buffer = nil, silent = true, noremap = true, nowait = false })

wk.setup {
    icons = {
        breadcrumb = ">>",
        separator = "->",
        group = "+",
    },
    triggers_blacklist = {}
};

local dashboard = require("alpha.themes.dashboard")
local LogoTable = require("art")

math.randomseed(os.time())
dashboard.section.header.val = LogoTable[math.random(#LogoTable)]

dashboard.section.buttons.val = {
    dashboard.button("e", "New File", ":ene <BAR> startinsert <CR>"),
    dashboard.button("SPC f f", "Find File"),
    dashboard.button("SPC f g", "Find Word"),
}

dashboard.section.header.opts.hl = "LineNr"

require("alpha").setup(dashboard.config)
