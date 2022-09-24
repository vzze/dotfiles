require("impatient")

require("tidy").setup {}

require("zen-mode").setup {
    window = {
        backdrop = 1,
        width = 1,
        height = 1
    },
}

require('nvim-cursorline').setup {
    cursorline = {
        enable = true,
        timeout = 1000,
        number = false,
    },
    cursorword = {
        enable = true,
        min_length = 3,
        hl = { underline = true },
    }
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
    dashboard.button("SPC c", "Config", ":e ~/Appdata/Local/nvim/init.vim <CR>")
}

dashboard.section.header.opts.hl = "LineNr"

require("alpha").setup(dashboard.config)
