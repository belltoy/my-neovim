vim.cmd [[
  set keywordprg=erl\ -man
  if exists("loaded_matchit")
      let b:match_words = ',\<receive\>\|\<case\>\|\<if\>\|\<fun\>:\<after\>\|\<of\>\|->:\<end\>,\<maybe\>:\<else\>:\<end\>,\<begin\>:\<end\>,\<try\>:\<of\>:\<catch\>:\<after\>:\<end\>'
  endif
]]

vim.cmd [[
  hi @erlang.spec guibg=#333000
  hi @erlang.record_decl guibg=#333666
]]
