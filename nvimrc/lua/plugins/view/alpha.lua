return {
    'goolord/alpha-nvim',
    config = function()
        local art = {
            [[                                               aN$8Nx                                       ]],
            [[                                             o%%$%$%%$o                                     ]],
            [[                                            *N&N$8o&%%x                                     ]],
            [[                                            *$ao#WNN%$u                                     ]],
            [[                                            o8aW%##N&&*                                     ]],
            [[                                           *oou*u##+NN*                                     ]],
            [[                                         *+*uu++o#%++*++*                                   ]],
            [[                         oox           *++u+u*u*8@@u*uu**+                           ox&&   ]],
            [[                    ***uo8W%$o*       ++uuuu++<oxuu+++*uuu<*            ,,       a&8%#W@@@o*]],
            [[         x8a  *++++++<<**oa&8uu***  *+*uuu+****W@@x+*+<uuuu+*          N$#$o  &$#$W@@@@@@@@N]],
            [[       x%@@W%$o*+   "+ + +   ***uuuu++uu*+<uuu8@@@*uuu<+*uuu*+    ****<#W%$%@W#@W8@@@@@@%8ao]],
            [[     x$@@@@@%WWo*< +  *  <      ++*uuu*+ <*uuN@@@8uuu*+ *+uuu++**uuuuu*< a%$###@@#%@%&x     ]],
            [[   x%@@@@@@@@$W$*$8N$&a  <         *++*  *++%@@@@%&a+<u   +*u*uuu** *$ $%a#$$Nauuou*        ]],
            [[*a%@@@@@@@@@@WWW%8$%W%@N*+                ,u@@@@@@@W+*      *****  o&@8@@@$@@$x             ]],
            [[ $@@@@@@@@@#@@@@#8%#$W@@8$               +;::<*oN$W$               a#@%W@@%W@%W#a*          ]],
            [[  $@@@@@@%%@@@@$%#@@$W%%@@              "...'''...::"                &@@W#@W#$W@@#a         ]],
            [[   #@@@%%@@@WN 8@@@@8@@@@@o            <'..::.''....-                 o#@@@@@@#%@@@#x       ]],
            [[    W##@@@WN   oW@@@8@@@@@&            *&%W@@@#&o"..-                   $@@@@@@@$W@@@       ]],
            [[    oN#@@&      o@@@$@@@@@%*           *@@@@@@@@@@$--                    *oa&%W@@%#@a       ]],
            [[      "No        x@@@@@@@@@o            &@@%8$%$W@@8*                         *oNNao        ]],
            [[                  x@@@@@@@@$*           *+uaNNx-xN%&                                        ]],
            [[                   o$%8Naxo              x@@@@@&#8x"                                        ]],
            [[                                          ox*++xW@%*                                        ]],
            [[                                          *xW@@oo*<                                         ]],
            [[                                           u@@@8@&u                                         ]],
            [[                                           +a8$N%*                                          ]],
            [[                                           '...'~+                                          ]],
            [[                                           .'''''                                           ]],
        }

        local dashboard = require("alpha.themes.dashboard")

        if V.greeter.info == true then
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

            for _ = 1, V.greeter.separator, 1 do
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
            dashboard.button("CR"    , "New File", "<cmd>ene<CR>"),
            dashboard.button("\\ r"  , "Restore"),
            dashboard.button("\\ t f", "Files"),
            dashboard.button("\\ t g", "Grep Time"),
            dashboard.button("\\ p"  , "Plugins"),
            dashboard.button("\\ m"  , "Mason"),
            custom_button
        }

        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.cursor = 0
            button.opts.width = #art[1]
        end

        dashboard.section.header.opts.hl = "LineNr"

        vim.api.nvim_command([[autocmd User AlphaReady  set showtabline=0]])
        vim.api.nvim_command([[autocmd User AlphaClosed set showtabline=2]])

        require("alpha").setup(dashboard.config)
    end
};
