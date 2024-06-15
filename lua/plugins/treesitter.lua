local setup = function(configs)
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
          -- 'erlang',
          'dockerfile',
          'eex',
          'elm',
          'java',
          'json',
          'json5',
          'jsonc',
          'jq',
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
      custom_captures = {
        -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
        ["callback"] = "ErlangCallback",
        -- ["function.builtin.otp"] = "Constant",
        -- ["function.built.otp"] = "Constant",
        ["callback.export"] = "ErlangCallback",
        ["behaviour"] = "ErlangBehaviour",
      },
      indent = { enable = true, disable = { 'yaml' } },
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

  vim.cmd[[
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
  set nofoldenable                     " Disable folding at startup.
  ]]
end

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local configs = require('nvim-treesitter.configs')
    setup(configs)
    require('nvim-treesitter.configs').setup {}
    -- nvim-ts-context-commentstring is set up automatically
  end
}
