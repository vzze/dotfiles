return {
    'goolord/alpha-nvim',
    config = function()
        vim.api.nvim_command([[autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2]])
        local art = {
            [[    `-'`                                ~;    ]],
            [[     ~~~-`                           'x#@x    ]],
            [[$####x~~~~;&###########W###########8NW@@#&###$]],
            [[%%<ua8x"~~~~;a88888888$#&88888888NN#@@@$a8&a&%]],
            [[%@+~~"*au"~~~~oN888888$W8888888&o%@@@$NNN8%W&%]],
            [[%@&*~~~~:uo:~"<~+N8888$W88888&N%*$@8aa8#@@Wo@%]],
            [[%#&8u"~~~~~+x<+~~~<N88$W888&N%@@*aaN$@@@@%a&@%]],
            [[%x~:<**;~~~~*<x+~~~~<N$W8&N%@@#&ax*@@@@8aa&8&x]],
            [[%@u~~~~:++:~+~~;o*"~~~+8o$@@%&a&#Nx@$No8#@@%8%]],
            [[%#NN;~~~~~+u*<~~~:ou";a$+W$Na&W@@ooxa$@@@@&a@%]],
            [[%#~;*u*;~~~+~+*;~~~+&#@&uNa&W@W8xNN*#@@$&x&&o%]],
            [[%@o"~~~:<;;:<~~:++o#@@$Nao8@#&o8#@oa$ax8$@@8$%]],
            [[%@NN;~~~~~*;*<~~~<#@%aa8W*Naa$@@#xuuxW@@@WNa@%]],
            [[%W88$&+~~~:<~~<+;*WN&8W@NNa%@W8aN$Wo8@@#&&##@%]],
            [[%W;~~";**+:<:~~~"uaN#@$aau&%Nx8W@@ax%8aa&$%$x%]],
            [[%@&o"~~~~~<oo+"~~a8@%aa%%uox%@@@%&xoa$W@@@$x@%]],
            [[%@&88o<~~~~*~"+u*x#Nx%@8o&uN@$&xN8&uW@@W$N&&@%]],
            [[%@&+"";<<<<;<~~~"uo8@8x8#N*&x&8W@Woa$NxN88&u@%]],
            [[%@&8x:~~~~~ouu+:~oW%xN##&axNW@@%8aox$W@@@8N&@%]],
            [[%@&888x<~~~:<~:+ooNx%$NN&Nu%8&xN8$o&@@#8N88&@%]],
            [[%@&8x"~:<<<;+<~~~u8$xN$@8axa&$W@Wxu8axN8$xN&@%]],
            [[%@&888u"~~~~<*;;+uo&#$$NNuo@@%$Nxxa%@@@$N88&@%]],
            [[%@&8888xou*;"+"~<o8&x&8#a*Nxx&$W8u%$8&aa888&@%]],
            [[%@&8888&<~~:++a+uo&$%$&xoN%@W$$NaoN8$$a&888&@%]],
            [[&@#%88888a*:~~;<o8NxN$8xu8axa88*a@@$&N8888$#@&]],
            [[ `:o$W#$8xuuu*<ua$%$8axN&$W@%8x*xxxNNN$#W$x;' ]],
            [[     ':o$W8u~~<o&xN8$8uxNaaNx*&@@@#$$$x;'     ]],
            [[         ';x$&N8%#$8&NxN&88NoxxxxNu;'         ]],
            [[            -ox*N#%$88$W&8$%W%*..-'           ]],
            [[          `.'    .<a%WW@W#a<.      ```        ]],
        }

        local dashboard = require("alpha.themes.dashboard")

        if _G.V.splash_screen.info == true then
            local time = os.date("*t")

            local left   = "V1602 "
            local middle = ""
            local right

            right = "Plugins: " .. tostring(
                #require("plugins.misc") + #require("plugins.util") + #require("plugins.general") +
                #require("plugins.git") + #require("plugins.view") + #require("plugins.lsp")
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

            for _ = 1, _G.V.splash_screen.lines_sep, 1 do
                table.insert(art, #art + 1, [[]])
            end

            table.insert(art, #art + 1, final .. right)
        end

        math.randomseed(os.time())
        dashboard.section.header.val = art

        dashboard.section.buttons.val = {
            dashboard.button("r  ", "  Restore", "<cmd>lua require(\"persistence\").load()<cr>"),
            dashboard.button("SPC t f  ", "  Files"),
            dashboard.button("SPC t g  ", "  Grep Time"),
        }

        dashboard.section.header.opts.hl = "LineNr"

        require("alpha").setup(dashboard.config)
    end
};
