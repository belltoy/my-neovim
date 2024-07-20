return {
  -- My plugins here
  'nvim-lua/popup.nvim', -- An implementation of the Popup API from vim in Neovim
  'nvim-lua/plenary.nvim', -- Useful lua functions used ny lots of plugins
  'nvim-tree/nvim-web-devicons',

  -- Bbye allows you to do delete buffers (close files) without closing your windows or messing up your layout.
  'moll/vim-bbye',

  'antoinemadec/FixCursorHold.nvim', -- This is needed to fix lsp doc highlight

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
          'lspinfo',
          'alpha',
          'toggleterm',
        }
      })
    end
  },

  'ckipp01/stylua-nvim', -- Lua code formatter

  'gpanders/editorconfig.nvim',

  'rainbowhxch/accelerated-jk.nvim',

  'tiagovla/scope.nvim', -- Enhanced Tab Scoping

  'norcalli/nvim-colorizer.lua',

  'wakatime/vim-wakatime',

  -- Rusty Object Notation
  'ron-rs/ron.vim',

  'folke/zen-mode.nvim',
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

  'mikinovation/nvim-gitui',
}
