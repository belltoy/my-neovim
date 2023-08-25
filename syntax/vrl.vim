if exists("b:current_syntax")
  finish
endif

syn keyword vrlKeywords abort as break continue else false for if impl in let loop null return self std then this true type until use while

syn match vrlComment "#.*$" contains=@Spell

syn match     vrlFuncCall    "\w\(\w[!?]\?\)*("he=e-1,me=e-1

syn match     vrlOperator     display "\%(+\|-\|/\|*\|=\|\^\|&\||\|!\|>\|<\|%\)=\?"

syn region    vrlString      start=+"+ skip=+\\\\\|\\"+ end=+"+
syn region    vrlString      start=+'+ skip=+\\\\\|\\'+ end=+'+
syn region    vrlHereString  start=+"""+ skip=+\\\\\|\\"+ end=+"""+ contains=vrlString
syn region    vrlHereString  start=+'''+ skip=+\\\\\|\\'+ end=+'''+ contains=vrlString

syn match vrlPathVariable "\.\w\+"


" Number literals
syn match     vrlDecNumber   display "\<[0-9][0-9_]*\%([iu]\%(size\|8\|16\|32\|64\|128\)\)\="
syn match     vrlHexNumber   display "\<0x[a-fA-F0-9_]\+\%([iu]\%(size\|8\|16\|32\|64\|128\)\)\="
syn match     vrlOctNumber   display "\<0o[0-7_]\+\%([iu]\%(size\|8\|16\|32\|64\|128\)\)\="
syn match     vrlBinNumber   display "\<0b[01_]\+\%([iu]\%(size\|8\|16\|32\|64\|128\)\)\="


hi def link vrlKeywords Keyword
hi def link vrlComment Comment
hi def link vrlFuncCall Function
hi def link vrlOperator Operator
hi def link vrlString String
hi def link vrlHereString String

hi def link vrlDecNumber       vrlNumber
hi def link vrlHexNumber       vrlNumber
hi def link vrlOctNumber       vrlNumber
hi def link vrlBinNumber       vrlNumber

hi def link vrlNumber        Number
hi def link vrlPathVariable  Identifier
