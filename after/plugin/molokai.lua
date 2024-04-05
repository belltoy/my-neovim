vim.cmd [[
    " Use xiyaowong/nvim-transparent instead
    " function! MyHi() abort
    "     hi SignColumn guibg=NONE
    "     hi VertSplit guibg=NONE
    "     hi LineNr guibg=NONE
    "     hi Normal guibg=NONE
    "     " hi Pmenu guibg=NONE
    " endfunction
    "
    " augroup MyColors
    "     autocmd!
    "     autocmd ColorScheme molokai call MyHi()
    " augroup END

    " doautocmd ColorScheme molokai
    " hi Visual guibg=#212c2e
    hi Visual ctermbg=238 guibg=#447078
    " hi @callback guibg=#a45bad guifg=#ffc8c8
    hi ErlangCallback guifg=#ffc8c8
    hi ErlangBehaviour guifg=#ffc8c8
    hi CurSearch ctermbg=238 guibg=#6638f0
    hi link @callback ErlangCallback
    hi link @callback_export ErlangCallback
    hi link @keyword_behaviour ErlangBehaviour
    hi link @behaviour_supervisor ErlangBehaviour
    hi link @map_key erlangMap
    hi link @map_update DiffChange
    hi link @function.builtin Constant
    hi GitSignsStagedAdd guibg=#afdf00
    hi GitSignsStagedChange guifg=#44403e guibg=#4581FF
    hi GitSignsStagedDelete guifg=#4b0028 guibg=#FF4545

    hi link GitSignsAdd GitSignsStagedAdd
    hi link GitSignsChange GitSignsStagedChange
    hi link GitSignsDelete GitSignsStagedDelete

    "GitSignsStagedAdd xxx guibg=#afdf00
    "GitSignsStagedChange xxx guifg=#44403e guibg=#4581ff
    "GitSignsStagedDelete xxx guifg=#4b0028 guibg=#ff4545
"
]]

--" GitSignsAdd    xxx cterm= gui=
--"                    links to DiffAdd
--" GitSignsChange xxx cterm= gui=
--"                    links to DiffChange
--" GitSignsDelete xxx cterm= gui=
--"                    links to DiffDelete
--" GitSignsChangedelete xxx cterm= gui=
--"                    links to GitSignsChange
--" GitSignsTopdelete xxx cterm= gui=
--"                    links to GitSignsDelete
--" GitSignsUntracked xxx cterm= gui=
--"                    links to GitSignsAdd
--" GitSignsAddNr  xxx cterm= gui=
--"                    links to GitSignsAdd
--" GitSignsChangeNr xxx cterm= gui=
--"                    links to GitSignsChange
--" GitSignsDeleteNr xxx cterm= gui=
--"                    links to GitSignsDelete
--" GitSignsChangedeleteNr xxx cterm= gui=
--"                    links to GitSignsChangeNr
--" GitSignsTopdeleteNr xxx cterm= gui=
--"                    links to GitSignsDeleteNr
--" GitSignsUntrackedNr xxx cterm= gui=
--"                    links to GitSignsAddNr
--" GitSignsAddLn  xxx cterm= gui=
--"                    links to DiffAdd
--" GitSignsChangeLn xxx cterm= gui=
--"                    links to DiffChange
--" GitSignsChangedeleteLn xxx cterm= gui=
--"                    links to GitSignsChangeLn
--" GitSignsUntrackedLn xxx cterm= gui=
--"                    links to GitSignsAddLn
--"
