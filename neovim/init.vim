" TSInstall all
" CocInstall coc-git coc-python coc-clangd coc-pairs coc-json coc-tsserver coc-powershell
" pip3 install jedi
" scoop install universal-ctags

:set number
:set relativenumber
:set autoindent
:set expandtab
:set tabstop=8
:set shiftwidth=4
:set smarttab
:set softtabstop=1
:set mouse=a
:set encoding=UTF-8
:set clipboard+=unnamedplus
:set signcolumn=yes
:set completeopt-=preview
:set nobackup
:set nowritebackup
:set updatetime=300

:colorscheme default

call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'vim-airline/vim-airline'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'neoclide/coc.nvim'
Plug 'terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/zen-mode.nvim'
Plug 'tpope/vim-surround'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'goolord/alpha-nvim'
Plug 'tpope/vim-repeat'
Plug 'lewis6991/impatient.nvim'
Plug 'mcauley-penney/tidy.nvim'
Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
Plug 'folke/twilight.nvim'
Plug 'beauwilliams/focus.nvim'
Plug 'NMAC427/guess-indent.nvim'
Plug 'kg8m/vim-simple-align'

call plug#end()

lua << EOF
    require("impatient")

    require("tidy").setup()

    require("zen-mode").setup {
        window = {
            backdrop = 1,
            width = 1,
            height = 1
        },
    }

    require("twilight").setup {}

    require("focus").setup()

    require('guess-indent').setup {}

    vim.api.nvim_set_keymap('n', '<leader>h', ':FocusSplitLeft<CR>', { silent = true })
    vim.api.nvim_set_keymap('n', '<leader>j', ':FocusSplitDown<CR>', { silent = true })
    vim.api.nvim_set_keymap('n', '<leader>k', ':FocusSplitUp<CR>', { silent = true })
    vim.api.nvim_set_keymap('n', '<leader>l', ':FocusSplitRight<CR>', { silent = true })

    local dashboard = require("alpha.themes.dashboard")

    local LogoTable = {
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
        },
        {
            [[                                                            ]],
            [[                             `     .'                       ]],
            [[        `                             '`'`       ``         ]],
            [[       -`      ' `                         ```    .'        ]],
            [[      -~`   '"`                             `'.'  `-`       ]],
            [[     `-:`''``  `                       ` ```'''`-'`..`      ]],
            [[     .::~~.'````       ``'.'''.''''           ..~~:;;`      ]],
            [[   `-<<:~`                `.~"".'`               `-""~'     ]],
            [[  "~~-:``                `'`   `.'                `'"":~    ]],
            [[`''`'''                          ```               `-.~-;'  ]],
            [[   `` -                            ``              `` `' `  ]],
            [[   .  '.                                            `  '   .]],
            [[  `.   ``                             `                .    ]],
            [[  `'                                   `               `    ]],
            [[   .              `                     '              '    ]],
            [[   .`       `    ``                     ``             '    ]],
            [[   .`        '``'-                      `'''`          -    ]],
            [[    `           -"-`                    -:`'          ``    ]],
            [[                 `'``                 '`.-           `      ]],
            [[     ''           `                     ``          ``      ]],
            [[      ``                                           `        ]],
            [[       `.`                             `                    ]],
            [[                                                 `          ]],
            [[           `'`                                `             ]],
            [[              `''    ```           `'    '``''              ]],
            [[                .'.'```'`'     '''```..`-~`                 ]],
            [[                     `..`-:;".;""-'`'``                     ]],
            [[                      `'"~~-'-::"'`                         ]],
            [[                  `'''.'        `-` `'.`                    ]],
            [[                                                            ]]
        },
        {
            [[                                                    ]],
            [[                                    `               ]],
            [[                                   `-               ]],
            [[                                   ."               ]],
            [[               .-'`'``' `'.     ` `-;`              ]],
            [[          `'`-..--~;~~-''.'````''~-":'`             ]],
            [[        `.~:";":<-~"~~``        `'~+o;~''`          ]],
            [[       `.":;"."".'''`'            `"+-"";-`         ]],
            [[    ```'-":"....`                  -+'``':~:'       ]],
            [[  `.""~;:..``                      -;``` `.~"'      ]],
            [[  '-";<"~-.                        ~:`     `-~`     ]],
            [[ ``~*-.'``                         ~;       `''`    ]],
            [[`'-;<.``                           :;`      ``''.'  ]],
            [[ `.;;.`                           ';<`       ``~:-` ]],
            [[ `.;-`                            .;:'`      -~.:~` ]],
            [[  ``                              -<"~'      `''--' ]],
            [[ `'~`                             '"".`       `~-.~']],
            [[ `';"`                            '";-`       `."-~']],
            [[ `.'.`                            ."~'        `~<-'`]],
            [[  '.'.                            `-.`        '..''`]],
            [[   '''`                            ``         -.'`  ]],
            [[   `'```                           `        `-<-`   ]],
            [[    `~~.`                         `.'     `--"'`    ]],
            [[     `';~'`                        `     `'.-'`     ]],
            [[     `..~~.`                            .~-'`       ]],
            [[        `':::.'`                  '.-''-"~`         ]],
            [[           `':"+.`'''       '~.'.~:~--~-"'          ]],
            [[              `'"..-:~"-"''.~~;"~:~:~~'``           ]],
            [[                `  ``''.'...~."~~-..```             ]],
            [[                            `   ``                  ]]
        },
        {
            [[                        `.                         ]],
            [[                        ';                         ]],
            [[                       `.-`                        ]],
            [[                      `'~+'`                       ]],
            [[                     `':ux;'``                     ]],
            [[                 `.:;<xN$%xo~<;``                  ]],
            [[               `'.;.:~<"NN~;..:'':''`              ]],
            [[            `.``` ````'.<u.`    `'``````           ]],
            [[       `''''``         `;+'           ````         ]],
            [[     `.~:'`            `"-`             ```        ]],
            [[    `"-:'`             `-;`                        ]],
            [[   `"+:'                :`                  ```    ]],
            [[  `';'`                 '`                  `..`   ]],
            [[  `:'`                  `                   `.;.`  ]],
            [[ `~;'`                  ``                   .;:'` ]],
            [[`'~:'`                  ``                   `:;:' ]],
            [[`:":`                   ``                   `.+*' ]],
            [[';x~`                    `                   `'+*'`]],
            [['-x-:`                  ``                   ':~+.`]],
            [[`.-;'                   `                    ';<;` ]],
            [[ `.;'                   '`                  ``:;'  ]],
            [[   .``                  :'                   `'`   ]],
            [[   `''                  '.                  .'     ]],
            [[     `'`                ':                 `'      ]],
            [[      `.'`             `;"               '.        ]],
            [[       `.';:'``        `-+'         ``  ``         ]],
            [[         `'~""~;.'`````.**.````'``';;'`            ]],
            [[           `':-<++<"---"ao-;--;--;::-.             ]],
            [[              `';:-;~+oo%Nxo+~:'```                ]],
            [[                   ``'.-N*;.```                    ]],
            [[                       '~-`                        ]],
            [[                        ..                         ]]
        },
        {
            [[                                                  ]],
            [[                   `          `                   ]],
            [[                    ``      ''                    ]],
            [[                 ```':.    `::.`                  ]],
            [[              ```.-;;;'    `...:...''``           ]],
            [[           ``.'.:.'''`        ```.'.''.```        ]],
            [[       ```''..`                     ``'..'``      ]],
            [[      `':.'`                          `''..''`    ]],
            [[   ` `''.'`                               `...`   ]],
            [[    `''`                                   `.:'`  ]],
            [[   `.'`                                     `.''` ]],
            [[  `.'                    ``                  '.''`]],
            [[  `'                     .'                  `.::']],
            [[ `'`                    `:'                   ``'`]],
            [[``'                     ';.                     ` ]],
            [[ `'`                    '..                    `' ]],
            [[ ```                     ::`                   `. ]],
            [[  ```                    ..                   `.' ]],
            [[  `''`                   ''                   ''' ]],
            [[   `'.`                  ''                   `:` ]],
            [[    '''                  `'                  `'`  ]],
            [[    `':`                  `                `..`   ]],
            [[     `'.'``                              ''.'     ]],
            [[      ``''.``                           '.'`      ]],
            [[        `'''.:.```                ` ''':''`       ]],
            [[         ````''..:'```        ``'''..''``         ]],
            [[             ```':;:..'     `..:.`````            ]],
            [[                   ``''`    ..'`                  ]],
            [[                     ``     ``                    ]],
            [[                    `         `                   ]]
        },
        {
            [[                                                  ]],
            [[               `                                  ]],
            [[               ''    ```                          ]],
            [[             ``..``';<+-~;.''``                   ]],
            [[         `''.~-----~+~:..:~---;;.'                ]],
            [[       ``'.<u+<---~-:'``  ````'.''''`             ]],
            [[       `':~u";."-.``                 `.:``        ]],
            [[     ```'..-"-'+-'                    `.;*'       ]],
            [[  ``'.;:..:;.``:.`                      '-~'      ]],
            [[ ``';"".```    ''                         '''     ]],
            [[ ``'~*"`       .:                          ``.``  ]],
            [[ ``'.+--'`     ..                            ;;'  ]],
            [[  ``.'-;`      '.                            .-`` ]],
            [[ ``::'.`       '`                            '".'`]],
            [[':"+:`         ``                            `:<'`]],
            [[':<"~;`         `                            `-+:`]],
            [[ ':"~-:'                                      '-` ]],
            [[ ``'':~'       ``                             '.' ]],
            [[   `.''`       `'                            `''  ]],
            [[ ``';;`        ':                           `~~'` ]],
            [[  `:"~;`       ''                           `.: ` ]],
            [[  '.-<~-:''`` `'`                          `.;'   ]],
            [[  `'':;~<~"~:'':.`                      `''':.    ]],
            [[    ``'..'':~;.:;.`                   '~-;;:.     ]],
            [[        `````'.:-;''''``      `:;:.`''.'`         ]],
            [[             ``.~;'-<+--.``'`..~;;;;::`           ]],
            [[               .'``''`."~;:''.'```````            ]],
            [[               ``     ``````                      ]],
            [[               `                                  ]],
            [[                                                  ]]
        },
        {
            [[             `                                      ]],
            [[             '`                                     ]],
            [[             ;'                                     ]],
            [[             ;'                ``                   ]],
            [[             +:    ``'';.`.:'.::'```                ]],
            [[            '*;``'.~";.;.-";--+~.;:'''`` '` `       ]],
            [[           `.+~:.'.-:;;;:'':--:.:--""~:'.:.''`      ]],
            [[         ''.-*":;.''''````````'`'``':<ou<~~;:'``    ]],
            [[      `''.''.~"'```   `    ``       `':<**""+":``   ]],
            [[     '.-.'``'~-'           `          `';<<+oo<;'   ]],
            [[  ``';<:`````--`                       `'.;;uN*":`` ]],
            [[ `'.;;;'`   `::                          `'.~ao+-'' ]],
            [[ `;~o*:`     '.                           `.;+ax":.`]],
            [[`:<o<:`      '`                            `.~oo+";']],
            [[`;uN".       ``                            `';"a*--.]],
            [['<xN":       `                              `;<a+"<.]],
            [[`;<*~'       `                               .-+&+;`]],
            [[`."u;'       `                              `';oo~.`]],
            [[`'-o;'       `                              ``;ux;' ]],
            [[ `'o~.`      `                             ``'.~".` ]],
            [[  `-x;`      '`                           ':'':;:`  ]],
            [[  `'~".`     .`                       `'`:<+:---'`  ]],
            [[   `';.'`    :`                      '''`';..;<"'   ]],
            [[    `'.;'````;'                        `.-~'..-;`   ]],
            [[     `'.;.'`'".`                     `';-~~-.``     ]],
            [[      ``..:'.+-`                ````..;;;;':'       ]],
            [[       ```.~;u".'`      `'``;.'''..-~:''``          ]],
            [[          ``.~~...':.:;~.;~.;*~;~.:'``              ]],
            [[            '":```':~'.;-~.'..'.'```                ]],
            [[            `;;`  ``````'``` ````                   ]],
            [[             .'       `                             ]],
            [[             .`                                     ]],
            [[             '                                      ]]
        },
        {
            [[                      ``                     ]],
            [[                      `'                     ]],
            [[            ``'```.-"':&<'~~.'`              ]],
            [[                   `-;&u"                    ]],
            [[                      "-                     ]],
            [[                      '`                     ]],
            [[                      -                      ]],
            [[                      a"                     ]],
            [[                     `N~.`                   ]],
            [[                `"".'.+~""<;"`               ]],
            [[              `"~` ` `N- `  `-"'             ]],
            [[             `. `-~'`'a+:-;"-``"-            ]],
            [[            `- ":~.   "o  `-+&<''`           ]],
            [[            '-*~."'-~;oa-'..-";8*~           ]],
            [[           ."a.     '`<a;<'    ':<;-         ]],
            [[       `''. +-    '`  ;;  "~`   <" ~;"`      ]],
            [[        "-` :--`  `   ~'   '' `u<~`'`-'`     ]],
            [[     ` `*`  --.":"    ".    ~;".+;.  ~.      ]],
            [[       .+ .``"-  -<*+:<*~~-"*-`-<` ` ":      ]],
            [[        "'`  `~~`'.'''"'``'-< ""    `x~      ]],
            [[     ``  ~     `~.'` `-`  `+:-      ;" `     ]],
            [[         .:-``'`  `::.~-.:;`  '`  -:-        ]],
            [[          '.:<~~.` '~:uu*:` ``''::-          ]],
            [[          `   '-~""..`.~~~~-~-~.` ``         ]],
            [[`               `     '.`   ``   `           ]],
            [[ `                    `.   `  '.         `.~.]],
            [[     ```              `.    `         ~"~.`  ]],
            [[        '` `     ``   ''   ``    '''``       ]],
            [[              '~"~-'.~<;;::-'`` -`           ]],
            [[                      `                      ]]
        }
    }

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
EOF

nmap <F4> :ZenMode<CR>

nnoremap <C-f> :NERDTreeToggle <Bar> :NERDTreeRefreshRoot<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nnoremap <C-Left>  :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

nnoremap tn :tabnew<CR>
nnoremap td :tabclose<CR>

nnoremap src :CocCommand clangd.switchSourceHeader<CR>

nnoremap git :CocCommand git.browserOpen<CR>
nnoremap gtc :CocCommand git.chunkInfo<CR>

nnoremap term :terminal Powershell.exe<CR>
nnoremap ttn :tabnew <Bar> :terminal Powershell.exe<CR>
tnoremap <Esc> <C-\><C-n>

nnoremap <silent> K :call ShowDocs() <CR>

nnoremap <leader> ff <cmd>Telescope find_files<CR>
nnoremap <leader> fg <cmd>Telescope live_grep<CR>
nnoremap <leader> fb <cmd>Telescope buffers<CR>
nnoremap <leader> fh <cmd>Telescope help_tags<CR>

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#_select_confirm() :
            \ coc#expandableOrJumpable() ?
            \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ CheckBackSpace() ? "\<TAB>" :
            \ coc#refresh()

let g:coc_snippet_next = '<tab>'

let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='purify'
let g:airline_section_b = "%{get(g:,'coc_git_status','')}"

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

let g:python3_host_prog="C:/Users/Edi/scoop/apps/python/current/python.exe"
let g:python_host_prog="C:/Users/Edi/scoop/apps/python/current/python.exe"

let g:loaded_perl_provider=0
let g:loaded_ruby_provider=0

let g:registers_return_symbol = "\\n"
let g:registers_tab_symbol = "\t"
let g:registers_show_empty_registers = 0
let g:registers_paste_in_normal_mode = 1

autocmd vimenter * hi SignColumn ctermbg=NONE
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
autocmd vimenter * hi DiffAdd ctermbg=NONE guibg=NONE

autocmd vimenter * hi Pmenu guibg=NONE ctermbg=NONE ctermfg=3 guifg=3
autocmd vimenter * hi PmenuSel guibg=NONE ctermbg=NONE ctermfg=121 guifg=121
autocmd vimenter * hi CocMenuSel guibg=NONE ctermbg=NONE ctermfg=121 guifg=121

autocmd vimenter * hi CursorLineNr cterm=NONE
autocmd vimenter * hi CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guifg=NONE

autocmd vimenter * hi Type cterm=italic ctermfg=121 gui=italic guifg=121
autocmd vimenter * hi Keyword cterm=italic ctermfg=11 gui=italic guifg=11
autocmd vimenter * hi PreProc cterm=italic ctermfg=12 gui=italic guifg=12

autocmd vimenter * hi Twilight ctermfg=8

autocmd vimenter * TSEnable highlight

autocmd User CocGitStatusChange call Update_git_status()

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
autocmd User AlphaReady set laststatus=0 | autocmd BufUnload <buffer> set laststatus=2
autocmd User AlphaReady set noruler | autocmd BufUnload <buffer> set ruler

function! High()
    :TSToggle highlight
endfunction

command -nargs=0 High call High()

function! Multiple_cursors_before()
    if exists(':CocDisable')==2
        exe 'CocDisable'
    endif
endfunction

function! Multiple_cursors_after()
    if exists(':CocEnable')==2
        exe 'CocEnable'
    endif
endfunction

function! Update_git_status()
    let g:airline_section_b="%{get(g:,'coc_git_status','')}"
endfunction

function! CheckBackSpace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! ShowDocs()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction
