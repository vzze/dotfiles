local M = {}

M.setup = function()
    local gset = vim.api.nvim_set_var

    gset("coc_snippet_next"                       , '<tab>'                          )

    gset("airline_powerline_fonts"                , 0                                )
    gset("airline#extensions#tabline#enabled"     , 1                                )
    gset("airline_theme"                          , 'purify'                         )
    gset("airline_section_b"                      , "%{get(g:,'coc_git_status','')}" )

    gset("airline#extensions#tagbar#enabled"      , 1                                )
    gset("airline#extensions#tagbar#searchmethod" , 'scoped-stl'                     )
    gset("airline#extensions#tagbar#flags"        , 'fs'                             )

    gset("cursorword_disable_at_startup"          , false                            )

    gset("python3_host_prog"                      , "D:/scoop/apps/python/current/python.exe" )
    gset("python_host_prog"                       , "D:/scoop/apps/python/current/python.exe" )

    gset("loaded_perl_provider"                   , 0                                )
    gset("loaded_ruby_provider"                   , 0                                )
end

return M
