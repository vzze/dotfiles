V.lazy = function()
    require("lazy").setup(require("plugins"), {
        ui = {
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
            },
        },
    })
end
