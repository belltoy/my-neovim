local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  -- ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {
    'rust', 'c', 'go', 'vim', 'lua',
    'clojure', 'cpp', 'elixir', 'erlang',
    'elm', 'java', 'json', 'json5', 'jsonc',
    'make', 'python', 'ruby',
    'regex', 'typescript', 'javascript', 'yaml', 'toml',
    'scala', 'proto', 'markdown'
  },
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
    disable = {},  -- optional, list of language that will be disabled
    -- [options]
  },
}
