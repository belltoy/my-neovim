return {
  -- My plugins here
  'nvim-lua/popup.nvim', -- An implementation of the Popup API from vim in Neovim
  'nvim-lua/plenary.nvim', -- Useful lua functions used ny lots of plugins
  'nvim-tree/nvim-web-devicons',

  -- Bbye allows you to do delete buffers (close files) without closing your windows or messing up your layout.
  'moll/vim-bbye',

  -- Speed up loading Lua modules in Neovim to improve startup time.
  -- As of Neovim 0.9, this plugin is no longer required. Instead run:
  -- vim.loader.enable()
  --'lewis6991/impatient.nvim',

  'antoinemadec/FixCursorHold.nvim', -- This is needed to fix lsp doc highlight

  -- Start screen
  -- "goolord/alpha-nvim",
  -- 'mhinz/vim-startify',
  -- "glepnir/dashboard-nvim",

  'godlygeek/tabular',

  'preservim/vim-markdown',

  -- vim-polyglot
  -- A sold language pack for vim
  -- Including ftdetect, indent, syntax, and plugins for many languages
  -- Maybe conflict with nvim-treesitter
  'sheerun/vim-polyglot',

  'github/copilot.vim',

  'junegunn/vim-easy-align',

  -- tmux integration
  'tmux-plugins/vim-tmux',
  'christoomey/vim-tmux-navigator',
  -- "alexghergh/nvim-tmux-navigation",
  -- "edkolev/tmuxline.vim",

  -- Conflict with Copilot, disable for now
  -- cmp plugins
  -- "hrsh7th/nvim-cmp",         -- The completion plugin
  -- "hrsh7th/cmp-buffer",       -- buffer completions
  -- "hrsh7th/cmp-path",         -- path completions
  -- "hrsh7th/cmp-cmdline",      -- cmdline completions
  -- "saadparwaiz1/cmp_luasnip", -- snippet completions
  -- "uga-rosa/cmp-dictionary",  -- dictionary completions
  -- "hrsh7th/cmp-nvim-lsp",
  -- "dmitmel/cmp-cmdline-history",

  -- snippets
  'L3MON4D3/LuaSnip', --snippet engine
  'rafamadriz/friendly-snippets', -- a bunch of snippets to use

  -- Vim plugin for automatically highlighting other uses of the word under the cursor.
  -- Integrates with Neovim's LSP client for intelligent highlighting.
  {
    'RRethy/vim-illuminate',
    config = function()
      require('illuminate').configure({
        filetypes_denylist = {
          'NvimTree',
          'aerial',
          'trouble',
          'markdown',
          'help',
          'lazy',
          'checkhealth',
          'neo-tree',
        }
      })
    end
  },

  'ckipp01/stylua-nvim', -- Lua code formatter

  'gpanders/editorconfig.nvim',

  'rainbowhxch/accelerated-jk.nvim',

  'tiagovla/scope.nvim',

  'norcalli/nvim-colorizer.lua',

  'wakatime/vim-wakatime',

  -- 'bronson/vim-trailing-whitespace',

  -- Standalone UI for nvim-lsp progress
  {
      'j-hui/fidget.nvim',
      tag = "legacy",
      event = "LspAttach",
      opts = {
        -- options
      },
  },

  -- Rusty Object Notation
  'ron-rs/ron.vim',

  'folke/zen-mode.nvim',
  -- 'nicwest/vim-http',
  'skreuzer/vim-prometheus',

  'mrjones2014/smart-splits.nvim',

  'gleam-lang/gleam.vim',

  'belltoy/prom.vim',

  'belltoy/vrl.vim',

  'imsnif/kdl.vim',

  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      direction = 'float',
      open_mapping = [[<M-\>]],
    },
  },
}
