local M = {}
M.art = {
    {
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
        [[          `.'    .<a%WW@W#a<.      ```        ]]
    }
}

M.setup = function()
    local dashboard = require("alpha.themes.dashboard")

    math.randomseed(os.time())
    dashboard.section.header.val = M.art[1]

    dashboard.section.buttons.val = {
        dashboard.button("e", "New File", ":ene <BAR> startinsert <CR>"),
        dashboard.button("SPC t f", "Find File"),
        dashboard.button("SPC t g", "Find Word"),
    }

    dashboard.section.header.opts.hl = "LineNr"

    require("alpha").setup(dashboard.config)
end

return M;
