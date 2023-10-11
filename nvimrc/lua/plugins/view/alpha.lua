return {
    'goolord/alpha-nvim',
    config = function()
        local art = {
            [[  ";~~~~~~~~:~~~~~~~~~~~~::"~~~~~~~~~~~~:~~~~~~~~o   ]],
            [[  "-       :N"           +a'           *a.       *   ]],
            [[  "-     .oNuau.     -.`'<o-''~      "xxaN+`     *   ]],
            [[  "-    `xaauaao`    <+:;+;+;+u     -aNoxNa*     *   ]],
            [[  "-   "*<a<<<a<*"       <x        +<*x<<*a;u.   *   ]],
            [[  "-   ~:"-   -":-      `::'       :~:'   "~<'   *   ]],
            [[  "NNNNNNNNNNNNNNNNNNNNNNxuNNNNNNNNNNNNNNNNNNNNNNN   ]],
            [[  "888888Nxa8xN+<"o888NxN. uax8Nxa8xN<;~x88888888&   ]],
            [[  "888888o-~xx+:'.<:"<o*'   :x8o-~xx+:'.+::<N8888&   ]],
            [[  "88888o*a;.'' `'u:*x88<   88xuN;.'` `'o:ua88888N   ]],
            [[  -8888&u+<:<*o:'x8*'~&8<   8&u<<:;*u:.a8<':88888x   ]],
            [[  `8888888a+&"-~ `oa<:88<   8888a<a".- 'xx:<88888+   ]],
            [[   o88888ax+**a8+~~88N88<   8888N*ouNx'~&88u88888-   ]],
            [[   ~88888~~uxxxx*:<xxxxx:   xxxxxxxxx+;uxu"-8888a    ]],
            [[    u8&"`                                   `"&8-    ]],
            [[    `N88N~.<*+**********"   **+**********+.-N88<     ]],
            [[     'N88u8N"-aoo:.`*8&&<   8o~"&uu~' a8&88u88*      ]],
            [[   `:"<&8888N~-;~.''+.<<<   88a~~:-.''+.<+888o:""    ]],
            [[ ~:"uo-;&8N"-:'`~''<a~+N<   a"-"`.~'.uo-*&88x-;o<::. ]],
            [[o`  :u. 'a88&x+N.- *8*-&<   88&&8<".`u&::88+  :u.  -a]],
            [[~:"";.   `xx8o<+ua`'oa*8<   888<:;*o`:N8No;    ":"";`]],
            [[     <'.` '<"a8888x-N888<   888&&88a:*8*'*  '':-     ]],
            [[    `;<N8*"+  :a88888888<   888888888*. '+:x8o+~     ]],
            [[   <~   ;N:     ~o8888a;'  `-*&888N<'    `ua~  `:"   ]],
            [[   +'    `::'     ';x88N8~ x&&8&*~      -;~     -;   ]],
            [[    ~;.   '.~"".     ':uN8N8x+-     `~":.~    ~:.    ]],
            [[      -:"`';".--""""~~.''-"''.-~~"""~~`-;:..::'      ]],
            [[        `""~-'~~;' :''--""~~~-'-'-""~--.~"".         ]],
            [[            .~~~".''~"':;;-~:~ "---~"""~`            ]],
            [[                 ."::::::"":::::::~`                 ]],
        }

        local dashboard = require("alpha.themes.dashboard")

        if V.splash_screen.info == true then
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

            final = middle .. " " .. final

            for _ = 1, (#art[1] - #middle) / 2 - #left, 1 do
                final = " " .. final
            end

            final = left .. final

            for _ = 1, (#art[1] - #middle) / 2 - #right, 1 do
                final = final .. " "
            end

            for _ = 1, V.splash_screen.lines_sep, 1 do
                table.insert(art, #art + 1, [[]])
            end

            table.insert(art, #art + 1, final .. right)
        end

        math.randomseed(os.time())

        dashboard.section.header.val = art

        dashboard.section.buttons.val = {
            dashboard.button("SPC r"  , "Restore"),
            dashboard.button("SPC t f", "Files"),
            dashboard.button("SPC t g", "Grep Time"),
        }

        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.cursor = 0
            button.opts.width = #art[1]
        end

        dashboard.section.header.opts.hl = "LineNr"

        require("alpha").setup(dashboard.config)
    end
};
