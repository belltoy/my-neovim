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

    ignore_install = {},  -- List of parsers to ignore installing

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
      disable = {},
      extended_mode = true,
      max_file_lines = nil,
    },

    matchup = {
      enable = true, -- mandatory, false will disable the whole extension
      disable = {},  -- optional, list of language that will be disabled
      -- [options]
    },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },

    textobjects = {
      select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          -- You can optionally set descriptions to the mappings (used in the desc parameter of
          -- nvim_buf_set_keymap) which plugins like which-key display
          ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
          -- You can also use captures from other query groups like `locals.scm`
          ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
          ["im"] = { query = "@maybe_block", desc = "Select maybe block" },
        },

        -- You can choose the select mode (default is charwise 'v')
        --
        -- Can also be a function which gets passed a table with the keys
        -- * query_string: eg '@function.inner'
        -- * method: eg 'v' or 'o'
        -- and should return the mode ('v', 'V', or '<c-v>') or a table
        -- mapping query_strings to modes.
        selection_modes = {
          ['@parameter.outer'] = 'v', -- charwise
          ['@function.outer'] = 'V',  -- linewise
          ['@class.outer'] = '<c-v>', -- blockwise
        },
      },

      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]c"] = { query = "@case_clause", desc = "Next case clause"},
          ["]]"] = { query = "@class.outer", desc = "Next class start" },
          --
          -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
          ["]o"] = "@loop.*",
          -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
          --
          -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
          -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
          ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
          ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
          ["[c"] = { query = "@case_clause", desc = "Prev case clause"},
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
        -- Below will go to either the start or the end, whichever is closer.
        -- Use if you want more granular movements
        -- Make it even more gradual by adding multiple queries and regex.
        goto_next = {
          ["]D"] = "@conditional.outer",
        },
        goto_previous = {
          ["[D"] = "@conditional.outer",
        },
      },
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
