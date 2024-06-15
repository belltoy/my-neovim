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

    " hi GitSignsStagedAdd guibg=#afdf00
    " hi GitSignsStagedChange guifg=#44403e guibg=#4581FF
    " hi GitSignsStagedDelete guifg=#4b0028 guibg=#FF4545

    " hi LineNr guibg=#232526
    hi link GitSignsAdd GitSignsStagedAdd
    hi link GitSignsChange GitSignsStagedChange
    hi link GitSignsDelete GitSignsStagedDelete
    hi GitSignsUntracked guifg=#fd971f

    hi BufferLineHintSelected guibg=#afdf00 guifg=#4581FF
    hi BufferLineWarningSelected guifg=#B3800C

    " hi link DiagnosticError ErrorMsg
    hi DiagnosticError guifg=#f92672
    hi DiagnosticHint guifg=#8cf8f7 guibg=#232526
    " hi link DiagnosticSignError ErrorMsg

    hi Added guifg=#afdf00 guibg=#232526
    hi GitSignsStagedAdd guifg=#afdf00 guibg=#232526
    hi Changed guifg=#4581FF guibg=#232526
    hi GitSignsStagedChange guifg=#4581FF guibg=#232526
    hi Removed guifg=#FF4545 guibg=#232526
    hi GitSignsStagedDelete guifg=#FF4545 guibg=#232526

    hi TodoBgFIX gui=bold guifg=#1b1d1e guibg=red
    hi TodoFgFiX guifg=red
    hi TodoSignFIX guifg=red

    hi link TroublePreview Visual

    " hi TelescopePreviewLine ctermbg=118 guibg=#616365
    " hi TelescopePreviewLine ctermbg=238 guibg=#403d3d
    hi! link TelescopePreviewLine IncSearch

    " Hide | split border
    " NOTE: note the significant whitespace after the '\' character
    set fillchars+=vert:\ 

    hi CurSearch gui=bold guifg=#005f00 guibg=#afdf00
    hi! link IncSearch CurSearch

    " hi TodoFgNOTE     guifg=#a6dbff
    " hi TodoFgNOTE     guifg=red
    " hi DiagnosticInfo guifg=red

    "GitSignsStagedAdd xxx guibg=#afdf00
    "GitSignsStagedChange xxx guifg=#44403e guibg=#4581ff
    "GitSignsStagedDelete xxx guifg=#4b0028 guibg=#ff4545
"
]]
