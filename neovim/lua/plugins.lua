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

require('guess-indent').setup {}

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
