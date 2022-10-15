local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    return
end

configs.setup({
    -- ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = {
        'rust',
        'bash',
        'latex',
        'css',
        'c',
        'cmake',
        'go',
        'gomod',
        'vim',
        'lua',
        'clojure',
        'cpp',
        'elixir',
        'erlang',
        'dockerfile',
        'eex',
        'elm',
        'java',
        'json',
        'json5',
        'jsonc',
        'fish',
        'http',
        'html',
        'make',
        'python',
        'ruby',
        'regex',
        'typescript',
        'javascript',
        'yaml',
        'toml',
        'swift',
        'scala',
        'proto',
        -- 'markdown', -- temporarily disabled due to a code block syntax highlight bug in nvim-treesitter
        'markdown_inline',
    },
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { '' }, -- List of parsers to ignore installing
    autopairs = {
        enable = true,
    },
    highlight = {
        enable = true, -- false will disable the whole extension
        -- disabled rust to prevent code block highlighting in comments
        disable = { "json", "rust" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { 'yaml' } },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    rainbow = {
        enable = true,
        disable = { },
        extended_mode = true,
        max_file_lines = nil,
    },
    matchup = {
        enable = true, -- mandatory, false will disable the whole extension
        disable = {}, -- optional, list of language that will be disabled
        -- [options]
    },
})
