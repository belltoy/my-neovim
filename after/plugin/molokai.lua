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
    hi link @callback ErlangCallback
    hi link @callback_export ErlangCallback
    hi link @keyword_behaviour ErlangBehaviour
    hi link @behaviour_supervisor ErlangBehaviour
    hi link @map_key erlangMap
    hi link @map_update DiffChange
    hi link @function.builtin Constant
]]
