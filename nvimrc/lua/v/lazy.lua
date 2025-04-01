V.lazy = function()
    require("lazy").setup(require("plugins"), {
        ui = {
            backdrop = 100,

            icons = {
                cmd     = "cmd",
                config  = "cfg",
                event   = "ev",
                ft      = "ft",
                init    = "ini",
                keys    = "key",
                plugin  = "plug",
                runtime = "rt",
                source  = "src",
                start   = "st",
                task    = "tk",
                lazy    = "zZ",
                debug = "deb",
                favorite = "fav",
                import = "imp",
                loaded = "lo",
                not_loaded = "nl",
                require = "req",
                list = {
                    "o", ">", "*", "-"
                }
            }
        },

        install = {
            colorscheme = { "monokai-pro" }
        },

        checker = {
            enabled = true
        },

        dev = {
            path = "~/cb/lua"
        }
    })
end
