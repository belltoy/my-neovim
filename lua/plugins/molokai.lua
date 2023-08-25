-- hi MatchParen cterm=NONE ctermbg=13
vim.api.nvim_command [[ hi MatchParen cterm=reverse ctermbg=82 ctermfg=22 ]]
vim.api.nvim_command [[ hi Visual guibg=#403D3D ctermbg=238 ]]

-- " for background transparency
vim.api.nvim_command [[ hi Normal guibg=NONE ctermbg=NONE ]]

-- " set background=dark

vim.api.nvim_command [[ hi DiffAdd                      guifg=#f0cdc9     guibg=#567c44 ]]
vim.api.nvim_command [[ hi DiffChange                   guifg=#fefefe     guibg=#404ea4 ]]
vim.api.nvim_command [[ hi DiffDelete     gui=bold      guifg=#c3c3c3     guibg=#a22e26 ]]
vim.api.nvim_command [[ hi Normal guifg=#D4D4D4 guibg=#1E1E1E]]

return {}
