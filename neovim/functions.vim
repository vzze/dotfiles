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
