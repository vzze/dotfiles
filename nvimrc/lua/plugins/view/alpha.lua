return {
    "goolord/alpha-nvim",
    config = function()
        local dashboard = require("alpha.themes.dashboard")

        local art = V.art.power

        if V.art.greeter.info then
            local time = os.date("*t")

            local left   = "V1602 "
            local middle = ""
            local right

            right = "Plugins: " .. tostring(
                #require("plugins.util") + #require("plugins.general") +
                #require("plugins.git") + #require("plugins.view") + #require("plugins.lsp")
                + 1 -- to account for lazy.nvim
            )

            local final  = ""

            if time.hour < 10 then middle = middle .. "0" .. time.hour .. ':'
            else middle = middle .. time.hour .. ':' end

            if time.min < 10 then middle = middle .. "0" .. time.min .. ':'
            else middle = middle .. time.min .. ':' end

            if time.sec < 10 then middle = middle .. "0" .. time.sec
            else middle = middle .. time.sec end

            final = middle .. final

            for _ = 1, (#art[1] - #middle) / 2 - #left, 1 do
                final = " " .. final
            end

            final = left .. final

            for _ = 1, (#art[1] - #middle) / 2 - #right, 1 do
                final = final .. " "
            end

            for _ = 1, V.art.greeter.separator, 1 do
                table.insert(art, #art + 1, [[]])
            end

            table.insert(art, #art + 1, final .. right)
        end

        math.randomseed(os.time())

        dashboard.section.header.val = art

        local custom_button = dashboard.button("vVv", "vVv")

        custom_button.on_press = function()
            print("V1602 by edi with much love")
        end

        dashboard.section.buttons.val = {
            dashboard.button("CR"     , "New File", "<cmd>ene<CR>"),
            dashboard.button("spc r"  , "Restore"),
            dashboard.button("spc t f", "Files"),
            dashboard.button("spc t g", "Grep Time"),
            dashboard.button("spc p"  , "Plugins"),
            dashboard.button("spc m"  , "Mason"),
            custom_button
        }

        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.cursor = 0
            button.opts.width = #art[1]
        end

        dashboard.section.header.opts.hl = "LineNr"

        vim.api.nvim_create_autocmd("User", {
            pattern = "AlphaReady",
            callback = function()
                vim.opt.showtabline = 0
            end
        })

        vim.api.nvim_create_autocmd("User", {
            pattern = "AlphaClosed",
            callback = function()
                vim.opt.showtabline = 2
            end
        })

        require("alpha").setup(dashboard.config)
    end
}
