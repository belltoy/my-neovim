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
]]
