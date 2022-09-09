nmap <F4> :ZenMode<CR>

nnoremap file :NERDTreeToggle <Bar> :NERDTreeRefreshRoot<CR>

nnoremap <C-h>  :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>

nnoremap tn :tabnew<CR>
nnoremap td :tabclose<CR>

nnoremap src :CocCommand clangd.switchSourceHeader<CR>

nnoremap git :CocCommand git.browserOpen<CR>
nnoremap gtc :CocCommand git.chunkInfo<CR>

nnoremap term :terminal Powershell.exe<CR>
nnoremap ttn :tabnew <Bar> :terminal Powershell.exe<CR>
tnoremap <Esc> <C-\><C-n>

nnoremap <silent> K :call ShowDocs() <CR>

nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>

nnoremap <silent><leader>h <cmd>:FocusSplitLeft<CR>
nnoremap <silent><leader>j <cmd>:FocusSplitDown<CR>
nnoremap <silent><leader>k <cmd>:FocusSplitUp<CR>
nnoremap <silent><leader>l <cmd>:FocusSplitRight<CR>

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1):
            \ CheckBackSpace() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
