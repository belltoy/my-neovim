vim.api.nvim_create_augroup('erlang_config', { clear = true })

-- \\= equivalent to \\\{0,1\} in vimscript
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {
        '{ci{.*}\\=,sys{.*}\\=,rebar,reltool,vars{.*}\\=,elvis,app{.*}\\=}.config{.script,.example,.src}\\=',
        '{ci,sys,rebar,reltool,vars,elvis,app}{.*}\\=.config',
        '*/_build/**/{RELEASES,*.{rel,script,config}}',
        'rebar.lock',
        '*.app.src{.script}\\=',
        '*/priv/*.schema',
    },
    group = 'erlang_config',
    command = 'setlocal filetype=erlang',
})

vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
    pattern = '*.json{.*}\\=',
    command = 'setlocal filetype=json',
})

vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
    pattern = 'erlang_ls.config',
    command = 'setlocal filetype=yaml',
})

vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
    pattern = 'vm{.*}\\=.args{.*}\\=',
    command = 'setlocal filetype=config',
})
