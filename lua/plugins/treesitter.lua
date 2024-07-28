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
      'vimdoc',
      'query',
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
      'norg',
      -- 'markdown', -- temporarily disabled due to a code block syntax highlight bug in nvim-treesitter
      'markdown_inline',
    },
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { }, -- List of parsers to ignore installing
    autopairs = {
      enable = true,
    },
    highlight = {
      enable = true, -- false will disable the whole extension
      -- disabled rust to prevent code block highlighting in comments
      -- disable = { "json" }, -- list of language that will be disabled
      additional_vim_regex_highlighting = true,
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

  vim.opt.foldmethod = 'expr'
  vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
  vim.opt.foldenable = false

  -- vim.cmd[[
  -- set foldmethod=expr
  -- set foldexpr=nvim_treesitter#foldexpr()
  -- set nofoldenable                     " Disable folding at startup.
  -- ]]
end

return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      local configs = require('nvim-treesitter.configs')
      setup(configs)
      -- nvim-ts-context-commentstring is set up automatically
      setup_local_parser()
      vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
        pattern = '*/queries/*.scm',
        command = 'setlocal filetype=query',
      })
    end
  },

  {
    'nvim-treesitter/nvim-treesitter-textobjects',
  }
}
