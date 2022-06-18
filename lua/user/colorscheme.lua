vim.cmd [[
try
  " colorscheme darkplus
  colorscheme molokai
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
