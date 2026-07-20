V.terminal = {
    win32 = "pwsh.exe",
    linux = "zsh",

    os_shell = function()
        if vim.fn.has("win32") == 1 then
            return V.terminal.win32
        else
            return V.terminal.linux
        end
    end
}

V.terminal.manager = {
    terminals = {},

    create_instance = function(idx)
        local fterm = require("FTerm")

        local cfg = {
            cmd = V.terminal.os_shell(),

            dimensions = {
                height = 0.8,
                width = 0.8,

                x = 0.5,
                y = 0.5
            }
        }

        if idx == 2 then
            cfg.dimensions.height = 0.6
            cfg.dimensions.width = 1

            cfg.dimensions.y = 1
        end

        if idx == 3 then
            cfg.dimensions.height = 1.1
            cfg.dimensions.width = 0.4

            cfg.dimensions.x = 1
        end

        if idx == 4 then
            cfg.dimensions.height = 0.4
            cfg.dimensions.width = 0.4

            cfg.dimensions.x = 1
            cfg.dimensions.y = 0.0
        end

        if idx == 5 then
            cfg.dimensions.height = 1.1
            cfg.dimensions.width = 1.1
        end

        V.terminal.manager.terminals[idx] = fterm:new(cfg)
    end,

    toggle = function(idx)
        if not V.terminal.manager.terminals[idx] then
            V.terminal.manager.create_instance(idx)
        end

        V.terminal.manager.terminals[idx]:toggle()
    end
}
