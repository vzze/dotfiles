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

call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'https://github.com/tpope/vim-surround' " ysw
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'mhinz/vim-startify'
Plug 'powerline/fonts'
Plug 'https://github.com/renerocksai/calendar-vim'
Plug 'https://github.com/yamatsum/nvim-cursorline'
Plug 'https://github.com/sbdchd/neoformat'
Plug 'ellisonleao/glow.nvim', {'branch': 'main'}

call plug#end()

nnoremap <C-t> :NERDTreeRefreshRoot<CR>
nnoremap <C-f> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F4> :TagbarToggle<CR>

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

nnoremap tn :tabnew<CR>
nnoremap td :tabclose<CR>

nnoremap src :CocCommand clangd.switchSourceHeader<CR>

nnoremap git :CocCommand git.browserOpen<CR>
nnoremap gtc :CocCommand git.chunkInfo<CR>

nnoremap cal :CalendarH<CR>
nnoremap caL :Calendar<CR>

nnoremap EX :E . <Bar> :NERDTreeRefreshRoot<CR>
nnoremap ex :e . <Bar> :NERDTreeRefreshRoot<CR>

nnoremap TEX :tabnew <Bar> :E . <Bar> :NERDTreeRefreshRoot<CR>
nnoremap tex :tabnew <Bar> :e . <Bar> :NERDTreeRefreshRoot<CR>

nnoremap term :terminal Powershell.exe<CR>
nnoremap ttn :tabnew <Bar> :terminal Powershell.exe<CR>
tnoremap <Esc> <C-\><C-n>

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

let g:python3_host_prog="C:/Users/Edi/scoop/apps/python/current/python.exe"
let g:python_host_prog="C:/Users/Edi/scoop/apps/python/current/python.exe"
let g:loaded_perl_provider=0
let g:loaded_ruby_provider=0

let g:startify_custom_header = [
	\ '                                    ',
	\ '              @99o..                ',
	\ '              `99   o               ',
	\ '               99.aad9.             ',
	\ '        "bad9999999999P             ',
	\ '               99                   ',
	\ '             od99o.                 ',
	\ '            99 99 9o        .o      ',
	\ '            `9999999     ,// `a     ',
	\ "          .ooP`99P'   .o%    ,@9.   ",
	\ '       .''       .oaadObooooa9999   ',
	\ "   . ~  .oad999999999999999999P'    ",
	\ "  \"soo999999999999999P\"'            ",
	\ '       ,.oaa99aooo.                 ',
	\ '     .  ,o9999999999.   o@@o        ',
	\ "     o o99'        `99   @@@        ",
	\ "     `99'       ,oda9'   \"'         ",
	\ '               0   a999o.           ',
	\ '               `.ao" `999,          ',
	\ '                      `999;         ',
	\ '                       999          ',
	\ "         o            ,99'          ",
	\ '          `9a,       ,9F            ',
	\ '            "*bo. ,g9"              ',
	\ ]

let g:airline_theme='purify'

:colorscheme default

autocmd vimenter * hi SignColumn ctermbg=NONE 
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
autocmd vimenter * hi DiffAdd ctermbg=NONE guibg=NONE
autocmd vimenter * hi Pmenu guibg=NONE ctermbg=NONE ctermfg=3 guifg=3
autocmd vimenter * hi CursorLineNr cterm=NONE
autocmd vimenter * hi CursorLine NONE

function! s:update_git_status()
    let g:airline_section_b="%{get(g:,'coc_git_status','')}"
endfunction

let g:airline_section_b = "%{get(g:,'coc_git_status','')}"

autocmd User CocGitStatusChange call s:update_git_status()

" CocInstall coc-discord-rpc
" CocInstall coc-git
" CocInstall coc-python needs jedi
" CocInstall coc-clangd also setup path
" CocInstall coc-pairs
" CocInstall coc-json this and tsserver just work
" CocInstall coc-tsserver
" CocInstall coc-powershell
" pip3 install jedi
" scoop install universal-ctags
